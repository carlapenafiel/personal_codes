rm(list=ls())
library(readxl)
library(tidyr)
library(foreign)
library(dplyr)
library(haven)
library(ggplot2) 
library(gmodels)
library(Hmisc)
library(ggthemes)
library(visdat)
library(tidyverse)
library(reshape)
library(reshape2)
library(plyr)
library(dbplyr)

#Cargar base de datos año-semestre
B20111<-read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20111")
B20112 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20112")
B20121 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20121")
B20122 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20122")
B20131 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20131")
B20132 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20132")
B20141 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20141")
B20142 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20142")
B20151 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20151")
B20152 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20152")
B20161 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20161")
B20162 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20162")
B20171 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20171")
B20172 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20172")
B20181 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20181")
B20182 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20182")
B20191 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20191")
B20192 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="20192")
BT20111<-read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20111")
BT20112 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20112")
BT20121 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20121")
BT20122 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20122")
BT20131 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20131")
BT20132 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20132")
BT20141 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20141")
BT20142 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20142")
BT20151 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20151")
BT20152 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20152")
BT20161 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20161")
BT20162 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20162")
BT20171 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20171")
BT20172 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20172")
BT20181 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20181")
BT20182 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20182")
BT20191 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20191")
BT20192 <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="TING20192")
PROF_CAT <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="PROF CATEDRA")
#PROF_AUX <- read_xlsx("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/BUSQPORCENTFULLDATAv3.xlsx", sheet ="PROF AUXILIARES")
ACAD <- read_xls("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Datos/COPIA-FCFM - BASE ACADEMICOS CON CARGAS FAMILIARES 2020.xls")

#Análisis exploratorio de datos
#Para unir de forma vertical las bases de datos, deben tener los mismos nombres en las columnas, por lo que comenzamos
#revisándolas.
colnames(B20111)
colnames(B20112)
colnames(B20121)
colnames(B20122)
colnames(B20131)
colnames(B20132)
colnames(B20141)
colnames(B20142)
colnames(B20151)
colnames(B20152)
colnames(B20161)
colnames(B20162)
colnames(B20171)
colnames(B20172)
colnames(B20181)
colnames(B20182)
colnames(B20191)
colnames(B20192)

summary(B20111)

#Creamos una variable para identficiar el año y el semestre del curso
B20111$SEMESTRE <- "2011-1"
B20112$SEMESTRE <- "2011-2"
B20121$SEMESTRE <- "2012-1"
B20122$SEMESTRE <- "2012-2"
B20131$SEMESTRE <- "2013-1"
B20132$SEMESTRE <- "2013-2"
B20141$SEMESTRE <- "2014-1"
B20142$SEMESTRE <- "2014-2"
B20151$SEMESTRE <- "2015-1"
B20152$SEMESTRE <- "2015-2"
B20161$SEMESTRE <- "2016-1"
B20162$SEMESTRE <- "2016-2"
B20171$SEMESTRE <- "2017-1"
B20172$SEMESTRE <- "2017-2"
B20181$SEMESTRE <- "2018-1"
B20182$SEMESTRE <- "2018-2"
B20191$SEMESTRE <- "2019-1"
B20192$SEMESTRE <- "2019-2"
BT20111$SEMESTRE <- "2011-1"
BT20112$SEMESTRE <- "2011-2"
BT20121$SEMESTRE <- "2012-1"
BT20122$SEMESTRE <- "2012-2"
BT20131$SEMESTRE <- "2013-1"
BT20132$SEMESTRE <- "2013-2"
BT20141$SEMESTRE <- "2014-1"
BT20142$SEMESTRE <- "2014-2"
BT20151$SEMESTRE <- "2015-1"
BT20152$SEMESTRE <- "2015-2"
BT20161$SEMESTRE <- "2016-1"
BT20162$SEMESTRE <- "2016-2"
BT20171$SEMESTRE <- "2017-1"
BT20172$SEMESTRE <- "2017-2"
BT20181$SEMESTRE <- "2018-1"
BT20182$SEMESTRE <- "2018-2"
BT20191$SEMESTRE <- "2019-1"
BT20192$SEMESTRE <- "2019-2"

