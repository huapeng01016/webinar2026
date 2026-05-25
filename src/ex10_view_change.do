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

X1 = st_data(., "price weight trunk")

Xcopy = X
stata("drop headroom")

assert(Xcopy == X1)
assert(Xcopy == X)

end
