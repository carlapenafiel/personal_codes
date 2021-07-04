%%Construcción de datos
clear; 
clc; 
rng('default');
K=2; 
N=1000; 
%Verdaderos beta
beta=[-0.5;2;-2]; 
%Varianzas poblacionales
sigma1=5; %Varianza poblacional X1
sigma2=6; %Varianza poblacional X2

%Esperanzas
mu1=0; %de x1
mu2=0; %de x2
mu=zeros(1,2);

%Covarianzas
lambdaI=0.1; %muestra I
lambdaII=0.8; %muestra II.

% Definición para los los shocks aleatorios
sz=[N 1];
e=trnd(20,sz); 

%Muestra de datos caso I
X_1=mvnrnd(mu,[sigma1 lambdaI; lambdaI sigma2], N); %Creación de matriz con datos para las variables X caso I.
XI=[ones(N,1),X_1]; %Incorporamos fila de unos.

X1I=[XI(:,1),XI(:,2)]; %Fila de constante + X1 muesta I
X2I=[XI(:,1),XI(:,3)]; %Fila de constante + X2 muestra I

%Muestra de datos caso II
X_2=mvnrnd(mu,[sigma1 lambdaII; lambdaII sigma2], N); %Creación de matriz con datos para las variables X caso II.
XII=[ones(N,1),X_2]; %Incorporamos una fila de unos.

X1II=[XII(:,1),XII(:,2)]; %Fila de constante + X1 muesta II
X2II=[XII(:,1),XII(:,3)]; %Fila de constante + X1 muesta II

