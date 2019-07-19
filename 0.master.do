/*******************************************************************************	
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 15, 2019
*	Last update: 	Jul 17, 2019
*	Written by:		Juliana Chen 
********************************************************************************			

** PURPOSE: 	Runs all of the necessary files to replicate the analysis on...
						
** FLOW:		1. Import
				2. Clean
				5. Summary
				6. Analysis
	
** NOTES:		- Do-Files need to be run in order (based on their filename)
				- Data source: https://simba.isr.umich.edu/Zips/ZipMain.aspx
				- Documentation: https://psidonline.isr.umich.edu/Guide/documents.aspx
				
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
	run "${dos}/1.0.upload_codes.do"
	
	// Upload Fmily Links
	
	
	// Upload Family Files 1990 to 1999 (still needs up to 2007)
	run "${dos}/1.1.upload_f9097.do"
	
	// Upload Invididual Data 2017
	
*** 2. Merge PSID Data

*** 3. Create Variables

*** 4. Analysis: Step 1 (???)

*** 5. Output: Tables & Graphs (???)