#Arreglar BT
BT20111W <- spread(BT20111, 'TIPO ING', PORCENT)
B20111F <- B20111 %>% 
  dplyr::left_join( (BT20111W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20112W <- spread(BT20112, 'TIPO ING', PORCENT)
B20112F <- B20112 %>% 
  dplyr::left_join( (BT20112W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20121W <- spread(BT20121, 'TIPO ING', PORCENT)
B20121F <- B20121 %>% 
  dplyr::left_join( (BT20121W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20122W <- spread(BT20122, 'TIPO ING', 'CANT TIPO')
B20122F <- B20122 %>% 
  dplyr::left_join( (BT20122W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20131W <- spread(BT20131, 'TIPO ING', PORCENT)
B20131F <- B20131 %>% 
  dplyr::left_join( (BT20131W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20132W <- spread(BT20132, 'TIPO ING', PORCENT)
B20132F <- B20132 %>% 
  dplyr::left_join( (BT20132W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20141W <- spread(BT20141, 'TIPO ING', PORCENT)
B20141F <- B20141 %>% 
  dplyr::left_join( (BT20141W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20142W <- spread(BT20142, 'TIPO ING', PORCENT)
B20142F <- B20142 %>% 
  dplyr::left_join( (BT20142W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20151W <- spread(BT20151, 'TIPO ING', PORCENT)
B20151F <- B20151 %>% 
  dplyr::left_join( (BT20151W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20152W <- spread(BT20152, 'TIPO ING', PORCENT)
B20152F <- B20152 %>% 
  dplyr::left_join( (BT20152W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20161W <- spread(BT20161, 'TIPO ING', PORCENT)
B20161F <- B20161 %>% 
  dplyr::left_join( (BT20161W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20162W <- spread(BT20162, 'TIPO ING', PORCENT)
B20162F <- B20162 %>% 
  dplyr::left_join( (BT20162W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20171W <- spread(BT20171, 'TIPO ING', PORCENT)
B20171F <- B20171 %>% 
  dplyr::left_join( (BT20171W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20172W <- spread(BT20172, 'TIPO ING', PORCENT)
B20172F <- B20172 %>% 
  dplyr::left_join( (BT20172W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20181W <- spread(BT20181, 'TIPO ING', PORCENT)
B20181F <- B20181 %>% 
  dplyr::left_join( (BT20181W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20182W <- spread(BT20182, 'TIPO ING', PORCENT)
B20182F <- B20182 %>% 
  dplyr::left_join( (BT20182W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20191W <- spread(BT20191, 'TIPO ING', PORCENT)
B20191F <- B20191 %>% 
  dplyr::left_join( (BT20191W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )

BT20192W <- spread(BT20192, 'TIPO ING', PORCENT)
B20192F <- B20192 %>% 
  dplyr::left_join( (BT20192W %>% dplyr::select(-IDCUR, -NOMBRE, -SEMESTRE)), by= "CURSO" )


#Crear base de datos unida
BD1_APPEND<- rbind.fill(B20111F,B20112F,B20121F,B20122F,B20131F,B20132F,B20141F,B20142F,B20151F,B20152F,B20161F,B20162F,B20171F,B20172F,B20181F,B20182F,B20191F,B20192F)

#Antes de hacer merge entre alumnos y profesores, se hará el merge entre bases de profesores.
#Tenemos 2 bases de datos para esto: PROF_CAT y ACAD.

#IDCUR es igual en BD1_APPEND & PROF_CAT
PROF_CAT <-dplyr :: rename(PROF_CAT, IDCUR = `ID CURSO`)
#PROF_AUX <-dplyr :: rename(PROF_AUX, IDCUR = `ID CURSO`)

BD2_MERGE <- BD1_APPEND %>% 
  dplyr::left_join( (PROF_CAT %>% dplyr::select(-CURSO, -SEMESTRE)), by= "IDCUR")

#BD2_MERGE <- BD2_MERGE1 %>% 
 # dplyr::left_join( (PROF_AUX %>% dplyr::select(-CURSO, -SEMESTRE, -NOMBRE__1)), by= "IDCUR")

#6.723 observaciones fueron merge con la BD1_APPEND desde PROF_CAT
#BD3_MERGE <- dplyr::full_join(ACAD, BD2_MERGE, by="RUT")

#Hasta ahora tenemos: Curso y sus estadísticas, Rut del profesor y su nombre. Solo nos falta merge con la carga.
#Desafío: La carga debe aparecer SOLO cuando el profesor/a lo haya tenido ya dando el curso (o justo).

#Idea: Separar fecha  de nac de hijos en MES - AÑO y crear nueva variable SEMESTRE: AÑO DE NAC - SEMESTRE Luego
#En el merge solo deberá aparecer el hijo o los hijos si el AÑO - SEMESTRE es >= al SEMESTRE de cuando se dictó el curso.
ACAD$MES <- substr(ACAD$`fecha nacimiento carga`, 4, 5)
ACAD$MES <- as.numeric(ACAD$MES)
ACAD$ANHO <- substr(ACAD$`fecha nacimiento carga`, 7, 10)

#Definimos el semestre según el mes de nacimiento del hijo/a
ACAD = ACAD %>%
  mutate(S = case_when(MES <= 6  ~ "1", 
                       MES >= 7  ~ "2")
         )
#Creamos la nueva variable Semestre para esta BD
ACAD <- ACAD %>% unite(SEMESTRE, ANHO:S, sep = "-")

write.csv(ACAD, file = "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/ACAD.csv")
write.csv(BD2_MERGE, file = "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/bd_merge.csv")

#Ocupar STATA Wide.do

ACAD2 <- read_xls("/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/acad3.xls")

#Cambiar nombre de variable rut
ACAD2 <-dplyr :: rename(ACAD2, RUT = rut)
#BD2_MERGE <-dplyr :: rename(BD2_MERGE, RUT = RUT.x)

#Merge todo
BD3 <- BD2_MERGE %>% 
  dplyr::left_join(( ACAD2 %>% dplyr::select(-run, -rut2, -dv)), by= "RUT")


write.csv(BD3, file = "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/BD3.csv")

#STATA correr Merge_final.do

## Para ver profesores/as que no tienen datos de cargas
sum(duplicated(ACAD$RUT))
PROF_CARGAS<- ACAD[!duplicated(ACAD$RUT), ]

sum(duplicated(PROF_CAT$RUT))
PROF_BD2 <- PROF_CAT[!duplicated(PROF_CAT$RUT), ]

BDPROFESORES_CONYSINCARGA <- PROF_BD2 %>% 
  dplyr::left_join( (PROF_CARGAS %>% dplyr::select(-rut, -run, -dv, -sexo, -edad, -`fecha ingreso universidad`, -jornada, -`sexo carga`, -`rut carga`,-`nombre carga`, -`fecha nacimiento carga`,-`apellido paterno carga`,-`apellido materno carga`,-parentesco,-`nombres carga`,-SEMESTRE, -MES, -PARENTESCO)), by= "RUT")

Profes_sindatos1<-sum(is.na(BDPROFESORES_CONYSINCARGA$calidad))
Profes_sindatos2<-sum(is.na(BDPROFESORES_CONYSINCARGA$nombre))
Profes_sindatos3<-sum(is.na(BDPROFESORES_CONYSINCARGA$departamento))

#2274 profesores sin datos de cargas.
#BD TOTAL: 2334
#60 PROFESORES CON CARGA + 5 nuevos = 65 (BD CON 61)
#2269 datos sin carga.

write.csv(BDPROFESORES_CONYSINCARGA, file = "/Users/carlospenafielbrito/Dropbox (JPAL LAC)/Género-FCFM/Analisis/data_aux/BDPROFESORESF.csv")




