*! 1.0.0  18/may/2026

version 18
/*
Include a table of descriptive statistics for data from the 
Second National Health and Nutrition Examination Survey 
(NHANES II) (McDowell et al. 1981). 

Use -dtable- to create the table and export it to many formats. 
*/

use ../data/nhanes2l.dta, clear

/*
Format the means and standard deviations to two decimal places, add 
a title, and export the final table to an HTML file:
*/
dtable age weight bpsystol i.sex i.race, by(diabetes, nototals tests) ///
    continuous(age, test(none)) factor(race, test(none))              ///
    sample(, statistics(freq) place(seplabels))                       /// 
	sformat("(N=%s)" frequency) note(Total sample: N = 10,349)        ///
	column(by(hide)) nformat(%7.2f mean sd)                           ///
	title(Table 1. Demographics) export(../docs/table1.html, replace)

/*
Use -collect- Change the color of the borders and the background color 
for alternating rows in our table. 

Then export it to different formats
*/

* Change the border color above the corner and column headers to cyan
collect style cell border_block[column-header corner], border(top, color(cyan))

* Change the border color above and below the results and row headers to cyan
collect style cell border_block[row-header item], border(bottom, /// 
    color(cyan)) border(top, color(cyan))

* Make the column headers bold
collect style cell cell_type[column-header], font(, bold)

/*
Change the background color to cyan for the rows corresponding to N,
BMI, and cholesterol
*/
collect style cell var[_N bmi tcresult], shading(background(cyan))

/*
Finally, we specify that the width of the columns be resized to fit the table contents and export the table:
*/

collect style putdocx, layout(autofitcontents)

collect export ../docs/table1.docx, replace
collect export ../docs/table1.md, replace
collect export ../docs/table1.pdf, replace

* end