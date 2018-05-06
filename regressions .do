set more off
sum any_coverage public_insurance private_insurance direct_purchase employer_insurance tricare medicare medicaid va indian_health expansion collegegraduate us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race [aw=hhwt]
tabout any_coverage public_insurance private_insurance direct_purchase employer_insurance tricare medicare medicaid va indian_health expansion collegegraduate us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race [aw=hhwt] using ds2.doc, replace

set more off
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state [aw=hhwt], robust
outreg2 using regoutput56789.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, All) 
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year if age>27 & age<65 [aw=hhwt], robust
outreg2 using regoutput56789.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, No, Ages, 27 to 64) append
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using regoutput56789.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, No, State FE, Yes, Ages, 27 to 64) append
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using regoutput56789.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>64 [aw=hhwt], robust
outreg2 using regoutput56789.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 65+) append

regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age<27 [aw=hhwt], robust
outreg2 using regoutput1545.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 0 to 26)




set more off
regress medicaid post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt]
outreg2 using typeweighted.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64)
regress medicare post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt]
outreg2 using typeweighted.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress public_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt]
outreg2 using typeweighted.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress private_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt]
outreg2 using typeweighted.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append


set more off
regress public_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state [aw=hhwt], robust
outreg2 using pubpriv257.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, All) 
regress private_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state [aw=hhwt], robust
outreg2 using pubpriv257.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, All) 
regress public_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using pubpriv257.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64)
regress private_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using pubpriv257.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64)
 
set more off
regress direct_purchase post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64)

set more off
regress employer_insurance post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress tricare post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress medicare post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress medicaid post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress va post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append
regress indian_health post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age > 26 & age < 65 [aw=hhwt], robust
outreg2 using type123.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64) append

set more off
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & native_american == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, Native American)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & asian == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, Asian)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & black == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, Black)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & pacific_islander == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, Pacific Islander)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & white == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, White)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children  i.year i.state if age > 26 & age < 65 & other_race == 1 [aw=hhwt], robust
outreg2 using byrace.doc, keep(postexpansionnotcollegegrad) addtext(Year FE, Yes, State FE, Yes, Ages, 27 to 64, Race, Other race)

graphs


clear
keep if age > 26
keep if age < 65
collapse any_coverage [aw=hhwt], by(collegegraduate year)
twoway (connected any_coverage year if collegegraduate == 1) (connected any_coverage year if collegegraduate == 0), ylabel(0.8 (0.05) 1, format(%9.2f)) title(Health Insurance Coverage Rates Over Time) ytitle(Portion of US Population Covered) xtitle(Year) legend(label(1 "College Graduate") label(2 "Not a college graduate")) note(Ages: 27 to 64. Data is weighted.) xline(2013)
twoway (connected public_insurance year) (connected private_insurance year), ylabel(0.25 (0.1) 0.75, format(%9.2f)) title(Health Insurance Coverage Rates Over Time) subtitle(Public vs. Private Insurance) ytitle(Portion of US Population Covered) xtitle(Year) legend(label(1 "Public Insurance") label(2 "Private Insurance")) xline(2013)

clear
use "/Users/Bradley/Documents/ECON 4880 Compressed Data. V2.dta"
keep if age > 26
keep if age < 65
collapse public_insurance private_insurance [aw=hhwt], by(year)
twoway (connected public_insurance year) (connected private_insurance year), ylabel(0.25 (0.1) 0.75, format(%9.2f)) title(Health Insurance Coverage Rates Over Time) subtitle(Public vs. Private Insurance) ytitle(Portion of US Population Covered) xtitle(Year) legend(label(1 "Public Insurance") label(2 "Private Insurance")) xline(2013) note(Ages: 27 to 64. Data is weighted.)

clear 
use "/Users/Bradley/Documents/ECON 4880 Compressed Data. V2.dta"
keep if age > 26
keep if age < 65
collapse employer_insurance direct_purchase medicare medicaid indian_health tricare va [aw=hhwt], by(year)
twoway (connected direct_purchase year) (connected medicare year) (connected medicaid year) (connected indian_health year) (connected tricare year) (connected va year), ylabel(0 (0.06) 0.18, format(%9.2f)) title(Health Insurance Coverage Rates Over Time) subtitle(Broken Down by Type) ytitle(Portion of US Population Covered) xtitle(Year) legend( label(1 "Privately Purchased") label(2 "Medicare") label(3 "Medicaid") label(4 "Indian Health") label(5 "Tricare") label(6 "Veterans Affairs")) xline(2013) note(Ages: 27 to 64. Data is weighted.)
twoway (connected employer_insurance year), ylabel(0 (0.1) 0.7, format(%9.2f)) title(Health Insurance Coverage Rates Over Time) subtitle(Employer Provided Insurance) ytitle(Portion of US Population Covered) xtitle(Year) legend( label(1 "Employer Provided")) xline(2013) note(Ages: 27 to 64. Data is weighted.)



sum any_coverage medicare
outreg2 using testsum.doc


// Naive DD//
set more off
regress any_coverage post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state [aw=hhwt], robust
outreg2 using simpledid.doc,  keep(postnotcollegegrad expansion) addtext(Ages, All)
regress any_coverage post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>26 & age<65 [aw=hhwt], robust
outreg2 using simpledid.doc,  keep(postnotcollegegrad expansion) addtext(Ages, 27 to 64)



gen educ2 = 0
replace educ2 = 1 if at_least_some_college == 0 // not some college
gen educ3 = 0
replace educ3 = 1 if at_least_hs_grad == 0 //not at least hs grad
sum educ2 educ3

gen posteduc2 = post*educ2
gen expansioneduc2 = expansion*educ2
gen postexpansioneduc2 = post*expansion*educ2

gen posteduc3 = post*educ3
gen expansioneduc3 = expansion*educ3
gen postexpansioneduc3 = post*expansion*educ3

regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using educlevels.doc, keep(postexpansionnotcollegegrad) addtext(XXX, XXX)
regress any_coverage post expansion educ2 postexpansion posteduc2 expansioneduc2 postexpansioneduc2 us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using educlevels.doc, keep(postexpansioneduc2) addtext(XXX, XXX)
regress any_coverage post expansion educ3 postexpansion posteduc3 expansioneduc3 postexpansioneduc3 us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using educlevels.doc, keep(postexpansioneduc3) addtext(XXX, XXX)

regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 & year < 2015 [aw=hhwt], robust
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust



regress any_coverage post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>26 & age<65 [aw=hhwt], robust
outreg2 using fulloutput.doc, keep(post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race) addtext(Model, DD)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65 [aw=hhwt], robust
outreg2 using fulloutput.doc, keep(post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race) addtext(Model, DDD)



regress any_coverage post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>26 & age<65, robust
outreg2 using unweightedfulloutput.doc, keep(post expansion noncollegegraduate postnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race) addtext(Model, DD)
regress any_coverage post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race i.year i.state if age>27 & age<65, robust [aw=hhwt]
outreg2 using unweightedfulloutput.doc, keep(post expansion noncollegegraduate postexpansion postnotcollegegrad expansionnotcollegegrad postexpansionnotcollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot unemployrate married children native_american asian black pacific_islander white other_race) addtext(Model, DDD)

