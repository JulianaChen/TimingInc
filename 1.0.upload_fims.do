/*******************************************************************************
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 19, 2019
*	Last update: 	Jul 19, 2019
*	Written by:		Juliana Chen
********************************************************************************

** PURPOSE: 	Uploads Data from the FIMS to obtain biological parents IDs

** FLOW:		1. Insheet data from text files
				3. Label variables and generate ID vars
				4. Save processed file: ${pre}/FIMS.dta

** NOTES:		- Data Downloaded on May 24, 2019
				- File: fim9415_gid_BO_2_BAL_wide_cds.txt
				- Dictionary: fim9415_gid_BO_2_BAL_wide_cds.do
				- Link: https://simba.isr.umich.edu/FIMS/default.aspx
				
				- To download data, select the options:
				Parents: Biological only
				Generation map: Individuals to parents
				Map type: Balanced map
				File format: Wide – 1 obs. Per individual
				Merge with CDS Map --- Wide Format

*******************************************************************************/

// Upload Raw Data

#delimit ;

infix 
         ER30001               1 - 4    
         ER30002               5 - 7    
         CDS97                 8 - 8    
         CDS14                 9 - 9    
         PCGID_97             10 - 13   
         PCGPN_97             14 - 16   
         OCGID_97             17 - 20   
         OCGPN_97             21 - 23   
         PCGID_02             24 - 27   
         PCGPN_02             28 - 30   
         OCGID_02             31 - 34   
         OCGPN_02             35 - 37   
         PCGID_07             38 - 41   
         PCGPN_07             42 - 44   
         OCGID_07             45 - 48   
         OCGPN_07             49 - 51   
         PCGID_14             52 - 55   
         PCGPN_14             56 - 58   
         ER30001_P_F          59 - 62   
         ER30002_P_F          63 - 65   
         ER30001_P_M          66 - 69   
         ER30002_P_M          70 - 72   
using "${raw}/fim9415_gid_BO_2_BAL_wide_cds.txt", clear ;

label variable  ER30001              "CHILD: 1968 INTERVIEW NUMBER" ;
label variable  ER30002              "CHILD: PERSON NUMBER 68" ;
label variable  CDS97                "CHILD: 1997 COHORT" ;
label variable  CDS14                "CHILD: 2014 COHORT" ;
label variable  PCGID_97             "PCG 1997: 1968 INTERVIEW NUMBER" ;
label variable  PCGPN_97             "PCG 1997: PERSON NUMBER 68" ;
label variable  OCGID_97             "OCG 1997: 1968 INTERVIEW NUMBER" ;
label variable  OCGPN_97             "OCG 1997: PERSON NUMBER 68" ;
label variable  PCGID_02             "PCG 2002: 1968 INTERVIEW NUMBER" ;
label variable  PCGPN_02             "PCG 2002: PERSON NUMBER 68" ;
label variable  OCGID_02             "OCG 2002: 1968 INTERVIEW NUMBER" ;
label variable  OCGPN_02             "OCG 2002: PERSON NUMBER 68" ;
label variable  PCGID_07             "PCG 2007: 1968 INTERVIEW NUMBER" ;
label variable  PCGPN_07             "PCG 2007: PERSON NUMBER 68" ;
label variable  OCGID_07             "OCG 2007: 1968 INTERVIEW NUMBER" ;
label variable  OCGPN_07             "OCG 2007: PERSON NUMBER 68" ;
label variable  PCGID_14             "PCG 2014: 1968 INTERVIEW NUMBER" ;
label variable  PCGPN_14             "PCG 2014: PERSON NUMBER 68" ;
label variable  ER30001_P_F          "1968 INTERVIEW NUMBER /PARENT /FATHER" ;
label variable  ER30002_P_F          "PERSON NUMBER 68 /PARENT /FATHER" ;
label variable  ER30001_P_M          "1968 INTERVIEW NUMBER /PARENT /MOTHER" ;
label variable  ER30002_P_M          "PERSON NUMBER 68 /PARENT /MOTHER" ;

#delimit cr

// Generate IDs

gen ID = ER30001*1000 + ER30002
lab var ID "ER30001*1000 + ER30002"

gen fatherID = ER30001_P_F*1000 + ER30002_P_F
lab var fatherID "ER30001_P_F*1000 + ER30002_P_F"

gen motherID = ER30001_P_M*1000 + ER30002_P_M
lab var motherID "ER30001_P_M*1000 + ER30002_P_M"

// Save IDs

keep *ID
keep if !missing(motherID) & !missing(fatherID)
note:  data created/saved on TS
save "${pre}/FIMS.dta", replace
