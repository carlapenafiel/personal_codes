
#Paquetes
suppressMessages(library(corpcor))

# Data  
#Cognitive abilities 
cog <- cbind(scale(data$pst_cog, center=F, scale=T),scale(data$pst_exp, center=F, scale=T),scale(data$pst_rec, center=F, scale=T))
#With IRT: cog2 <- cbind(data$fac_cog, data$fac_exp, data$fac_rec)

#To socioemotional skills, we did two different form.
#With dimensions
#Cambiar a las dimensiones ya estandarizadas de la BD.
#Ale preguntar sobre escalas
extraversion <- cbind(scale(data$ibq1, center=F, scale=T),scale(data$ibq2, center=F, scale=T),scale(data$ibq7, center=F, scale=T),
                      scale(data$ibq8, center=F, scale=T),scale(data$ibq13, center=F, scale=T),scale(data$ibq14, center=F, scale=T),
                      scale(data$ibq15, center=F, scale=T),scale(data$ibq20, center=F, scale=T),scale(data$ibq21, center=F, scale=T),
                      scale(data$ibq26, center=F, scale=T),scale(data$ibq27, center=F, scale=T),scale(data$ibq36, center=F, scale=T),
                      scale(data$ibq37, center=F, scale=T))
afecneg <- cbind(scale(data$ibq3, center=F, scale=T),scale(data$ibq4, center=F, scale=T),scale(data$ibq9, center=F, scale=T),
                 scale(data$ibq10, center=F, scale=T),scale(data$ibq16, center=F, scale=T),scale(data$ibq17, center=F, scale=T),
                 scale(data$ibq15, center=F, scale=T),scale(data$ibq20, center=F, scale=T),scale(data$ibq21, center=F, scale=T),
                 scale(data$ibq22, center=F, scale=T),scale(data$ibq23, center=F, scale=T),scale(data$ibq28, center=F, scale=T),
                 scale(data$ibq29, center=F, scale=T),scale(data$ibq32, center=F, scale=T),scale(data$ibq33, center=F, scale=T))

reg <- cbind(scale(data$ibq5, center=F, scale=T),scale(data$ibq6, center=F, scale=T),scale(data$ibq11, center=F, scale=T),
             scale(data$ibq12, center=F, scale=T),scale(data$ibq18, center=F, scale=T),scale(data$ibq19, center=F, scale=T),
             scale(data$ibq24, center=F, scale=T),scale(data$ibq25, center=F, scale=T),scale(data$ibq30, center=F, scale=T),
             scale(data$ibq31, center=F, scale=T),scale(data$ibq34, center=F, scale=T),scale(data$ibq35, center=F, scale=T))
soc <- cbind(extraversion,afecneg,reg)
# With everything together 
#soc <- cbin(scale(data$ibq1, center=F, scale=T),scale(data$ibq2, center=F, scale=T),scale(data$ibq7, center=F, scale=T),
#           scale(data$ibq8, center=F, scale=T),scale(data$ibq13, center=F, scale=T),scale(data$ibq14, center=F, scale=T),
#          scale(data$ibq15, center=F, scale=T),scale(data$ibq20, center=F, scale=T),scale(data$ibq21, center=F, scale=T),
#         scale(data$ibq26, center=F, scale=T),scale(data$ibq27, center=F, scale=T),scale(data$ibq36, center=F, scale=T),
#        scale(data$ibq37, center=F, scale=T),scale(data$ibq3, center=F, scale=T),scale(data$ibq4, center=F, scale=T),scale(data$ibq9, center=F, scale=T),
#       scale(data$ibq10, center=F, scale=T),scale(data$ibq16, center=F, scale=T),scale(data$ibq17, center=F, scale=T),
#      scale(data$ibq15, center=F, scale=T),scale(data$ibq20, center=F, scale=T),scale(data$ibq21, center=F, scale=T),
#     scale(data$ibq22, center=F, scale=T),scale(data$ibq23, center=F, scale=T),scale(data$ibq28, center=F, scale=T),
#    scale(data$ibq29, center=F, scale=T),scale(data$ibq32, center=F, scale=T),scale(data$ibq33, center=F, scale=T),
#   scale(data$ibq5, center=F, scale=T),scale(data$ibq6, center=F, scale=T),scale(data$ibq11, center=F, scale=T),
#  scale(data$ibq12, center=F, scale=T),scale(data$ibq18, center=F, scale=T),scale(data$ibq19, center=F, scale=T),
# scale(data$ibq24, center=F, scale=T),scale(data$ibq25, center=F, scale=T),scale(data$ibq30, center=F, scale=T),
#scale(data$ibq31, center=F, scale=T),scale(data$ibq34, center=F, scale=T),scale(data$ibq35, center=F, scale=T))


