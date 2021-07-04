*Nombre: Carla Marie Peñafiel Messmer
*Fecha: 23 Octubre 2020
*Test J-PAL.

********************************************************************************
					*SECTION 1: Handling Data
********************************************************************************

/*					
1. Guardamos el archivo Cleaning.do
2. Se comienza cargando las bases de datos: maindata.xls y longterm.xls, 
transformándolas a formato .dta (Llame a su directorio)
*/
import excel "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/maindata.xls", sheet("Sheet1") firstrow clear
save "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/maindata.dta"
import excel "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/longterm.xls", sheet("Sheet1") firstrow clear
save "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/longterm.dta"

*Como ambas bases de datos tienen las mismas columnas las combinaremos como append.
use maindata.dta, clear
append using longterm.dta
save bdmerge.dta, replace
describe
/*
Como cada observación es única, queda una base con 1.296 observaciones (se 
integró verticalmente).
3. Como social_security es una variable personal, se guardará en otro archivo.dta 
de tal forma que si es necesario se pueda fusionar con nuestra base de datos.
Se mantiene la columna folio para poder posteriormente hacer un merge (integrar 
horizontalmente).
*/
keep social_security folio
save social_security.dta
use bdmerge.dta, replace
drop social_security
save bdmerge.dta, replace

********************************************************************************
					*SECTION 2: Cleaning Data
********************************************************************************
/*					
1. La variable sec se etiquetará con el nombre "Sector of firm" y las etiquetas 
de los valores son: 1 "industry", 2 "commerce" y 3 "service".
*/
label var sec "Sector of firm" 
label define sec1 1 "industry" 2 "commerce" 3 "service"
label val sec sec1
tab sec
/*
2. Si se observa codebook.xls, existe una variable llamada "costs_quartile_2008" 
que no está en la BD construida (bdmerge.dta) por lo que se crea la variable de 
Quartil de costos a partir de la variable "total_costs_2008".
*/
xtile costs_quartile_2008 = total_costs_2008 , nquantiles(4)
tab costs_quartile_2008
*Notar que existen varios datos NA en la columna de total_costs_2008.
/*
3. Muchas firmas no reportan su nivel de ganancias del 2008.
	
	*a. Primero se observa la cantidad de missing values de la variable 
	total_profits_2008
	*/
	tabulate total_profits_2008, missing
	/*Se tienen 664 de 1.296 valores vacíos, lo cual corresponde al 51% de los 
	datos. La cantidad de NAs es bastante grande lo que podría estar generando
	un sesgo importante, significante al momento de analizar, pues cuando se 
	realizan cálculos (por ejemplo la media) solo se están considerando el 49% 
	de los datos, los cual podría entregar conclusiones erróneas.
	La forma en que STATA trata los missing values es de forma predeterminada,
	todas las observaciones con missing values se eliminan del análisis 
	(eliminación por lista). Finalmente para observar cuántos missing values son
	producto de que no se conoce el nivel de profits es:
	*/
	tab total_profits_2008 if (total_profits_2008 == -997) 
	/*
	Con una frecuencia de 175 empresas que no conocen su nivel de profits. 
	(-997 según codebook corresponde al valor "no lo sé"). Un 26% de los missing 
	values ocurren por que la empresa no conoce su nivel de ganancias en el año 
	2008.
	
	b. Los riegos de codificar los missing values de esta manera es obtener 
	resultados sesgados. Se podría pensar que las consultorías puedes estar 
	generando una mejora (o no) en el nivel de profits en promedio de quienes 
	por ejemplo realizan la consultoría versus otros que no, sin embargo con tal 
	cantidad de missing values, se podría estar frente a un sesgo importante que 
	llevaría a conclusiones erróneas.
	
	c. Comenzamos reemplazando los profits que no fueron informados por datos 
	vacios (stata no los considera al calcular la media) y también reemplazaremos 
	los valores de quienes no quisieron reportar los profits.
	*/
	replace total_profits_2008 =. if total_profits_2008 == -997
	replace total_profits_2008 =. if total_profits_2008 == -998
	replace total_profits_2008 =. if total_profits_2008 == -999
	sum total_profits_2008
	/*
	Se obtiene una media de 836.556 con 200 observaciones. Versus antes que se
	tenía una media de 264.050 con 632 observaciones.
	Se observa que los datos eliminados sesgaban las métricas de forma importante.
	*/
	
*4. Guardamos los cambios en un nuevo archivo.
save finaldata.dta

********************************************************************************
					*SECTION 3: Visualizing Data
********************************************************************************

*Comenzamos pegando el codigo AnalysisVisualization.do

/*
Title: Analysis and Visualization
Author: Mike Gibson
Input: finaldata.dta
output: graphs and tables on impact of consulting services on firms
*/

clear
set more off
*Se recomienda usar la versión 14.2
*version 14.2
cap log close

********************************************************************************
						*Section 3: Visualization*
********************************************************************************

*S3 Q1.*
*Notar acá que falta mencionar cambiar el directorio al personal. Cambio a mi directorio.
use  "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/finaldata.dta"


*S3 Q2*

