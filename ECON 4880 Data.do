clear all
cd "/Users/Bradley/Documents/HI4880Data"
do "/Users/Bradley/Documents/HI4880Data/usa_00002.do"
browse
drop city
drop stateicp
rename nchild children
gen female = 0
replace female = 1 if sex == 2
drop sex
gen married = 0
replace married = 1 if marst < 3.5
drop race
gen hispanic = 0
replace hispanic = 1 if hispan != 0
gen foreign_born = 0
replace foreign_born = 1 if bpl > 125
gen us_citizen = 0
replace us_citizen = 1 if citizen != 3
rename racamind native_american
replace native_american = 0 if native_american == 1
replace native_american = 1 if native_american == 2
rename racasian asian
replace asian = 0 if asian == 1
replace asian = 1 if asian == 2
rename racblk black
replace black = 0 if black == 1
replace black = 1 if black == 2
rename racpacis pacific_islander
replace pacific_islander = 0 if pacific_islander == 1
replace pacific_islander = 1 if pacific_islander == 2
rename racwht white
replace white = 0 if white == 1
replace white = 1 if white == 2
rename racother other_race
replace other_race = 0 if other_race == 1
replace other_race = 1 if other_race == 2
rename hcovany any_coverage
replace any_coverage = 0 if any_coverage == 1
replace any_coverage = 1 if any_coverage == 2
rename hcovpriv private_insurance
replace private_insurance = 0 if private_insurance == 1
replace private_insurance = 1 if private_insurance == 2
rename hinsemp employer_insurance
replace employer_insurance = 0 if employer_insurance == 1
replace employer_insurance = 1 if employer_insurance == 2
rename hinspur direct_purchase
replace direct_purchase = 0 if direct_purchase == 1
replace direct_purchase = 1 if direct_purchase == 2
rename hinstri tricare
replace tricare = 0 if tricare == 1
replace tricare = 1 if tricare == 2
rename hcovpub public_insurance
replace public_insurance = 0 if public_insurance == 1
replace public_insurance = 1 if public_insurance == 2
rename hinscaid medicaid
replace medicaid = 0 if medicaid == 1
replace medicaid = 1 if medicaid == 2
rename hinscare medicare
replace medicare = 0 if medicare == 1
replace medicare = 1 if medicare == 2
rename hinsva va
replace va = 0 if va == 1
replace va = 1 if va == 2
rename hinsihs indian_health
replace indian_health = 0 if indian_health == 1
replace indian_health = 1 if indian_health == 2
gen student = 0
replace student = 1 if school == 2
gen no_school = 0
replace no_school = 1 if educ == 0
gen elementary_school = 0
replace elementary_school = 1 if educ == 1
gen middle_school = 0
replace middle_school = 1 if educ == 2
gen some_hs = 0
replace some_hs = 1 if educ > 2 & educ < 6
gen hs_grad = 0
replace hs_grad = 1 if educ == 6
gen some_college = 0
replace some_college = 1 if educ == 7 | educ == 8 
gen college_grad = 0
replace college_grad = 1 if educ == 10
gen grad_school = 0
replace grad_school = 1 if educ == 11
gen unemployed = .
replace unemployed = 0 if empstat == 1 | empstat == 3
replace unemployed = 1 if empstat == 2
gen disabled = .
replace disabled = 1 if diffrem == 2 | diffphys == 2 | diffmob == 2 | diffcare == 2 | diffsens == 2 | diffeye == 2 | diffhear == 2
replace disabled = 0 if diffrem == 1 | diffphys == 1 | diffmob == 1 | diffcare == 1 | diffsens == 1 | diffeye == 1 | diffhear == 1
gen veteran = .
replace veteran = 0 if vetstat == 1
replace veteran = 1 if vetstat == 2
browse
describe
drop if inctot < 0
drop if ftotinc < 0
drop if year < 2011
tab year
replace inctot = . if inctot == 9999999
replace ftotinc = . if ftotinc == 9999998 | ftotinc == 9999999
sum year statefip no_school elementary_school middle_school some_hs hs_grad some_college college_grad grad_school any_coverage private_insurance public_insurance us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot ftotinc married children native_american asian black pacific_islander white other_race direct_purchase employer_insurance tricare medicaid medicare va indian_health if age < 65
sum year statefip no_school elementary_school middle_school some_hs hs_grad some_college college_grad grad_school any_coverage private_insurance public_insurance us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot ftotinc married children native_american asian black pacific_islander white other_race direct_purchase employer_insurance tricare medicaid medicare va indian_health 


