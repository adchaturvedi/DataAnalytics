/** import data from sas help **/
data Cars;
set sashelp.cars;
run;

/** content of the data **/
proc contents data = cars out =cars_details;
run;

/** variable exploration with proc mean **/
proc means data = cars;
var length;
run;

proc means data = cars;
var length Weight Invoice EngineSize;
run;

proc means data = cars nmiss;
var length Weight Invoice EngineSize;
run;

/** variable exploration with prox freq **/
proc freq data;
table make;
run;

proc freq data = cars;
table origin * type;
run;

/** plotting variables **/
ods graphics on;
proc univariate data = cars;
proc gplot data = cars;
plot length * weight;
run;
quit;

/** variable exploration using univariate **/
proc univariate data = cars;
var length;
run;
quit;

ods graphics on;
proc univariate data = cars;
histogram length;
run;
quit;

/*** correlation ***/;
proc corr data = cars out = corr_cars;
var length Weight Invoice EngineSize;
run;
quit;

/**** Outliars detection ****/;

proc INSIGHT DATA = cars_data;
scatter MPG_City weight horsepower length * MPG_City weight horsepower length;
output out = outdata (keep = MPG_City weight horsepower length r) rstudent =r;
run;
quit;

proc univariate data = outdata plot;
var r;
run;
quit;
