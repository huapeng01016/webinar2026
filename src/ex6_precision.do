*! version 1.0.0  24may2026

clear
set obs 3
gen double x = 0.1
replace x = 0.2 in 2
replace x = 0.3 in 3
gen double y = 0.2
replace y = 0.3 in 2
replace y = 0.1 in 3
list
gen double sum_x = sum(x)
gen double sum_y = sum(y)
list
capture noi assert sum_x == sum_y in 3

gen double diff = sum_x - sum_y in 3
list
