/*********************************************************/
/* MKT612, Data Analysis Assignment #3                   */
/* Sample SAS program for model estimation               */
/* Category: liquid laundry detergent                    */
/*********************************************************/

options ls=80 ps=60;

/*** You need to modify the following line for the file diretory ***/
libname hw3 "E:\MKT612\Winter 2006\Assignments\hw3";

data deterg;
set hw3.deterg;

/*********** Part I: Purchase Incidence Model ******************/
/* By default, PROC LOGISTIC estimates the probability of the  */
/* decision outcome with the lower value. In order to estimate */
/* the probability of a purchase being made in the category,   */
/* the following statement assigns a higher value, 2, for the  */
/* no incidence cases.                                         */ 

if incid=0 then incid=2;


/* Create category level variables for the incidence model.   */
/* These are the variables that may affect the attractiveness */
/* of the category. They are defined as follows.              */
/* avg_rp: average regular price of the category.             */ 
/* avg_pc: average price cut of the category.                 */ 
/* cat_disp: =1 if any brand in the category is on in-store   */
/*           display; 0 otherwise.                            */
/* cat_feat: =1 if any brand in the category is on feature    */
/*           advertising; 0 otherwise.                        */
 
avg_rp=mean(of regpr1-regpr4);
avg_pc=mean(of pcut1-pcut4);
cat_disp=0;
cat_feat=0;
if disp1=1 or disp2=1 or disp3=1 or disp4=1 then cat_disp=1;
if feat1=1 or feat2=1 or feat3=1 or feat4=1 then cat_feat=1;


/* Estimate a logistic model for purchase incidence decisions */
proc logistic;
model incid=avg_rp avg_pc cat_disp cat_feat lbpromot;
run;


/************** Part II: Brand Choice Model *******************/

data choice;
set hw3.choice_det;

/* PROC MDC does not automatically add the intercept terms in */
/* a model.  The following statements creates three brand-specific */
/* dummy variables for estimating the intercepts.  Like in a  */
/* regression model, we should use (K-1) intercepts for K brands */
 
intcpt1=0;
intcpt2=0;
intcpt3=0;
if brand=1 then intcpt1=1;
if brand=2 then intcpt2=1;
if brand=3 then intcpt3=1;


/* Estimate a multinomial logit model for brand choice decisions. Note */
/* that this model is called the "conditional logit model" in PROC MDC.*/
/* It is specified by defining TYPE=CLOGIT in the MODEL statement. */

proc mdc;
   model decision = intcpt1-intcpt3 regpr pcut disp feat /type=clogit
         choice=(brand 1 2 3 4);
   id caseid;
run; 



/***************** Part III: Purchase Quantity Models ****************/
/* Estimating the quantity model for one brand at a time.            */
/* Note that display and feature ad are not significant in quantity  */
/* models in general. Therefore, they are omitted to preserve degree */
/* of freedom and avoid multicollinearity (i.e., confounding) with   */
/* price discount.                                                   */ 
/* A semi-log model is estimated for each brand  */ 

data temp1;
set deterg;
if choice=1;
logvol=log(volume);
proc reg;
model logvol=avol regpr1 pcut1 lbpromot;
run;

data temp2;
set deterg;
if choice=2;
logvol=log(volume);
proc reg;
model logvol=avol regpr2 pcut2 lbpromot;
run;

data temp3;
set deterg;
if choice=3;
logvol=log(volume);
proc reg;
model logvol=avol regpr3 pcut3 lbpromot;
run;

data temp4;
set deterg;
if choice=4;
logvol=log(volume);
proc reg;
model logvol=avol regpr4 pcut4 lbpromot;
run;

