/* Project 1: Pricing Models  */
 

libname mydir '/folders/myfolders/analytics/';

data temp;
set mydir.tropic;     /* load the SAS data file 'tropic.sas7bdat' */

/* Create log-transformation of sales and price */
lq=log(quant);
lp=log(price);

/* Create three dummy variables for the four quarters */
/* treating the fourth quarter as the baseline */
qrt1=0;
qrt2=0;
qrt3=0;
if (week>=1 and week<=13) or (week>=53 and week<=65) then qrt1=1;
if (week>=14 and week<=26) or (week>=66 and week<=78) then qrt2=1;
if (week>=27 and week<=39) or (week>=79 and week<=91) then qrt3=1;

/* Creating a dummy variable for price ending with 9 cents */
/* Note that in the first statement, PRICE is converted from */
/* a numerical variable into a character variable, because */
/* the function 'substr' only apply to character variables. */

chprc=put(price,4.2);
if substr(chprc,4,1)="9" then end9=1;
else end9=0;


/* Get frequency table of DEAL and STORE */
proc freq;
table deal store;
table end9;

/* Get descriptive statistics of sales and price */
proc means;
var quant price;

/* Get average sales volume by store */
proc means;
var quant;
class store;

/* Get correlation matrix of sales, price, and week */
proc corr;
var quant price week;


/* Estimate alternative models in the following proc reg statement */
proc reg;
model quant = price deal;    /* linear model */
model lq = lp deal;            /* log-log model */
model lq = lp deal qrt1-qrt3;  /* log-log models */
model lq = price deal;             /* semi-log models */
model lq = price deal qrt1-qrt3;   /* semi-log models */
run; 

/* Estimate these models, using 'proc reg' and 'add' statements */

proc reg data = temp;  
var price lp deal qrt1-qrt3 end9;
model quant = price deal;    /* linear model */
add qrt1-qrt3;               /* linear model with seasonality */
add end9;
model lq = lp deal;            /* log-log model */
add qrt1-qrt3;                 /* log-log models with seasonality*/
add end9;
model lq = price deal;             /* semi-log models */
add qrt1-qrt3;                 /* semi-log models with seasonality */
add end9;
run; 

