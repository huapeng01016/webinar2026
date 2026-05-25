*! 1.0.0  25may2026

version 16

/*
 * calculate (X'X)^(-1)(X'y) 
 */
 
sysuse auto, clear
mata:
/* Create mata matrix from Stata data */
y    = st_data(., "mpg")
X    = st_data(., "price weight")

/* Add a column of 1 */
X    = X, J(rows(X), 1, 1)

/* Compute X'X */
XTX  = cross(X, X)

/* Compute inverse of X'X */
XTXi = invsym(XTX)

/* Compute b */
b    = XTXi*cross(X, y)
b
end 

quietly regress mpg price weight
mat list e(b)

mata:
st_b =  st_matrix("e(b)")
mreldif(b, st_b')
end