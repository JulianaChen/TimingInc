/*******************************************************************************	
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 16, 2019
*	Last update: 	Jul 16, 2019
*	Written by:		Juliana Chen 
********************************************************************************			

** PURPOSE: 	Uploads Data from the state codes for the PSID data  
						
** FLOW:		1. Upload state codes from text files (converted from PDFs)
				2. Clean and save as Stata data files
	
** NOTES:		- codes obtained from PSID's Documentation Page
				- State and Foreign Country Codes (downloaded as PDFs)
				
*******************************************************************************/

// Upload PSID State Codes (for 1990, 1991, 1992 and 1993)

/* Link: https://psidonline.isr.umich.edu/data/Documentation/PSIDStateCodes.pdf
Notes: it appears these codes only apply from 1990 to 1993 */

import delimited "${raw}/codes_PSID.txt", delimiter(space) clear
egen statename = concat(v2 v3 v4), punct(" ")
ren v1 state
drop v*
compress
save "${pre}/codes_PSID.dta", replace

// Upload FIPS State Codes (for 1994, 1995, 1996, 1997, 1998, and 1999) - CHECK!

/* Link: https://psidonline.isr.umich.edu/data/Documentation/FIPSStateCodes.pdf
Notes: it appears these codes only apply after 1994 */

import delimited "${raw}/codes_FIPS.txt", delimiter(space) clear
egen statename = concat(v2 v3 v4), punct(" ")
ren v1 state
drop v*
compress
save "${pre}/codes_FIPS.dta", replace