/* 
Balance Tests

I need to run a regression to see if these characteristics differ by firm and
record the results in an excel file
OJO CON INSTALAR.
Instalar texdoc y estout
*/
ssc install texdoc, replace
ssc install estout
*En esta regresión falta agregar comillas a i.
*Además en la creación de archivo .tex es importante mencionar setear dónde incluir
*el archivo para no tener error. (Agregar directorio personal). Además existian lineas
*que no permitian crear el archivo .tex
foreach i in full_time_employees part_time_employees seasonal_employees{
reg `i' treatment if followup==0
eststo i
esttab, se label nodepvar nonumber star(* 0.10 ** 0.05 *** 0.01)
}
 estout * using "/Users/carlamariepenafielmessmer/Desktop/J-PAL  EXAM (1)/$path/BalanceTestLatex.tex", append cells(b(star fmt(%9.3f)) se(par))             
 /// stats(N, fmt(%9.0f)) label (collabels(none)) varlabels(_cons Constant)/// 
 
  

*S3 Q3
/* I want to standardize the number of times the firm applied for a bank loan and graph it.
*/
*En la parte 3 se encuentra la explicación.
sum loan_bank_number, detail

gen std_numb_bankloan = loan_bank_number-1.969697/1.662057

histogram std_numb_bankloan

*Se crea la nueva variable.
gen std_numb_bankloan2=loan_bank_number-1.969697/1.662057
histogram std_numb_bankloan2

********************************************************************************
						*Section 4: Analysis*
********************************************************************************
*S4 Q3.*

tab followup, gen(year_dum)
*Se quita year_dum1 y se deja como caso base.
reg profits treatment  year_dum2 year_dum3

*S4 Q2.*

/*estimating the LATE two different ways*/
global controls "trmrk sec total_employees"

*method 1:
ivregress 2sls sales  (in_program=treatment) 


*method 2:
ivregress 2sls sales  $controls  (in_program=treatment) 

/* Respuestas
1. El código al correrlo no funciona facilmente, primero se especifica usar stata
versión 14, sin embargo esto es mejor dejarlo como comentario y sugerencia pues
no funciona en caso de tener una versión diferente. Además es importante específicar
setear el directorio personal para los archivos a utilizar. 

2. El código destinado a crear un archivo . tex no funciona a primeras, se iden-
tifican errores de: faltan comillas el la letra i asociada a la regresión.
Además, el archivo .tex creado no existe en el directorio por lo que sirve setear
con anticipación dónde crear el archivo. (En este caso se creó en la carpeta J-PAL
EXAM(1). Finalmente hay lineas que tenían /// simbolos de comentarios que no permi-
ten crear el archivo .tex

3. Para saber que se hizo correctamente, se comienza observando la media y la ds
para observar si corresponden a las escritas en la fórmula. Por lo que corresponde.
	a. Se crea la nueva variable y se confirma que ambos histogramas son iguales.
	Por lo que estaría bien estandarizada.
*/	
*gen std_numb_bankloan2=loan_bank_number-1.969697/1.662057
*histogram std_numb_bankloan2

********************************************************************************
					*SECTION 4: Analyzing Data				
********************************************************************************

/* 1. El error es que se están utilizando todos los años al correr la regresión, por
lo que se debe omitir una dummy de year para que Stata no bote una.
Hay que tener cuidado con las dummies para que no sean colineales. Por lo tanto
estos coeficientes de las dummies de year serán diferencias relativas al efecto 
del año base. Se deja afuera year_dum1.

*2. Los coeficientes de ambos métodos de participar en el programa (in_program)
en las ventas, no son iguales. En el método 1 corresponde a 91,06 y en el método 2
a 106,6. Como se está utilizando el método de variables instrumentales, ambos
coeficientes debiesen ser iguales independiente de si se agregan variables de control
o no. Al no ser iguales (podrían diferenciarse por decimales) estaría indicando
que existe un problema de endogeneidad y que las variables que se agregan al control
estarían sesgando, es decir, existen variables que afectan al estar en el programa que
en el método 1 no se estaban midiendo (si esto no ocurriera, los coeficientes serían
iguales, pues no existiría nada que afecte estar o no el programa, se cumpliría
la exogeneidad).
*/

********************************************************************************
					*SECTION 5: Interpreting Results
********************************************************************************

/*1. Se necesita una variable instrumental para la variable in_program pues estar 
en el programa o no, es una variable no aleatoria es una decisión de la firma. Si
es igual a 1 la firma decide estar en el programa y 0 si no, sin embargo esta asi-
gnación no es aleatoria por lo que es una variable sesgada y endógena. Pueden 
existir variables que no observamos que implican que una firma participe en el
programa lo cual sesgaría nuestros resultados. Por esto se necesita una variable
aleatoria que cumpla con las condiciones de una variable instrumental. Para la 
variable treatment si fue realizada de forma correcta la aleatorización, es decir
nada exógeno influye en ser tratada o control, puede ser un buen instrumento.

*2. Realizaremos una regresión para cada outcome:*/
reg sales treatment
reg profits treatment
reg trmrk treatment
/* Para ver la significancia se puede ver a través de el estadístico t, p-value
o por intervalo de confianza. En este caso se realiza a través del estadístico t. 
Al 95% de confianza, aquellos estadísticos que sean mayores en valor absoluto
a 1.96 serán significativos.
- El efecto tratamiento sobre las ventas es significativo (2,60>1,96) al 95% de confianza.
- El efecto tratamiento sobre las ganancias no es significativo (0.95<1,96) al 95% de confianza.
- El efecto tratamiento  sobre tener marca registrada no es significativa (-0.045<1,96) al 95% de confianza.

3. Se realiza una regresión para las ventas por género y etnia y su interacción.
sin constante.*/
reg sales male indigenous male#indigenous, nocon
/* Se observa que ser de género masculino aumenta las ventas en un 85,63 
significativamente al 95% de confianza. Además,  ser indígena disminuye las 
ventas en -61,61 no significativo al 95% de confianza. Finalmente, ser de género
femenino e indígena aumenta las ventas en 164.64 no significatviamente al 
95% de confianza.
