/*******************************************************************************	
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 16, 2019
*	Last update: 	Jul 19, 2019
*	Written by:		Juliana Chen 
********************************************************************************			

** PURPOSE: 	Uploads state codes for the PSID data  
						
** FLOW:		1. Upload state codes from text files (converted from PDFs)
				2. Clean and save as Stata data files
	
** NOTES:		- Data Downloaded on May 29, 2019 as PDFs
				- Codes obtained from PSID's Documentation Page
				- Link: https://psidonline.isr.umich.edu/Guide/documents.aspx
				
				- State codes change?******************************************* CHECK
				
*******************************************************************************/

// Upload PSID State Codes (for 1990, 1991, 1992 and 1993)
/* From: https://psidonline.isr.umich.edu/data/Documentation/PSIDStateCodes.pdf */

import delimited "${raw}/codes_PSID.txt", delimiter(space) clear
egen statename = concat(v2 v3 v4), punct(" ")
ren v1 state
drop v*
compress
save "${pre}/codes_PSID.dta", replace

// Upload FIPS State Codes (for 1994, 1995, 1996, 1997, 1998, and 1999) - CHECK!
/* From: https://psidonline.isr.umich.edu/data/Documentation/FIPSStateCodes.pdf */

import delimited "${raw}/codes_FIPS.txt", delimiter(space) clear
egen statename = concat(v2 v3 v4), punct(" ")
ren v1 state
drop v*
compress
save "${pre}/codes_FIPS.dta", replace