//Medicaid States
gen expansion = .
replace expansion = 0 if statefip == 1
replace expansion = 1 if statefip == 2 & year>2015
replace expansion = 0 if statefip == 2 & year<2016
replace expansion = 1 if statefip == 4 & year>2013
replace expansion = 0 if statefip == 4 & year<2014
replace expansion = 1 if statefip == 5 & year>2013
replace expansion = 0 if statefip == 5 & year<2014
replace expansion = 1 if statefip == 6 & year>2013
replace expansion = 0 if statefip == 6 & year<2014
replace expansion = 1 if statefip == 8 & year>2013
replace expansion = 0 if statefip == 8 & year<2014
replace expansion = 1 if statefip == 9 & year>2013
replace expansion = 0 if statefip == 9 & year<2014
replace expansion = 1 if statefip == 10 & year>2013
replace expansion = 0 if statefip == 10 & year<2014
replace expansion = 1 if statefip == 11 & year>2013
replace expansion = 0 if statefip == 11 & year<2014
replace expansion = 0 if statefip == 12
replace expansion = 0 if statefip == 13
replace expansion = 1 if statefip == 15 & year>2013
replace expansion = 0 if statefip == 15 & year<2014
replace expansion = 0 if statefip == 16
replace expansion = 1 if statefip == 17 & year>2013
replace expansion = 0 if statefip == 17 & year<2014
replace expansion = 1 if statefip == 18 & year>2015
replace expansion = 0 if statefip == 18 & year<2016
replace expansion = 1 if statefip == 19 & year>2013
replace expansion = 0 if statefip == 19 & year<2014
replace expansion = 0 if statefip == 20
replace expansion = 0 if statefip == 21
replace expansion = 0 if statefip == 22
replace expansion = 0 if statefip == 23
replace expansion = 1 if statefip == 24 & year>2013
replace expansion = 0 if statefip == 24 & year<2014
replace expansion = 1 if statefip == 25 & year>2013
replace expansion = 0 if statefip == 25 & year<2014
replace expansion = 1 if statefip == 26 & year>2014
replace expansion = 0 if statefip == 26 & year<2015
replace expansion = 1 if statefip == 27 & year>2013
replace expansion = 0 if statefip == 27 & year<2014
replace expansion = 0 if statefip == 28
replace expansion = 0 if statefip == 29
replace expansion = 1 if statefip == 30 & year>2015
replace expansion = 0 if statefip == 30 & year<2016
replace expansion = 0 if statefip == 31
replace expansion = 1 if statefip == 32 & year>2013
replace expansion = 0 if statefip == 32 & year<2014
replace expansion = 1 if statefip == 33 & year>2014
replace expansion = 0 if statefip == 33 & year<2015
replace expansion = 1 if statefip == 34 & year>2013
replace expansion = 0 if statefip == 34 & year<2014
replace expansion = 1 if statefip == 35 & year>2013
replace expansion = 0 if statefip == 35 & year<2014
replace expansion = 1 if statefip == 36 & year>2013
replace expansion = 0 if statefip == 36 & year<2014
replace expansion = 0 if statefip == 37
replace expansion = 1 if statefip == 38 & year>2013
replace expansion = 0 if statefip == 38 & year<2014
replace expansion = 1 if statefip == 39 & year>2013
replace expansion = 0 if statefip == 39 & year<2014
replace expansion = 0 if statefip == 40
replace expansion = 1 if statefip == 41 & year>2013
replace expansion = 0 if statefip == 41 & year<2014
replace expansion = 1 if statefip == 42 & year>2014
replace expansion = 0 if statefip == 42 & year<2015
replace expansion = 1 if statefip == 44 & year>2013
replace expansion = 0 if statefip == 44 & year<2014
replace expansion = 0 if statefip == 45
replace expansion = 0 if statefip == 46
replace expansion = 0 if statefip == 47
replace expansion = 0 if statefip == 48
replace expansion = 0 if statefip == 49
replace expansion = 1 if statefip == 50 & year>2013
replace expansion = 0 if statefip == 50 & year<2014
replace expansion = 0 if statefip == 51
replace expansion = 1 if statefip == 53 & year>2013
replace expansion = 0 if statefip == 53 & year<2014
replace expansion = 1 if statefip == 54 & year>2013
replace expansion = 0 if statefip == 54 & year<2014
replace expansion = 0 if statefip == 55
replace expansion = 0 if statefip == 56

