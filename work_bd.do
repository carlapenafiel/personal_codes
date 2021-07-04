
//Pegar ruta personal de BD.
use "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/BDFINAL.dta", clear


//Arreglamos la BD
replace cantf ="." if cantf=="NA"
destring cantf, replace
replace cantm ="." if cantm=="NA"
destring cantm, replace
replace promf = "." if promf=="NA"
destring promf, replace
replace promm = "." if promm=="NA"
destring promm, replace
replace varf = "." if varf=="NA"
destring varf, replace
replace varm = "." if varm=="NA"
destring varm, replace

replace cantaprof = "." if cantaprof=="NA"
destring cantaprof, replace
replace cantaprom = "." if cantaprom=="NA"
destring cantaprom, replace

replace  promedf= "." if promedf=="NA"
replace  promedf="." if promedf == "NULL"
destring promedf, replace
replace  promedm= "." if promedm=="NA"
replace  promedm="." if promedm == "NULL"
destring promedm, replace

replace  medianaf= "." if medianaf=="NA"
destring medianaf, replace
replace  medianam= "." if medianam=="NA"
destring medianam, replace

replace  colegiosmunicipalizados= "." if colegiosmunicipalizados=="NA"
destring colegiosmunicipalizados, replace
replace  alumnodeintercambio= "." if alumnodeintercambio=="NA"
destring alumnodeintercambio, replace
replace  alumnolibre= "." if alumnolibre=="NA"
destring alumnolibre, replace
replace  alumnosdeintercambiointernaciona= "." if alumnosdeintercambiointernaciona=="NA"
destring alumnosdeintercambiointernaciona, replace
replace  artãculo17= "." if artãculo17=="NA"
destring artãculo17, replace
replace  bachillerato= "." if bachillerato=="NA"
destring bachillerato, replace
replace  deportista= "." if deportista=="NA"
destring deportista, replace
replace  extranjero= "." if extranjero=="NA"
destring extranjero, replace
replace  ingresoespecial= "." if ingresoespecial=="NA"
destring ingresoespecial, replace
replace  intercambionacionalpostgrado= "." if intercambionacionalpostgrado=="NA"
destring intercambionacionalpostgrado, replace
replace  licenciadosytitulados= "." if licenciadosytitulados=="NA"
destring licenciadosytitulados, replace
replace  otrosingresosespeciales= "." if otrosingresosespeciales=="NA"
destring otrosingresosespeciales, replace

replace  postgrado= "." if postgrado=="NA"
destring postgrado, replace
replace  psuopaa= "." if psuopaa=="NA"
destring psuopaa, replace
replace  revalidaciãndetãtulo= "." if revalidaciãndetãtulo=="NA"
destring revalidaciãndetãtulo, replace
replace  transferencia= "." if transferencia=="NA"
destring transferencia, replace
replace  intercambiointernacionalpostgrad= "." if intercambiointernacionalpostgrad=="NA"
destring intercambiointernacionalpostgrad, replace
replace  intercambiopostgradoudechile= "." if intercambiopostgradoudechile=="NA"
destring intercambiopostgradoudechile, replace
replace  sistemadeingresoprioritariodeequ= "." if sistemadeingresoprioritariodeequ=="NA"
destring sistemadeingresoprioritariodeequ, replace
replace  equidaddegãnero= "." if equidaddegãnero=="NA"
destring equidaddegãnero, replace
replace  postãtulo= "." if postãtulo=="NA"
destring postãtulo, replace
replace  traslado= "." if traslado=="NA"
destring traslado, replace
replace  sininformaciãn= "." if sininformaciãn=="NA"
destring sininformaciãn, replace

replace  pace= "." if pace=="NA"
destring pace, replace
replace  transferenciasexternas= "." if transferenciasexternas=="NA"
destring transferenciasexternas, replace
replace  beabecaexcelenciaacadãmica= "." if beabecaexcelenciaacadãmica=="NA"
destring beabecaexcelenciaacadãmica, replace
replace  deportistadestacado= "." if deportistadestacado=="NA"
destring deportistadestacado, replace
replace  estmediosextranjero= "." if estmediosextranjero=="NA"
destring estmediosextranjero, replace
replace  bachiller= "." if bachiller=="NA"
destring bachiller, replace

replace departamento1="." if departamento1 =="NA"
replace sexo1="." if sexo1 =="NA"
replace calidad1="." if calidad1 =="NA"
replace sexo1="." if sexo1 =="NA"
*drop v95
replace edad="." if edad =="NA"
destring edad, replace
replace fechaingresouniversidad="." if fechaingresouniversidad =="NA"
replace estamento="." if estamento =="NA"