#b24 peso del niño al nacer vs b34 actual
#b8 talla al nacer vs b35 actual (ultimo control)
#Entender estandarización
health <-cbind(data$b34, data$b35)
health1 <- cbind(data$b24, data$b8)


#Time investment
invest1 <- cbind(scale(data$hrs_cuidador_tvconnino, center=F, scale=T),scale(data$hrs_cuidador_leyendole, center=F, scale=T),scale(data$hrs_cuidador_jugandonino, center=F, scale=T),scale(data$hrs_cuidador_connino, center=F, scale=T))
#invest1 <- cbind(scale(data$hrs_cuidador_tvconnino, center=F, scale=T),scale(data$hrs_cuidador_leyendole, center=F, scale=T),scale(data$hrs_cuidador_jugandonino, center=F, scale=T),
#                scale(data$hrs_cuidador_connino, center=F, scale=T),scale(data$hrs_cuidador_durmiendo, center=F, scale=T),scale(data$hrs_cuidador_tareashogar, center=F, scale=T),
#               scale(data$hrs_cuidador_ocio, center=F, scale=T))
#Question about time investment in excel (binary variables)

#Quality investment
#Two forms: Three bags alone and others
three_bags <- cbind(scale(data$sensibilidad2, center=F, scale=T),scale(data$consideracionpositiva2, center=F, scale=T),scale(data$estimulaciondesarrollocognitivo2, center=F, scale=T),
                    scale(data$intrusividad2, center=F, scale=T), scale(data$consideracionnegativa2, center=F, scale=T),
                    scale(data$distanciamiento2, center=F, scale=T))
#Binary variables, don't scale
#We use all items to responsividad
#Creada  en stata
#responsividadd <- SUMA(data$responsividad1,data$responsividad2,data$responsividad3,data$responsividad4,data$responsividad5,data$responsividad6,
# data$responsividad7,data$responsividad8,data$responsividad9,data$responsividad10,data$responsividad11)
#aceptaciond <- SUMA(data$aceptacion14,data$aceptacion15,data$aceptacion16,data$aceptacion17,data$aceptacion18)
#involucramientod <- SUMA(data$involucramiento35,data$involucramiento36,data$involucramiento37,data$involucramiento38,data$involucramiento39,
#   data$involucramiento40,data$variedad41,data$variedad42)
invest2 <- cbind(three_bags,scale(data$responsividad, center=F, scale=T),scale(data$aceptaciond, center=F, scale=T),scale(data$involucramientod, center=F, scale=T))
#All together
#invest2 <- cbindd(scale(data$sensibilidad2, center=F, scale=T),scale(data$consideracionpositiva2, center=F, scale=T),scale(data$estimulaciondesarrollocognitivo2, center=F, scale=T),
#                scale(data$intrusividad2, center=F, scale=T), scale(data$consideracionnegativa2, center=F, scale=T),
#               scale(data$distanciamiento2, center=F, scale=T),data$responsividad1,data$responsividad2,data$responsividad3,data$responsividad4,data$responsividad5,data$responsividad6,
#              data$responsividad7,data$responsividad8,data$responsividad9,data$responsividad10,data$responsividad11,data$aceptacion14,data$aceptacion15,data$aceptacion16,data$aceptacion17,
#             data$aceptacion18,ata$involucramiento35,data$involucramiento36,data$involucramiento37,data$involucramiento38,data$involucramiento39,
#            data$involucramiento40,data$variedad41,data$variedad42)


#Material Investment
invest3 <- cbind(scale(data$materialesd, center=F, scale=T),scale(data$variedadd, center=F, scale=T),scale(data$organizaciond, center=F, scale=T))

#Parental abilities
#Cambiar pcog pbeliefs y psoc
pcog <- cbind(scale(data$nivel_educacional_hh1_entrevista, center=F, scale=T),scale(data$self_efficacy, center=F),scale(data$impact, center=F, scale=T))
#Curso al que llegó ingresado manualmente. Duda sobre cómo hacer esta parte.

pbeliefs <- cbind(scale(data$self_efficacy, center=F, scale=T),scale(data$impact, center=F, scale=T),scale(data$hostile, center=F, scale=T),scale(data$overprotection, center=F, scale=T))

psoc <- cbind(scale(data$PSI_PD, center=F, scale=T),scale(data$PSI_DC, center=F, scale=T),scale(data$PSI_P_CDI, center=F, scale=T))

phealth <- cbind (scale(data$b7, center=F, scale=T),scale(data$b8, center=F, scale=T))

#Income
#Indice de bienestar con cuartiles o no
income <- cbind(scale(data$ingreso_promedio, center=F, scale=T),scale(data$wealth_index_v, center=F, scale=T))

