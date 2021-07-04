// File Description
	// Project: Refinancing
	// Goal: Some descriptive stats of BE data
	// Created: 02/01/2021
	// Last Modified: 11/01/2021

// Settings
	set more off
	clear all
	set more off
	set matsize 800
	set varabbrev off
	//ssc install xtable
	//set scheme modern

// Set directories
	if "`c(username)'" == "jicuesta" {
		do "~/Dropbox/Work/Research/Refinancing/Analysis/do/stata_paths_ji.do"
	}
	else if "`c(username)'" == "Vivek" {
		do "C:\Users\Vivek\Dropbox (Personal)\Refinancing\Analysis\do\stata_paths_vb.do"
	}
	else if "`c(username)'" == "Carla" {
		do "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Refinancing/Analysis/do/stata_paths_cp.do"
	}
	else if "`c(username)'" == "gaston" {
		do "/home/gaston/Dropbox/Research/Refinancing/Analysis/do/stata_paths_gi.do"
	}

// Open data

//Tenemos 346 comunas en BE y en CMF la misma cantidad.
//Las comunas en la data de BE se encuentran en mayúscula, por lo tanto, vamos a poner las de CMF en mayúscula y sacarle los acentos
use "$data_aux/comunas.dta", clear	
replace nombre = ustrlower( ustrregexra( ustrnormalize( nombre, "nfd" ) , "\p{Mark}", "" )  )
replace nombre = upper(nombre)
rename nombre borrower_county
sort borrower_county
save "$data_aux/comunas2.dta", replace

use "$data_aux/mortgages_be.dta", clear
sort borrower_county
replace borrower_county = strrtrim(borrower_county)
save "$data_aux/mortgages_be_comuna.dta", replace
use "$data_aux/comunas2.dta", clear

//Arreglamos las comunas que son diferentes en ambas bases
replace borrower_county="ALTO BIO BIO" if borrower_county=="ALTO BIOBIO" 
replace borrower_county="CHOL CHOL" if borrower_county=="CHOLCHOL" 
replace borrower_county="LA CALERA" if borrower_county=="CALERA" 
replace borrower_county="LLAY LLAY" if borrower_county=="LLAYLLAY" 
replace borrower_county="MARCHIHUE" if borrower_county=="MARCHIGUE" 
replace borrower_county="O HIGGINS" if borrower_county=="O’HIGGINS" 

rename comuna code_comuna
//Combinamos
merge 1:m borrower_county using "$data_aux/mortgages_be_comuna.dta"

