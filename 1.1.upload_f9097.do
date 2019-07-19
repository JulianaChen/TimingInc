/*******************************************************************************
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 15, 2019
*	Last update: 	Jul 19, 2019
*	Written by:		Juliana Chen
********************************************************************************

** PURPOSE: 	Uploads Data from the Family-Year Files from 1990 to 2007 and 
				obtains the treatment variable (i.e. parental income) as well as
				covariates

** FLOW:		1. Set globals for variable names
				2. Insheet data from text files (downloaded from website)
				3. Label variables and rename them
				4. Save processed files individually

** NOTES:		- Variable names and labels obtained from dictionary files

*******************************************************************************/

// Select Variables

/* Variables:	- Treatment: paternal income (permanent and at each year)
				- Covariates: paternal years of education, paternal age at birth,
				paternal income growth (based on pre-birth and post-17 income),
				maternal years of education, and maternal age at birth			*/ 

global	varsall	"	intnum	state	famsize	hhinc	marstat	mempst	fempst	mearn	fearn	mrace	frace	mage	fage	medu	fedu	"
global	vars90	" "
global	vars91	" "
global	vars92	"	V20302	V20303	V20650	V21481	V20657	V20995	V20693	V20436	V20429	V21355	V21420	V20653	V20651	V21505	V21504	"
global	vars93	"	V21602	V21603	V22405	V23322	V22412	V22801	V22448	V23324	V21739	V23212	V23276	V22408	V22406	V23334	V23333	"
global	vars94	"	ER2002	ER4157	ER2006	ER4153	ER2014	ER2562	ER2068	ER3479	ER3139	ER3883	ER3944	ER2009	ER2007	ER4159	ER4158	"
global	vars95	"	ER5002	ER6997	ER5005	ER6993	ER5013	ER5067	ER5561	ER6480	ER6139	ER6753	ER6814	ER5006	ER5008	ER6999	ER6998	"
global	vars96	"	ER7002	ER9248	ER7005	ER9244	ER7013	ER7657	ER7163	ER8597	ER8256	ER8999	ER9060	ER7008	ER7006	ER9250	ER9249	"
global	vars97	"	ER10002	ER10004	ER10008	ER12079	ER10016	ER10563	ER10081	ER11491	ER11150	ER11760	ER11848	ER10011	ER10009	ER12223	ER12222	"
global	vars99	" "
global	vars01	" "
global	vars03	" "
global	vars05	" "
global	vars07	" "

// Upload Raw Data

#delimit ;

// Upload Family 1992

clear ;
infix
	V20302          2 - 5
	V20303          6 - 7
	V20429        253 - 258
	V20436        282 - 287
	V20650        863 - 864
	V20651        865 - 866
	V20652        867 - 867
	V20653        868 - 869
	V20657        876 - 876
	V20693        917 - 917
	V20995       1398 - 1398
	V21355       1967 - 1967
	V21420       2066 - 2066
	V21481       2159 - 2165
	V21504       2239 - 2240
	V21505       2241 - 2242
using "$raw/FAM1992.txt", clear ;

label variable  V20302     "1992 INTERVIEW NUMBER" ;                           
label variable  V20303     "CURRENT STATE" ;
label variable  V20429     "HEAD 91 WAGES" ;    
label variable  V20436     "WIFE 91 LABOR/WAGE" ;  
label variable  V20650     "# IN FU" ;  
label variable  V20651     "AGE OF 1992 HEAD" ;                                
label variable  V20652     "SEX OF 1992 HEAD" ;                                
label variable  V20653     "AGE OF 1992 WIFE" ; 
label variable  V20657     "A3 MARITAL STATUS" ;  
label variable  V20995     "D1A EMPLOYMENT STATUS-WF" ;  
label variable  V20693     "B1 EMPLOYMENT STATUS-HD" ; 
label variable  V21355     "L19 RACE OF WIFE 1" ; 
label variable  V21420     "M32 RACE OF HEAD 1" ; 
label variable  V21481     "TOT FAM MONEY Y 91" ;
label variable  V21504     "COMPLETED ED-HD 92" ;                              
label variable  V21505     "COMPLETED ED-WF 92" ; 

rename ($vars92) ($varsall) ;
ren * *_92 ;
save "$pre\fam1992.dta", replace ;

// Upload Family 1993

clear ;
infix
	V21602          2 - 6
	V21603          7 - 8
	V21739        305 - 311
	V22405       1480 - 1481
	V22406       1482 - 1483
	V22407       1484 - 1484
	V22408       1485 - 1486
	V22412       1493 - 1493
	V22448       1534 - 1534
	V22801       2218 - 2218
	V23212       2991 - 2991
	V23276       3107 - 3107
	V23322       3203 - 3209
	V23323       3210 - 3216
	V23324       3217 - 3223
	V23333       3244 - 3245
	V23334       3246 - 3247