#income <- cbind(scale(data$trabajo_hh1_entrevistada, center=F, scale=T),scale(data$ingreso_promedio, center=F, scale=T),
#               scale(data$wealth_index, center=F, scale=T))
#Prices

#Numchildren 
#Conversar sobre otras variables que se podrían agregar.
numchildren <- cbind(data$sexo_hh2_ninoseleccionado, scale(data$edad_hh2_ninoseleccionado, center=F, scale=T),
                     scale(data$id12, center=F, scale=T))

Ncog <- ncol(cog)
Ncog1 <- 0 #Se normaliza a 0. 
Nsoc<- ncol(soc)
Nsoc1<- 0 #Normalizar a 0

Nhealth <- ncol(health)
Nhealth1 <- ncol(health1) #Se normaliza a peso al nacer

Ninvest1 <- ncol(invest1)
Ninvest2 <- ncol(invest2)
Ninvest3 <- ncol(invest3)
#Ninvest1 <- ncol(invest1)
Ninvest0 <-0 #Se normaliza a 0.

Npcog <- ncol(pcog)
Npbel <-ncol(pbeliefs)
Npsoc <- ncol(psoc)
Nphealth <- ncol(phealth)
Nincome <- ncol(income)

#Nprices12 <- ncol(prices12)
#Nprices8 <- ncol(prices8)
#Nprices5 <- ncol(prices5)

Nnumchild <- ncol(numchildren)

#standardize data that is not dynamic
#Question: si ya estandarizamos arriba no se deberia volver hacer.

#phealth<-scale(phealth,center=T, scale=T)
#pcog<-scale(pcog,center=T, scale=T)
#numchildren<-scale(numchildren, center=T, scale=T)
#income<-scale(income, center=T, scale=T)
#prices12<-scale(prices12, center=T, scale=T)
#prices8<-scale(prices8, center=T, scale=T)
#prices5<-scale(prices5, center=T, scale=T)

y <- data.matrix(cbind(cog, soc, health, health1, invest1, invest2, invest3, pcog, pbeliefs,psoc, phealth, income, numchildren))
y[is.na(y)] <- 0
nZ <- ncol(y)       # nZ : number of measurements

nobs <- nrow(y)     # nObs : number of observations

#No tenemos precios. Indagar sobre esto.
#ninst <- Nprices12+Nprices8+Nprices5+Nnumchild
ninst <- Nnumchild
nZinst <- nZ-ninst
skill<-c(2,2)
##########################################################
# Set the inputs for the EM continuous function     
##########################################################      

# Initial values for M step: this is a list with (sigma, mean, prop)  
mean0 <- rbind(rep(-.00005, nZ), rep(.00005, nZ))       
cov.start <- make.positive.definite(cov(y, use ="complete.obs"))
sigma0 <- list(cov.start, cov.start)
prop0 <- c(.5,.5)
mstep.start <- list(mean0, sigma0, prop0)

#Duda
# Number of mixtures              
nM <- 2
# Number of skills
nS <- 2
# Number of factors 
nF <-12

# Convergence criterion            
conv <- 1e-04

# Configuration of factor loadings  (2 = free param, 1 = normalized to 1, 0 = fixed to 0) 
#startSeq <- c(1, 1+Ncog12,1+Ncog12+Ncog8, 1+Ncog12+Ncog8+Ncog5, 1+Ncog12+Ncog8+Ncog5+Nhealth12, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8+Nhealth5, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8+Nhealth5+Nhealth1, 
#            1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12, 1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8,
#         1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5,
#          1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog,
#           1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth,
#          1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12,
#          1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12+Nincome8,
#           1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12+Nincome8+Nincome5)

startSeq <- c(1, 1+Ncog,1+Ncog+Nsoc, 1+Ncog+Nsoc+Nhealth,1+Ncog+Nsoc+Nhealth+Nhealth1,1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2,  1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth+Npsoc,
              1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth+Npsoc+Nincome)

endSeq <- c(startSeq[2:(nF)]-1,nZ-ninst)

freelambda <- matrix(0, nZinst, nF) 
for (i in 1:nF) freelambda[startSeq[i]:endSeq[i], i]     <- 2 
for (i in 1:nF) freelambda[startSeq[i], i]               <- 1

#Configuration of constants (2 = free param, otherwise constant is set according to normalized measure in base period)
constparam <- matrix(0,nZinst,1)
meanbase<-colMeans(y,na.rm=TRUE)

