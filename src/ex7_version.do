*! 1.0.0  25may2026

/*
 * Stata's table command went through major changes in Stata 17, the following 
 * syntax no longer works in 17 without specifying version 16  
 */
sysuse auto
version 16
table rep78, contents(n mpg)

version 18
capture noi table rep78, contents(n mpg)
version 16 : table rep78, contents(n mpg)