using "$raw/FAM1993.txt", clear ;

label variable  V21602     "1993 INTERVIEW NUMBER" ;
label variable  V21603     "CURRENT STATE" ;    
label variable  V22405     "NUMBER IN FAMILY UNIT" ;                           
label variable  V22406     "AGE OF 1993 HEAD" ;                                
label variable  V22407     "SEX OF 1993 HEAD" ;                                
label variable  V22408     "AGE OF 1993 WIFE" ;
label variable  V22412     "A3 MARITAL STATUS" ;
label variable  V22448     "B1 HEAD 1993 EMPLOYMENT STATUS" ;
label variable  V22801     "D1A WF 1993 EMPLOYMENT STATUS" ;
label variable  V23212     "K19 RACE OF WF-1ST MENTION" ;
label variable  V23276     "L32 RACE OF HD-1ST MENTION" ; 
label variable  V21739     "G13 HD 1992 WAGES" ; 
label variable  V23322     "TOTAL 1992 FAMILY MONEY INCOME" ; 
label variable  V23323     "HD 1992 TOTAL LABOR INCOME" ;                      
label variable  V23324     "WF 1992 TOTAL LABOR INCOME" ; 
label variable  V23333     "COMPLETED ED-HD 1993" ;                            
label variable  V23334     "COMPLETED ED-WF 1993" ;

rename ($vars93) ($varsall) ;
ren * *_93 ;
save "$pre\fam1993.dta", replace ;

// Upload Family 1994

clear ;
infix
	ER2002          2 - 6
	ER2006         37 - 38
	ER2007         39 - 40   
    ER2008         41 - 41
	ER2009         42 - 43
	ER2010         44 - 45
	ER2014         51 - 51
	ER2068        161 - 162
	ER2562       1123 - 1124
	ER3139       2313 - 2319
	ER3479       2838 - 2844
	ER3883       3535 - 3535
	ER3944       3645 - 3645
	ER4153       4276 - 4282
	ER4157       4295 - 4296
	ER4158       4305 - 4306
	ER4159       4307 - 4308
using "$raw/FAM1994ER.txt", clear ;

label variable  ER2002       "1994 INTERVIEW #" ; 
label variable  ER2006       "# IN FU" ;                                         
label variable  ER2007       "AGE OF HEAD" ;                                     
label variable  ER2008       "SEX OF HEAD" ;                                     
label variable  ER2009       "AGE OF WIFE" ;                                     
label variable  ER2010       "# CHILDREN IN FU" ;                                                                                          
label variable  ER2014       "HEAD MARITAL STATUS" ;
label variable  ER2068       "B1 EMPLOYMENT STATUS-HD" ; 
label variable  ER2562       "D1A EMPLOYMENT STATUS-WF" ;
label variable  ER3139       "WAGES/SALARY OF HEAD" ; 
label variable  ER3479       "WAGES/SALARY OF WIFE" ; 
label variable  ER3883       "K19 RACE OF WIFE      1" ; 
label variable  ER3944       "L32 RACE OF HEAD      1" ; 
label variable  ER4153       "TOTAL FAMILY INCOME-1993" ; 
label variable  ER4157       "CURRENT STATE" ; 
label variable  ER4158       "COMPLETED ED-HD" ;                                 
label variable  ER4159       "COMPLETED ED-WF" ; 

rename ($vars94) ($varsall) ;
ren * *_94 ;
save "$pre\fam1994.dta", replace ;

// Upload Family 1995

clear ;
infix
	ER5002          2 - 6
	ER5005         16 - 17
	ER5006         34 - 35
	ER5007         36 - 36
	ER5008         37 - 38
	ER5013         48 - 48
	ER5067        160 - 161
	ER5561       1196 - 1197
	ER6139       2446 - 2452
	ER6480       2972 - 2978
	ER6753       3372 - 3372
	ER6814       3482 - 3482
	ER6993       4028 - 4034
	ER6997       4047 - 4048
	ER6998       4057 - 4058
	ER6999       4059 - 4060	
using "$raw/FAM1995ER.txt", clear ;

