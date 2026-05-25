*! 1.0.0  25may2026

version 16

/*
 * calculate (X'X)^(-1)(X'y) 
 */
 
sysuse auto, clear
mata:
/* Create mata view into Stata data */
st_view(y=., ., "mpg")
st_view(X=., ., "price weight trunk")

/* Compute X'X */
XTX  = cross(X, X)

/* Compute inverse of X'X */
XTXi = invsym(XTX)

/* Compute b */
b    = XTXi*cross(X, y)
b
end 

quietly regress mpg price weight trunk, nocons
mat list e(b)

mata:
st_b =  st_matrix("e(b)")
mreldif(b, st_b')
end