replace jornada="." if jornada =="NA"
destring jornada, replace

replace jerarquia="." if jerarquia =="NA"

//Ordenando la data
rename nombrex nombre_curso
label variable nombre_curso "Nombre del curso"
label variable alumntot "Total estudiantes en el curso"
label variable cantf "Cantidad de estudiantes mujeres"
label variable cantm "Cantidad de estudiantes hombres"
label variable promf "Promedio de notas estudiantes mujeres"
label variable promm "Promedio de notas estudiantes hombres"
label variable varf "Varianza de notas estudiantes mujeres"
label variable varm "Varianza de notas estudiantes hombres"
label variable cantaprof "Cantidad de estudiantes mujeres aprobadas"
label variable cantaprom "Cantidad de estudiantes hombres aprobadas"
label variable promedf "Promedio de edad estudiantes mujeres"
label variable promedm "Promedio de edad estudiantes hombres"
label variable medianaf "mediana de notas estudiantes mujeres"
label variable medianam "mediana de notas estudiantes hombres"
label variable semestre "Semestre que se dictó el curso"
label variable rut "Rut académico"
rename rut rut_acad
rename nombrey nombre_acad
label variable nombre_acad "Nombre académico"
rename departamento1 departamento
label variable departamento "Departamento al que pertenece el académico"
rename sexo1 sexo_acad
label variable sexo_acad "Sexo académico"
rename calidad1 calidad_acad
label variable calidad_acad "Calidad del académico"
rename edad edad_acad
label variable edad_acad "Edad del académico"
rename fechaingresouniversidad fecha_ingreso_acad
label variable fecha_ingreso_acad "Fecha de ingreso a la universidad del académico"
label variable estamento "Estamento al que pertenece el académico"
label variable jornada "Jornada del académico"
label variable jerarquia "Jerarquía del académico"
label variable rut_c1 "Rut de carga 1"
label variable rut_c2 "Rut de carga 2"
label variable rut_c3 "Rut de carga 3"
label variable rut_c4 "Rut de carga 4"
label variable sexo_c1 "Sexo de carga 1"
label variable sexo_c2 "Sexo de carga 2"
label variable sexo_c3 "Sexo de carga 3"
label variable sexo_c4 "Sexo de carga 4"
*rename ruty rut_aux
*rename nombre nombre_aux
*rename tipoprofesor tipo_auxiliar
*rename sexo sexo_aux


//Arreglando variables sexo academicos y otros
gen genderacad =.
replace genderacad =1 if sexo_acad =="Femenino"
replace genderacad =0 if sexo_acad =="Masculino"
label define genderacad 0 "Masculino" 1 "Femenino"
label values genderacad genderacad
drop sexo_acad
tab genderacad
tab genderacad, sort mis


gen sex_c1 =.
replace sex_c1 =1 if sexo_c1 =="Femenino"
replace sex_c1 =0 if sexo_c1 =="Masculino"
label define sex_c1 0 "Masculino" 1 "Femenino"
label values sex_c1 sex_c1
drop sexo_c1
tab sex_c1
tab sex_c1, sort mis

gen sex_c2 =.
replace sex_c2 =1 if sexo_c2 =="Femenino"
replace sex_c2 =0 if sexo_c2 =="Masculino"
label define sex_c2 0 "Masculino" 1 "Femenino"
label values sex_c2 sex_c2
drop sexo_c2
tab sex_c2
tab sex_c2, sort mis

gen sex_c3 =.
replace sex_c3 =1 if sexo_c3 =="Femenino"
replace sex_c3 =0 if sexo_c3 =="Masculino"
label define sex_c3 0 "Masculino" 1 "Femenino"
label values sex_c3 sex_c3
drop sexo_c3
tab sex_c3
tab sex_c3, sort mis

gen sex_c4 =.
replace sex_c4 =1 if sexo_c4 =="Femenino"
replace sex_c4 =0 if sexo_c4 =="Masculino"
label define sex_c4 0 "Masculino" 1 "Femenino"
label values sex_c4 sex_c4
drop sexo_c4
tab sex_c4
tab sex_c4, sort mis

/*
gen sex_aux =.
replace sex_aux =1 if sexo =="F"
replace sex_aux =0 if sexo =="M"
label define sex_aux 0 "Masculino" 1 "Femenino"
label values sex_aux sex_aux
drop sexo
tab sex_aux
tab sex_aux, sort mis
*/

//Creamos la variable cantidad de hijas
gen brecha_prom= promm - promf


*cantidad de hijas
gen sex1=.
replace sex1 = 1 if sex_c1 ==1
replace sex1 = 0 if sex_c1 ==0 

