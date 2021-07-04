*********************************************************
*												        *
* ANÁLISIS MERGE DE DATA - PROFESORES + ESTUDIANTES     *
*												        *
*********************************************************

// Settings
	set more off
	clear all
	set more off
	set matsize 3000
	set varabbrev off
	ssc install xtable
//1 a 2to básico

use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/F3-12.dta", clear 
replace RutCompleto = . if RutCompleto ==1
rename RutCompleto RUT
sort RUT
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F3-12.dta", replace
use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/F7-AP.dta", clear 
rename RUTALUMNO RUT
replace RUT = . if RUT ==1
sort RUT
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F7-AP.dta", replace
clear

//MERGE

use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F3-12.dta", clear
duplicates drop RUT, force
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F3-12.dta", replace
use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F7-AP.dta", clear
duplicates drop RUT, force

merge 1:1 RUT using "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F3-12.dta"
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP.dta", replace


//3 a 4to básico

use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/F4-34.dta", clear 
replace RUT = . if RUT ==1
sort RUT
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F4-34.dta", replace
use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP.dta", clear 
sort RUT
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP.dta", replace
clear

//MERGE

use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F4-34.dta", clear
duplicates drop RUT, force
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F4-34.dta", replace
use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP.dta", clear
rename _merge _merge1
merge 1:1 RUT using "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F4-34.dta"
save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP2.dta", replace



//5to a 8vo
//use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/F5_58.dta", clear 
//replace RUT = . if RUT ==1
////sort RUT
//save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F5_58.dta", replace
//use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP.dta", clear
//sort RUT
//save  "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP3.dta", replace

//MERGE

//use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F5_58.dta", clear
//duplicates drop RUT, force
//save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F5_58.dta", replace
//use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP3.dta", clear
//drop _merge
//merge 1:1 RUT using "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/F5_58.dta"
//save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Encuesta EduInclusiva/Data/Bases Finales Transformadas DTA/Data_aux/BD_34AP3.dta", replace
