PROC MEANS DATA=SASHELP.HEART;
RUN;
/* ttest */
PROC TTEST DATA=SASHELP.HEART h0= 60;
var Height;
RUN;
/* ttest */
PROC TTEST DATA=SASHELP.HEART h0=256 ;
var Cholesterol;
/* chi-squared test */
PROC FREQ DATA =sashelp.HEART;
TABLES Weight_Status * BP_Status / CHISQ;
RUN;
/*ANOVA*/
PROC ANOVA DATA=SASHELP.HEART;
CLASS Status;
MODEL Cholesterol = Status ;
RUN;