gen sex2 =.
replace sex2 = 1 if sex_c2 ==1
replace sex2 = 0 if sex_c2 ==0

gen sex3=.
replace sex3 = 1 if sex_c3 ==1
replace sex3 = 0 if sex_c3 ==0

gen sex4=.
replace sex4 = 1 if sex_c4 ==1
replace sex4 = 0 if sex_c4 ==0

gen hija =.
replace hija = 1 if sex1 ==1 |sex2 ==1 | sex3 ==1 | sex4==1
replace hija = 0 if sex1 == 0 & hija != 1
replace hija = 0 if sex2 == 0 & hija != 1
replace hija = 0 if sex3 == 0 & hija != 1
replace hija = 0 if sex4 == 0 & hija != 1

gen cantidad_hijas =.
egen varD=rowtotal(sex_c1 - sex_c2)
egen varDE=rowtotal(sex_c3 - sex_c4)
replace cantidad_hijas = varD + varDE
drop varD varDE
replace cantidad_hijas =. if sex_c1 ==.

egen nomiss1 = rownonmiss (sex1 - sex2) 
egen nomiss2 = rownonmiss (sex3 - sex4)
gen hijos_total = nomiss1 + nomiss2 

gen cantidad_hijos = hijos_total - cantidad_hijas 
drop nomiss1 nomiss2

//departamento
replace departamento = ustrlower( ustrregexra( ustrnormalize( departamento, "nfd" ) , "\p{Mark}", "" )  )
replace departamento = "DGF" if departamento == "dgf" 
replace departamento = "DGF" if departamento == "departamento de geofasica" 

replace departamento = "DAS" if departamento == "departamento de astronomaa" 

replace departamento = "DCC" if departamento == "departamento de ciencias de la computacian" 

replace departamento = "DFI" if departamento == "departamento de fasica" 

replace departamento = "DGE" if departamento == "departamento de geologaa" 

replace departamento = "DIC" if departamento == "departamento de ingenieraa civil"

 
replace departamento = "DIMIN" if departamento == "departamento de ingenieraa de minas"

replace departamento = "DIE" if departamento == "departamento de ingenieraa elactrica"


replace departamento = "DII" if departamento == "departamento de ingenieraa industrial"
replace departamento = "DII" if departamento == "dii"

replace departamento = "DIM" if departamento == "departamento de ingenieraa matematica"
replace departamento = "DIM" if departamento == "dim"

replace departamento = "DIMEC" if departamento == "departamento de ingenieraa mecanica"

replace departamento = "DIQBM" if departamento == "departamento de ingenieraa quamica, biotecnologaa y materiales"
replace departamento = "DIQBM" if departamento == "diqbm"

replace departamento = "EIC" if departamento == "escuela de ingenieraa y ciencias"


sum idcur alumntot cantf cantm promf promm varf varm cantaprof cantaprom promedf promedm medianaf medianam
tab promf

drop if promm == 0
sum idcur alumntot cantf cantm promf promm varf varm cantaprof cantaprom promedf promedm medianaf medianam

count if cantf ==.
count if cantm ==.
count if promf ==.
count if promm ==.

/*


//Conversar qué hacer con las varianzas. Hay unas muy grandes
graph box varm
sum varm,d
drop if varm > 5
graph box varf
sum varf,d
drop if varf > 7

//Cantidad de estudiantes aprobados
tab cantaprof
//Hay valores decimales (No puede haber una estudiante a la mitad aprobado/a).
drop if cantaprof >0 & cantaprof <1
tab cantaprom

//Edad
tab promedf
//Vemos que hay promedios de edad menores a 15 (0,1,2, por lo que no tendría sentido) y hay edades muy grandes
sum promedf, d
drop if promedf < 18
drop if promedf > 45
sum promedm, d
drop if promedm < 20
drop if promedm >46

//Mediana de notas
tab medianaf
//Hay mediana de notas que están mal escritas. Las arreglamos ¿Código?
// replace medianaf = 4.2 if medianaf == 4.20e+15
drop if medianaf >7
tab medianam
// replace medianam = 4.2 if medianaf == 4.20e+15
drop if medianam >7


//Semestre dummies
tab semestre, gen(dummy_semestre)
egen numdepto =group(departamento), label
egen numcurso = group(curso), label
egen numrut = group(rut), label

//Grupo de profesor-curso
egen group_profecurso = group(numrut numcurso)
tab group_profecurso, gen(dummy_group_profecurso) 

sum alumntot cantf cantm promf promm varf varm cantaprof cantaprom promedf promedm medianaf medianam numdepto brecha_prom hija cantidad_hijas cantidad_hijos hijos_total 

//save "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/BD_analysis.dta", replace
