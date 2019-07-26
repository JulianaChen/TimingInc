/*******************************************************************************	
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 15, 2019
*	Last update: 	Jul 25, 2019
*	Written by:		Juliana Chen 
********************************************************************************			

** PURPOSE: 	Runs all of the necessary files to replicate the analysis on...
						
** FLOW:		1. Import
				2. Clean
				5. Summary
				6. Analysis
	
** NOTES:		- Do-Files need to be run in order (based on their filename)
				
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
	global out "${Dir}/Pardee/Dissertation/Output/Paper 3"
	
*** 1. Upload PSID Data

	// Upload State Codes
	do "${dos}/1.0.upload_codes.do"
	
	// Upload Fmily Links
	do "${dos}/1.0.upload_fims.do"
	
	// Upload Family Files 1990 to 1997 (still needs up to 2007)
	do "${dos}/1.1.upload_f9097.do"
	
	// Upload Invididual Data 2017
	do "${dos}/1.2.upload_i2017.do"

*** 2. Merge PSID Data

*** 3. Create Variables

*** 4. Analysis: Step 1 (???)

*** 5. Output: Tables & Graphs (???)
