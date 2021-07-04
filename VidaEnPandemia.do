

/********************************************************************************
							Módulo de Vacunación
********************************************************************************/

clear all 
set more off

//Nombre del directorio 
global dir "carla"

//Directorios disponibles 
	if "$dir"=="ar" { 
	global path "C:\Users\Decon2\Dropbox\DESOC\Otros\Vida en Pandemia 2" /*Antonia Riveros*/		
		}
		
	if "$dir"=="carla" { 
	global path "C:\Users\Decon2\Dropbox\DESOC\Otros\Vida en Pandemia 2" /*Carla*/		
		}
		
	if "$dir"=="tomas" { 
	global path "C:\Users\tomas\Dropbox\Vida en Pandemia 2" /*Tomas*/		
		}
		
		
//Carpetas	(no se cambia porque tenemos las mismas carpetas)	
global path_orig "${path}/2. Base"		
global path_tables "${path}/3. Tablas"	

use "${path_orig}/UCHXCL_200878_20201215_2200.dta"		


//Generamos los cuartiles de ingreso
xtile cuartiles1= P6_1 , nquantiles(4)
xtile cuartiles2= P6_2 , nquantiles(4)

tab cuartiles1, gen(q)
gen q5=1 if cuartiles1!=.

//Generar tramos de edad 
gen tramos_v3=. //(FINAL)
replace tramos_v3=1 if EDAD>=20 & EDAD<=29
replace tramos_v3=2 if EDAD>=30 & EDAD<=39
replace tramos_v3=3 if EDAD>=40 & EDAD<=49
replace tramos_v3=4 if EDAD>=50

tab tramos_v3, gen(t3_) 
gen t3_5=1 if EDAD!=. 

//Agrupación escolaridad
gen esc=.
replace esc=1 if P1==1 | P1==2 | P1==3 | P1==4 | P1==5 | P1==6 | P1==8
replace esc=2 if P1==7 | P1==9 | P1==10 | P1==12
replace esc=3 if P1==11  //superior técnica
replace esc=4 if P1==13 | P1==14  //superior universitaria

label define esc 1 "Básica completa o menos" 2 "Media completa" 3 "Superior técnica" 4 "Superior universitaria"
label values esc esc

tab esc, gen(esc_) 
gen esc_5=1 if esc!=. 

//Dummies de sexo
tab SEXO, gen(s)
gen s3=1 if SEXO!=.

//Count var
gen n=1


//Pregunta 53
*Tramos de edad opcion 3 (FINAL)
preserve
matrix m1=J(75,17,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 0/7{

qui sum n if t3_`t'==1 & s`s'==1 &  q`q'==1 & P53!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & P53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+1]=r(sum)


qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & P53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+10]=r(sum)/`tot'
}
}
}
}

svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P53.xlsx", sheet("P53_t3_raw")  sheetreplace 
restore




*Por escolaridad con opcion 3
preserve
matrix m1=J(75,17,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 0/7{

qui sum n if t3_`t'==1 & s`s'==1 &  esc_`q'==1 & P53!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & P53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+1]=r(sum)


qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & P53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+10]=r(sum)/`tot'
}
}
}
}

svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P53.xlsx", sheet("P53_t3_esc_raw")  sheetreplace 
restore


*Opciones agrupadas con tramos de edad opcion 3
gen p53=P53
replace p53=1 if P53==2 | P53==3
replace p53=2 if P53==4 | P53==5
replace p53=3 if P53==6 | P53==7
*tab P53 p53

preserve
matrix m1=J(75,17,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 0/3{

qui sum n if t3_`t'==1 & s`s'==1 &  q`q'==1 & p53!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & p53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+1]=r(sum)


qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & p53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+6]=r(sum)/`tot'
}
}
}
}
svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P53.xlsx", sheet("P53_t3_agrupada_raw")  sheetreplace 
restore

*Opciones agrupadas con tramos de edad opcion 3 - ESC en vez de quintiles
preserve
matrix m1=J(75,17,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 0/3{

qui sum n if t3_`t'==1 & s`s'==1 &  esc_`q'==1 & p53!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & p53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+1]=r(sum)


qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & p53==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+6]=r(sum)/`tot'
}
}
}
}
svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P53.xlsx", sheet("P53_t3_esc_agrupada_raw")  sheetreplace 
restore

*********************************************************************************
*********************************************************************************
*********************************************************************************
*********************************************************************************

//Pregunta 54
*Recodificación pregunta 54
replace P54=4 if P54_98_value=="Tendría que ver que pasa con las personas que ya se pusieron la vacuna y ver si tuvieron alguna contraindicacion."
replace P54=4 if P54_98_value=="Esperaria a ver que tan efectiva es"
replace P54=4 if P54_98_value=="esperaría 5 años mas"
replace P54=4 if P54_98_value=="Que realmente funcione"
replace P54=2 if P54_98_value=="Cuando uno se pone una vacuna, se esta inyectando el virus y eso da miedo"
replace P54=2 if P54_98_value=="Porque la vacuna afecta directamente a la configuracion de ADNy cualquier problema es irreversible."
replace P54=2 if P54_98_value=="Información específica de la vacuna. No estoy en contra, pero requiero conocer su eficiencia y efectos colaterales antes de tomar una decisión"
replace P54=5 if P54_98_value=="No tengo motivos para usarla"
replace P54=8 if P54_98_value=="No creo en las vacunas"


*Agrupando opción 1 y 5 - tramos de edad opción 3
gen P54_agrupada=P54
replace P54_agrupada=1 if P54_agrupada==5
recode P54_agrupada (6=5) (7=6) (8=7) (9=8) (98=9)

preserve
matrix m1=J(75,21,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 1/9{

qui sum n if t3_`t'==1 & s`s'==1 &  q`q'==1 & P54!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & P54==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num']=r(sum)

qui sum n if t3_`t'==1 & s`s'==1  &  q`q'==1 & P54==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+10]=r(sum)/`tot'


}
}
}
}

svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P54.xlsx", sheet("P54_t3_agrupada_raw")  sheetreplace 
restore


*tramos de edad opción 3 - Agrupada - Escolaridad
preserve
matrix m1=J(75,21,.)
forvalues s=1/3 {
forvalues q=1/5 {
forvalues t=1/5 {
foreach num of numlist 1/9{

qui sum n if t3_`t'==1 & s`s'==1 &  esc_`q'==1 & P54!=.
local tot=r(N)

qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & P54==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num']=r(sum)

qui sum n if t3_`t'==1 & s`s'==1  &  esc_`q'==1 & P54==`num'
mat m1[`t'+(5*`q'-5)+(25*`s'-25),`num'+10]=r(sum)/`tot'


}
}
}
}
svmat m1
keep m1*
keep if m11!=.
export excel using "${path_tables}/P54.xlsx", sheet("P54_t3_esc_agrupada_raw")  sheetreplace 
restore