%% Pregunta 1
% Modelo Verdadero 
YI=XI*beta+e;   %muestra I.
%Estimación por mínimos cuadrados ordinarios
beta_MCOI=(XI'*XI)^-1*XI'*YI;  %Estimación POR MCO
eI=(YI)-(XI*beta_MCOI); %Estimación del error
S2I=(eI'*eI)/(N-K);
VarI=(S2I*(XI'*XI)^-1); %Estimador matriz de la var-cov.
sdI=sqrt(diag(VarI));

beta_MCOI
S2I
VarI
sdI
%% Pregunta 2
% Modelo Verdadero 
YII=XII*beta+e;   %muestra II.
%Estimación por mínimos cuadrados ordinarios
beta_MCOII=(XII'*XII)^-1*XII'*YII;  %Estimación POR MCO
eII=(YII)-(XII*beta_MCOII); %Estimación del error
S2II=(eII'*eII)/(N-K);
VarII=(S2II*(XII'*XII)^-1); %Estimador matriz de la var-cov.
sdII=sqrt(diag(VarII));

beta_MCOII
S2II
VarII
sdII
%% Pregunta 3
%Ahora vamos a estimar el modelo sin la variable X2.
%Con muestra I
beta3_MCOI=(X2I'*X2I)^-1*X2I'*YI; %muestra I
e3I=(YI)-(X2I*beta3_MCOI); %Estimación del error
S3I=(e3I'*e3I)/(N-K);
V3I=(S3I*(X2I'*X2I)^-1); %Estimador matriz de la var-cov.
sd3I=sqrt(diag(V3I));
%Con muestra II
beta3_MCOII=(X2II'*X2II)^-1*X2II'*YII; %muestra II
e3II=(YII)-(X2II*beta3_MCOII); %Estimación del error
S3II=(e3II'*e3II)/(N-K);
V3II=(S3II*(X2II'*X2II)^-1); %Estimador matriz de la var-cov.
sd3II=sqrt(diag(V3II));

beta3_MCOI
sd3I
beta3_MCOII
sd3II
%% Pregunta 4
%crítico z
z=1.96;  %Valor crítico 
%[Con muestra 1]
IC1I=[beta_MCOI(2)-(z*sdI(2))*(N)^(-.5), beta_MCOI(2)+(z*sdI(2))*(N)^(-.5)];
%[Con muestra 1]
IC1II=[beta_MCOII(2)-(z*sdII(2))*(N)^(-.5), beta_MCOII(2)+(z*sdII(2))*(N)^(-.5)];

IC1I
IC1II

%% Pregunta 5
%Nuevamente fijamos z
z = 2.575;
Var_auxI=[VarI(2,2),VarI(2,3);VarI(3,2),VarI(3,3)];
Var_auxII=[VarII(2,2),VarII(2,3);VarII(3,2),VarII(3,3)];
%Calculamos los intervalos de confianza
g_I = sqrt(beta_MCOI(2)^2+beta_MCOI(3)^2);
G_I= [beta_MCOI(2)/g_I  beta_MCOI(3)/g_I];
SE_I = sqrt(G_I*Var_auxI*G_I');
IC_I = [g_I-z*SE_I*(N)^(-.5)  g_I+z*SE_I*(N)^(-.5)];

%Calculamos los intervalos de confianza
g_II = sqrt((beta_MCOII(2)^(2))+(beta_MCOII(3)^(2)));
G_II= [beta_MCOII(2)/g_I  beta_MCOII(3)/g_I];
SE_II = sqrt(G_II*Var_auxII*G_II');
IC_II = [g_II-z*SE_II*(N)^(-.5) g_II+z*SE_II*(N)^(-.5)];

IC_I
IC_II
%% Pregunta 6

%Test de Wald 

R=[0,1,1];
r=0.1;

Wald6I=((R*beta_MCOI-r)'*((R*((XI'*XI)^(-1))*R')^(-1))*(R*beta_MCOI-r))/S2I;
Wald6II=((R*beta_MCOII-r)'*((R*((XII'*XII)^(-1))*R')^(-1))*(R*beta_MCOII-r))/S2II;

Wald6I
Wald6II
%% Pregunta 7

%Test de Wald no lineal I

gI=log(beta_MCOI(2))-beta_MCOI(3);  %Aplicamos logaritmo natural función de parámetros.
q=1;                          %Valor a comparar o valor de testeo.
GI= [1/(beta_MCOI(2)) (1)];  %Gradiente de la función g1_ln

Wald7I=((gI-q)'*((GI*((X_1'*X_1)^(-1))*GI')^(-1)*(gI-q)))/S2I;
Wald7I
%Test de Wald no lineal II

gII=log(beta_MCOII(2))-beta_MCOII(3);  %Aplicamos logaritmo natural función de parámetros.                          %Valor a comparar o valor de testeo.
GII= [1/(beta_MCOII(2)) (1)];  %Gradiente de la función g1_ln

Wald7II=((gII-q)'*((GII*((X_2'*X_2)^(-1))*GII')^(-1)*(gII-q)))/S2II;
Wald7II

%% Pregunta 8

r2=[0, 0.1]';
R2=[1,0,0;0,1,1];

Wald8I=(R2*beta_MCOI-r2)'*(R2*(XI'*XI)^-1*R2')^-1*(R2*beta_MCOI-r2)/S2I;
Wald8II=(R2*beta_MCOII-r2)'*(R2*(XII'*XII)^-1*R2')^-1*(R2*beta_MCOII-r2)/S2II;

Wald8I
Wald8II

%% Pregunta 9 %%
total_m = 1000;
size_m=1000;
for i=1:total_m
    for m=1:size_m % 
        j=randi(N); % num entero aleatorio
        Y_a(m,1 )=YI(j); 
        X_a(m,:)=[X_1(j,1) X_1(j,2)]; 
    end
    beta_a=((X_a'*X_a)^-1)*X_a'*Y_a; % Calculo estimador
    bootsg(i,:)=[beta_a(1,1) beta_a(2,1)]; % Guardo su valor
end
% Estimador
beta_mI = mean(bootsg)

% Muestra II: 
for i=1:total_m
    for m=1:size_m % para ...
        j=randi(N); % n?mero entero aleatorio
        Y_b(m,1 )=YII(j); 
        X_b(m,:)=[X_2(j,1) X_2(j,2)]; 
    end
    beta_b=((X_b'*X_b)^-1)*X_b'*Y_b; % Calculo estimador
    bootsg2(i,:)=[beta_b(1,1) beta_b(2,1)]; % Guardo su valor
end
% Estimador
beta_mII = mean(bootsg2)

%Test de Wald no lineal muestra I
g9=log(abs(beta_mI(1)-beta_mI(2)));  %Aplicamos logaritmo natural función de parámetros.
q=1;                          %Valor a comparar o valor de testeo.
G9= [1/(beta_mI(1)-(beta_mI(2))) -1/(beta_mI(1)-(beta_mI(2)))];  %Gradiente de la función g1_ln

Wald9I=((g9-q)'*((G9*((X_a'*X_a)^(-1))*G9')^(-1)*(g9-q)))/S2I;
Wald9I

%Test de Wald no lineal II
g9b=log(abs(beta_mII(1)-beta_mII(2)));  %Aplicamos logaritmo natural función de parámetros.
q=1;                          %Valor a comparar o valor de testeo.
G9b= [1/(beta_mII(1)-(beta_mII(2))) -1/(beta_mII(1)-(beta_mII(2)))];  %Gradiente de la función g1_ln

Wald9II=((g9b-q)'*((G9b*((X_b'*X_b)^(-1))*G9b')^(-1)*(g9b-q)))/S2II;
Wald9II

%Test de Wald no lineal muestra I
g9=log(abs(beta_MCOI(2)-beta_MCOI(3)));  %Aplicamos logaritmo natural función de parámetros.
q=1;                          %Valor a comparar o valor de testeo.
G9= [(1/(beta_MCOI(2)-(beta_MCOI(3)))) (-1/(beta_MCOI(2)-(beta_MCOI(3))))];  %Gradiente de la función g1_ln

Wald9Iantes=((g9-q)'*((G9*((X_1'*X_1)^(-1))*G9')^(-1)*(g9-q)))/S2I;
Wald9Iantes

%Test de Wald no lineal II
g9b=log(abs(beta_MCOII(2)-beta_MCOII(3)));  %Aplicamos logaritmo natural función de parámetros.
q=1;                          %Valor a comparar o valor de testeo.
G9b= [1/(beta_MCOII(2)-(beta_MCOII(3))) -1/(beta_MCOII(2)-(beta_MCOII(3)))];  %Gradiente de la función g1_ln

Wald9IIantes=((g9b-q)'*((G9b*((X_2'*X_2)^(-1))*G9b')^(-1)*(g9b-q)))/S2II;
Wald9IIantes