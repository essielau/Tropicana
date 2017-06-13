/* Project 3: Evaluating Sales Promotion Effects using Scanner Panel Data */
/* This code converts the original scanner panel data 'deterg.sas7bdat' */
/* into a new dataset with the structure required by PROC MDC. */
/* Note: PROC MDC is to be used for estimating Multinomial Logit (MNL) models */

/* Set the number of lines per page in the output file */
options ps=60;

/*Define the libary name first in order to locate the data files.*/
/* You need to change the path according to dir on your computer*/

libname proj3 '/folders/myfolders/Courses/BUMK758K (CP 2015)/Week 9_c/';


data newdata;
set proj3.deterg;
if incid=1;    /* keep only observations with a category purchase */

/* The trick here is to use arrary, which refers to multiple variables with index */
array regpr_a{*} regpr1-regpr4;  /* the array regpr_a can take any other name */ 
array pcut_a{*} pcut1-pcut4;
array disp_a{*} disp1-disp4;
array feat_a{*} feat1-feat4;  

retain caseid 0;     /* create CASEID, which ID's choice decision occasions in the data */ 
caseid + 1;

do i = 1 to 4;
   brand = i;
   if choice = i then decision = 1;
   else decision = 0;
   regpr = regpr_a{i};   /* regpr_a{i} is the i-th element in array regpr_a */
   pcut = pcut_a{i};
   disp = disp_a{i};
   feat = feat_a{i};
   output;
end;

keep caseid panid week brand decision regpr pcut disp feat;
run;

/* Check whether the newly created data structure is correct */
proc print data=newdata (obs=20);   /* print out the first 20 observations */
run;

/* Now save the new data as a permanent dataset. It's called 'choice_det.sas7bdat' */
/* for project 3 assigment. But please give a different name and don't overwrite that file. */
data proj3.choicedata;
set newdata;
run;
