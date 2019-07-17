/*******************************************************************************	
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 15, 2019
*	Last update: 	Jul 15, 2019
*	Written by:		Juliana Chen 
********************************************************************************			

** PURPOSE: 	Runs all of the necessary files to replicate the analysis on...
						
** FLOW:		1. Import
				2. Clean
				5. Summary
				6. Analysis
	
** NOTES:		
				
*******************************************************************************/

*** Set Up
	clear all
	version 16
	set more off
	cap log close
	cap program drop _all

*** Install Programs


*** Set Directories

if "`c(username)'" == "jchenper" {
	// Juliana Chen, RAND laptop
	global dir "/Users/jchenper/Documents"
	} 

	global dos "${dir}/GitHub/TimingInc"
	global raw "${dir}/Pardee/Dissertation/Data/Raw/PSID"
	global pre "${dir}/Pardee/Dissertation/Data/Processed/PSID"
	global out "${Dir}/Pardee/Dissertation/Output"
	
*** 1. Upload PSID Data

	// Upload State Codes
	run "${dos}/1.0.upload_codes.do"
	
	// Upload Family Files 1990 to 1999 (still needs )
	run "${dos}/1.1.upload_9097.do"