#Set constants for baseline measures and age-invariant measures to true values
#Configure constantes para medidas de línea base y medidas invariantes para la edad en valores verdaderos
for (i in 1:nF) constparam[startSeq[i]:endSeq[i]]     <- 2 
#age invariant/normalized
for (i in 1) constparam[startSeq[i]]               <- meanbase[startSeq[1]]
for (i in 2:3) constparam[startSeq[i]]               <- meanbase[startSeq[3]]
for (i in 4) constparam[startSeq[i]]               <- meanbase[startSeq[4]]
for (i in 5) constparam[startSeq[i]]               <- meanbase[startSeq[5]]
for (i in 6) constparam[startSeq[i]]               <- meanbase[startSeq[6]]
for (i in 7) constparam[startSeq[i]]               <- meanbase[startSeq[7]]
for (i in 8) constparam[startSeq[i]]               <- meanbase[startSeq[8]]
for (i in 9) constparam[startSeq[i]]               <- meanbase[startSeq[9]]
for (i in 10) constparam[startSeq[i]]               <- meanbase[startSeq[10]]
for (i in 11) constparam[startSeq[i]]               <- meanbase[startSeq[11]]
for (i in 12) constparam[startSeq[i]]               <- meanbase[startSeq[12]]



#remaining first period

#Averiguar por baseline, cómo sería para nuestro caso.
#baseline<-c((Ncog12+Ncog8+1):(Ncog12+Ncog8+Ncog5),
#(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+1):(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1),
#(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+1):(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5),
#(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+1):(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog),
#(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+1):(Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12+Nincome8+Nincome5))

#baseline <- c((Ncog+1):(Ncog+Nsoc),(Ncog+Nsoc+1):(Ncog+Nsoc+Nhealth), (Ncog+Nsoc+Nhealth+1):(Ncog+Nsoc+Nhealth+Nhealth1),
#             (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3),
#            (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog),
#           (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Npsoc+Nphealth+Nincome))

baseline <- c((Ncog+1):(Ncog+Nsoc),(Ncog+Nsoc+1):(Ncog+Nsoc+Nhealth), (Ncog+Nsoc+Nhealth+1):(Ncog+Nsoc+Nhealth+Nhealth1),
              (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3),
              (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog),
              (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel),
              (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Npsoc),
              (Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Npsoc+1):(Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Npsoc++Nphealth+Nincome))


for (i in (baseline)) constparam[i] <- meanbase[i]

freeconstant<-constparam
freeconstant[which(freeconstant!=2)]  <- 1

#lambda baseline #Mirar esta parte
#baselinelambda<-c(3,7,10,11,12,15)
#baselinemean<-c(3,7,10,11,12,13,14,15)

baselinelambda<-c(1,3,4,5,6,7,8,9,10,11,12)
baselinemean<-c(1,3,4,5,6)

#Construct matrix to pull values for income covariances from EM to add to LS step

#instcovpull <- c(1, 1+Ncog12,1+Ncog12+Ncog8, 1+Ncog12+Ncog8+Ncog5, 1+Ncog12+Ncog8+Ncog5+Nhealth12, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8+Nhealth5, 1+Ncog12+Ncog8+Ncog5+Nhealth12+Nhealth8+Nhealth5+Nhealth1, 
#             1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12, 1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8,
#            1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5,
#           1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog,
#          1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth,
#         1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12,
#        1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12+Nincome8,
#          (1+Ncog12+Ncog8+Ncog5+Ncog1+Nhealth12+Nhealth8+Nhealth5+Nhealth1+Ninvest12+Ninvest8+Ninvest5+Npcog+Nphealth+Nincome12+Nincome8+Nincome5):nZ)

instcovpull <- c(1, 1+Ncog,1+Ncog+Nsoc, 1+Ncog+Nsoc+Nhealth,1+Ncog+Nsoc+Nhealth+Nhealth1,1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2,  1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth+Npsoc,
                 1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth+Npsoc+Nincome,
                 (1+Ncog+Nsoc+Nhealth+Nhealth1+Ninvest1+Ninvest2+Ninvest3+Npcog+Npbel+Nphealth+Npsoc+Nincome):nZ)

# Initial values of parameters for the minimum distance step (if choose measures for latent factors normalized to 1, don't have to divide by lambda^2)        
param.start <- c(rep(1,nZinst), rep(1, nM*0.5*nF*(nF+1)), rep(1,nF*2-length(baselinemean)), rep(1, length(which(freelambda==2))), rep(1, length(which(freeconstant==2))) ) 

EMstart1 <- list(mstep.start, param.start, y, nM, nF, freelambda, constparam, instcovpull, ninst, nobs, conv)
save(EMstart1, file="EMstart1.Rdata")

namef<- c("cog", "soc", "health","health1", 
          "invest1", "invest2", 
          "invest3", 
          "pcog", "pbeliefs","psoc","phealth", "income", 
          "numchildren")  