label variable  ER5002       "1995 INTERVIEW #" ; 
label variable  ER5005       "# IN FU" ;
label variable  ER5006       "AGE OF HEAD" ;                                     
label variable  ER5007       "SEX OF HEAD" ;                                     
label variable  ER5008       "AGE OF WIFE" ; 
label variable  ER5013       "HEAD MARITAL STATUS" ; 
label variable  ER5067       "B1 EMPLOYMENT STATUS-HD" ;
label variable  ER5561       "D1A EMPLOYMENT STATUS-WF" ; 
label variable  ER6139       "WAGES/SALARY OF HEAD" ; 
label variable  ER6480       "WAGES/SALARY OF WIFE" ; 
label variable  ER6753       "K19 RACE OF WIFE      1" ; 
label variable  ER6814       "L32 RACE OF HEAD      1" ;
label variable  ER6993       "TOTAL FAMILY INCOME-1994" ;  
label variable  ER6997       "CURRENT STATE" ; 
label variable  ER6998       "COMPLETED ED-HD" ;                                 
label variable  ER6999       "COMPLETED ED-WF" ; 

rename ($vars95) ($varsall) ;
ren * *_95 ;
save "$pre\fam1995.dta", replace ;

// Upload Family 1996

clear ;
infix
	ER7002          2 - 5
	ER7005         15 - 16
	ER7006         33 - 34
	ER7007         35 - 35
	ER7008         36 - 37
	ER7009         38 - 39
	ER7013         45 - 45
	ER7163        271 - 271
	ER7657       1424 - 1424
	ER8256       2735 - 2741
	ER8597       3261 - 3267
	ER8999       3864 - 3864
	ER9060       3974 - 3974
	ER9244       4525 - 4531
	ER9248       4544 - 4545
	ER9249       4554 - 4555
	ER9250       4556 - 4557
using "$raw/FAM1996ER.txt" , clear ;

label variable  ER7002       "1996 INTERVIEW #" ;
label variable  ER7005       "# IN FU" ;
label variable  ER7006       "AGE OF HEAD" ;                                     
label variable  ER7007       "SEX OF HEAD" ;                                     
label variable  ER7008       "AGE OF WIFE" ;                                     
label variable  ER7009       "# CHILDREN IN FU" ;     
label variable  ER7013       "HEAD MARITAL STATUS" ;
label variable  ER7163       "B1 EMPLOYMENT STATUS-HD" ;
label variable  ER7657       "D1A EMPLOYMENT STATUS-WF" ;
label variable  ER8256       "G13 WAGES/SALARY OF HEAD" ;  
label variable  ER8597       "WAGES/SALARY OF WIFE" ;  
label variable  ER8999       "K19 RACE OF WIFE      1" ;
label variable  ER9060       "L32 RACE OF HEAD      1" ; 
label variable  ER9244       "TOTAL FAMILY INCOME-1995" ; 
label variable  ER9248       "CURRENT STATE" ;  
label variable  ER9249       "COMPLETED ED-HD" ;                                 
label variable  ER9250       "COMPLETED ED-WF" ;

rename ($vars96) ($varsall) ;
ren * *_96 ;
save "$pre\fam1996.dta", replace ;

// Upload Family 1997

clear ;
infix
	ER10002         2 - 6
	ER10004        11 - 12
	ER10008        39 - 40
	ER10009        41 - 43
	ER10011        45 - 47
	ER10010        44 - 44
	ER10016        55 - 55
	ER10081       188 - 189
	ER10563      1166 - 1167
    ER11150      2388 - 2394
    ER11491      2911 - 2917
	ER11760      3316 - 3316
	ER11848      3468 - 3468
	ER12079      3936 - 3944
	ER12222      4414 - 4415
	ER12223      4416 - 4417
using "$raw/FAM1997ER.txt" , clear ;

label variable  ER10002      "1997 INTERVIEW #" ;                                                                
label variable  ER10004      "CURRENT STATE" ;                                   
label variable  ER10008      "# IN FU" ;                                         
label variable  ER10009      "AGE OF HEAD" ;                                     
label variable  ER10010      "SEX OF HEAD" ;                                     
label variable  ER10011      "AGE OF WIFE" ;            
label variable  ER10016      "HEAD MARITAL STATUS" ;
label variable  ER10081      "B1 1ST MENTION" ;
label variable  ER10563      "D1A 1ST MENTION" ;  
label variable  ER11150      "G13 WAGES/SALARY OF HEAD" ;
label variable  ER11491      "WAGES/SALARY OF WIFE" ; 
label variable  ER11760      "K34/87 RACE OF WIFE 1" ;
label variable  ER11848      "L40/95 RACE OF HEAD 1" ;
label variable  ER12079      "TOTAL FAMILY INCOME" ;
label variable  ER12222      "COMPLETED ED-HD" ;                                 
label variable  ER12223      "COMPLETED ED-WF" ; 

rename ($vars97) ($varsall) ;
ren * *_97 ;
save "$pre\fam1997.dta", replace ;

#delimit cr
