*! version 1.0.0 20may2026

/*
 * Compute the sample average and its estimated sampling variance, 
 * assuming an iid process
 */
program define mymean, eclass
        version 18
 
        syntax varname [if] [in]
 
		marksample touse
		
        tempvar e2 
        tempname b V
        quietly summarize `varlist' if `touse'
        local sum            = r(sum)
        local N              = r(N)
        matrix `b'           = (1/`N')*`sum'
        quietly  {
			generate double `e2' = 0
			replace `e2' = (`varlist' - `b'[1,1])^2 if `touse'
			summarize `e2' if `touse'
        }
        local sum            = r(sum)
        local N              = r(N)
		matrix `V'           = (1/((`N')*(`N'-1)))*r(sum)
        matrix colnames `b'  = `varlist'
        matrix colnames `V'  = `varlist'
        matrix rownames `V'  = `varlist'
        ereturn post `b' `V'
		di as smcl "{txt}{col 1}Mymean estimation{col 45}{lalign 13:Number of obs}{col 58} = {res}{ralign 2:`N'}"
        ereturn display, nopvalues
end