gen post = 0
replace post = 1 if year > 2013

gen postexpansion = post * expansion
gen postcollegegrad = post * college_grad
gen expansioncollegegrad = expansion * college_grad
gen postexpansioncollegegrad = post * expansion * college_grad
 
//DDD, no fixed effects, full age range
regress any_coverage post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.state, robust

gen expansion = .
replace expansion = 0 if statefip == 1
replace expansion = 1 if statefip == 2
replace expansion = 1 if statefip == 4
replace expansion = 1 if statefip == 5
replace expansion = 1 if statefip == 6 
replace expansion = 1 if statefip == 8
replace expansion = 1 if statefip == 9
replace expansion = 1 if statefip == 10
replace expansion = 1 if statefip == 11
replace expansion = 0 if statefip == 12
replace expansion = 0 if statefip == 13
replace expansion = 1 if statefip == 15
replace expansion = 0 if statefip == 16
replace expansion = 1 if statefip == 17
replace expansion = 1 if statefip == 18
replace expansion = 1 if statefip == 19
replace expansion = 0 if statefip == 20
replace expansion = 0 if statefip == 21
replace expansion = 0 if statefip == 22
replace expansion = 0 if statefip == 23
replace expansion = 1 if statefip == 24
replace expansion = 1 if statefip == 25
replace expansion = 1 if statefip == 26
replace expansion = 1 if statefip == 27
replace expansion = 0 if statefip == 28
replace expansion = 0 if statefip == 29
replace expansion = 1 if statefip == 30
replace expansion = 0 if statefip == 31
replace expansion = 1 if statefip == 32
replace expansion = 1 if statefip == 33
replace expansion = 1 if statefip == 34
replace expansion = 1 if statefip == 35
replace expansion = 1 if statefip == 36
replace expansion = 0 if statefip == 37
replace expansion = 1 if statefip == 38
replace expansion = 1 if statefip == 39
replace expansion = 0 if statefip == 40
replace expansion = 1 if statefip == 41
replace expansion = 1 if statefip == 42
replace expansion = 1 if statefip == 44
replace expansion = 0 if statefip == 45
replace expansion = 0 if statefip == 46
replace expansion = 0 if statefip == 47
replace expansion = 0 if statefip == 48
replace expansion = 0 if statefip == 49
replace expansion = 1 if statefip == 50
replace expansion = 0 if statefip == 51
replace expansion = 1 if statefip == 53
replace expansion = 1 if statefip == 54
replace expansion = 0 if statefip == 55
replace expansion = 0 if statefip == 56

gen collegegraduate = 0
replace collegegraduate = 1 if college_grad == 1 | grad_school == 1
gen noncollegegraduate = 0
replace noncollegegraduate = 1 if collegegraduate != 1

label define female 0 "Male" 1 "Female", replace
label values female female
label define any_coverage 0 "No Coverage" 1 "Covered", replace
label values any_coverage any_coverage
tab anyconverage
label define post 0 "Before 2014" 1 "2014 and after", replace
label values post post
label define us_citizen 0 "non US citizen" 1 "US citizen", replace
label values us_citizen us_citizen
label define foreign_born 0 "Not Foreign Born" 1 "Foreign Born", replace
label values foreign_born foreign_born
label define expansion 0 "Not Expansion State" 1 "Expansion State"
label values expansion expansion
label define hispanic 0 "Non-hispanic" 1 "Hispanic"
label values hispanic hispanic
label define unemployed 0 "Employed" 1 "Unemployed"
label values unemployed unemployed
label define disabled 0 "Not Disabled" 1 "Disabled"
label values disabled disabled
label define student 0 "Not a student" 1 "Student"
label values student student
label define veteran 0 "Not a veteran" 1 "Veteran"
label values veteran veteran
label define married 0 "Not married" 1 "Married"
label values married married
label define native_american 0 "Not Native American" 1 "Native American"
label values native_american native_american
label define asian 0 "not Asian" 1 "Asian"
label values asian asian
label define black 0 "not Black" 1 "Black"
label values black black
label define pacific_islander 0 "not Pacific Islander" 1 "Pacific Islander"
label values pacific_islander pacific_islander
label define white 0 "not White" 1 "White"
label values white white
label define other_race 0 "No other race" 1 "Other race"
label values other_race other_race

label define collegegraduate 0 "Not a college graduate" 1 "College graduate"
label values collegegraduate collegegraduate
label define noncollegegraduate 0 "College graduate" 1 "Not a college graduate"
label values noncollegegraduate noncollegegraduate

label define public_insurance 0 "No Public Insurance" 1 "Public Insurance"
label values public_insurance public_insurance
label define private_insurance 0 "No Private Insurance" 1 "Private Insurance"
label values private_insurance private_insurance
label define direct_purchase 0 "No Direct Purchase" 1 "Direct Purchase"
label values direct_purchase direct_purchase
label define employer_insurance 0 "No employer provided insurance" 1 "Employer provided insurance"
label values employer_insurance employer_insurance
label define tricare 0 "No TRICARE" 1 "Has TRICARE"
label values tricare tricare
label define medicare 0 "No Medicare" 1 "Medicare"
label values medicare medicare
label define medicaid 0 "No Meidcaid" 1 "Medicaid"
label values medicaid medicaid
label define va 0 "No VA Insurance" 1 "VA Insurance"
label values va va
label define indian_health 0 "No Indian Health Services" 1 "Indian Health Services"
label values indian_health indian_health


gen postexpansion = post * expansion
gen postcollegegrad = post * collegegraduate
gen expansioncollegegrad = expansion * collegegraduate
gen postexpansioncollegegrad = post * expansion * collegegraduate

regress any_coverage post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate, robust
outreg2 using newreg1.doc, keep(postexpansioncollegegrad) addtext(Year FE, NO, State FE, NO)
regress any_coverage post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year, robust
outreg2 using newreg1.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, NO) append ctitle(Model 2)
regress any_coverage post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state, robust
outreg2 using newreg1.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES) append ctitle(Model 3)
regress any_coverage post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using newreg1.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES) append ctitle(Model 4)

regress public_insurance post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES) ctitle(Public Insurance)
regress private_insurance post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES) append ctitle(Private Insurance)

regress direct_purchase post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using type.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) ctitle(Direct Purchase)
regress employer_insurance post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Employer Provided Insurance)
regress tricare post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Tricare Insurance)
regress medicare post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Medicare)
regress medicaid post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Medicaid)
regress va post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Veterans Affairs Insurance)
regress indian_health post expansion college_grad postexpansion postcollegegrad expansioncollegegrad postexpansioncollegegrad us_citizen foreign_born hispanic age unemployed disabled student veteran female inctot married children native_american asian black pacific_islander white other_race unemployrate i.year i.state if age<65, robust
outreg2 using pubpriv.doc, keep(postexpansioncollegegrad) addtext(Year FE, YES, State FE, YES, Age, Less than 65) append ctitle(Indian Health Services)
