/*******************************************************************************
*	Project: 		Replication - Timing of Parental Income
*	Created on:		Jul 17, 2019
*	Last update: 	Jul 25, 2019
*	Written by:		Juliana Chen
********************************************************************************

** PURPOSE: 	Uploads Data from the Cross-Year Individual File (2013 to 2017)
				and obtains outcome variables as well as individual covariates

** FLOW:		1. Insheet data from text file (downloaded from website)
				2. Label variables and rename them
				3. Save processed file "FILENAME"

** NOTES:		- Variable names and labels obtained from dictionary files
				- Link: https://simba.isr.umich.edu/Zips/ZipMain.aspx
				- File: IND2017ER.txt		(Dictionary: IND2017ER.do)
				- Data Downloaded on May 24, 2019

*******************************************************************************/

// Select Variables

/* Variables:	- Outcomes: education (years?), high school completion, college
				attendance, earnings, IQ (have?), teenage pregnancy, grades in HS (have?)
				- Covariates: gender and year of birth							
				- others: IDs (to match with family files)						*/

// Upload Cross-Year Individual Data

#delimit ;

infix
      ER30000        1 - 1          ER30001        2 - 5          ER30002        6 - 8   
	  ER31988     2044 - 2044       ER31989     2045 - 2045 	  ER31990     2046 - 2047
      ER31991     2048 - 2048       ER31992     2049 - 2050 	  ER31993     2051 - 2051       
	  ER31994     2052 - 2052       ER31995     2053 - 2053 	  ER31996     2054 - 2055
	  ER31997     2056 - 2056       ER32000     2057 - 2057 	  ER32001     2058 - 2058
	  ER32002     2059 - 2059       ER32003     2060 - 2061 	  ER32004     2062 - 2062
	  ER32005     2063 - 2063       ER32006     2064 - 2064 	  ER32007     2065 - 2068
	  ER32008     2069 - 2072       ER32009     2073 - 2076 	  ER32010     2077 - 2079
	  ER32011     2080 - 2083       ER32012     2084 - 2085 	  ER32013     2086 - 2087
	  ER32014     2088 - 2090       ER32015     2091 - 2091 	  ER32016     2092 - 2095
	  ER32017     2096 - 2098       ER32018     2099 - 2102 	  ER32019     2103 - 2104
	  ER32020     2105 - 2106       ER32021     2107 - 2110 	  ER32022     2111 - 2112
	  ER30642     1528 - 1532		ER30689     1647 - 1650		  ER30733     1764 - 1767
	  ER30806     1914 - 1918		ER33101     2196 - 2200		  ER33201     2295 - 2299
	  ER33301     2488 - 2491		ER33401     2572 - 2576		  ER33501     2657 - 2661
	  ER33601     2851 - 2854		ER33701     3033 - 3037		  ER33801     3188 - 3192
	  ER33901     3487 - 3491		ER34201     4224 - 4228       ER34202     4229 - 4230 
      ER34203     4231 - 4232       ER34204     4233 - 4235       ER34205     4236 - 4237 
      ER34206     4238 - 4241       ER34207     4242 - 4242       ER34208     4243 - 4243 
      ER34209     4244 - 4245       ER34210     4246 - 4249       ER34211     4250 - 4250 
      ER34212     4251 - 4252       ER34213     4253 - 4254       ER34214     4255 - 4256 
      ER34215     4257 - 4257       ER34216     4258 - 4258       ER34217     4259 - 4260 
      ER34218     4261 - 4264       ER34219     4265 - 4266       ER34220     4267 - 4267 
      ER34221     4268 - 4269       ER34222     4270 - 4271       ER34223     4272 - 4275 
      ER34224     4276 - 4278       ER34225     4279 - 4280       ER34226     4281 - 4284 
      ER34227     4285 - 4287       ER34228     4288 - 4288       ER34229     4289 - 4290 
      ER34230     4291 - 4292       ER34231     4293 - 4293       ER34232     4294 - 4294 
      ER34233     4295 - 4296       ER34234     4297 - 4298       ER34235     4299 - 4299 
      ER34236     4300 - 4301       ER34237     4302 - 4303       ER34238     4304 - 4305 
      ER34239     4306 - 4307       ER34240     4308 - 4309       ER34241     4310 - 4311 
      ER34242     4312 - 4313       ER34243     4314 - 4314       ER34243A    4315 - 4315 
 long ER34243B    4316 - 4321       ER34243C    4322 - 4322       ER34243D    4323 - 4328 
      ER34243E    4329 - 4329       ER34243F    4330 - 4335       ER34243G    4336 - 4336 
      ER34243H    4337 - 4342       ER34243I    4343 - 4343  long ER34243J    4344 - 4349 
      ER34243K    4350 - 4350  long ER34243L    4351 - 4356       ER34243M    4357 - 4357 
      ER34243N    4358 - 4363       ER34243O    4364 - 4364       ER34243P    4365 - 4370 
      ER34243Q    4371 - 4371       ER34243R    4372 - 4377       ER34243S    4378 - 4378 
      ER34243T    4379 - 4384       ER34243U    4385 - 4385       ER34243V    4386 - 4391 
      ER34243W    4392 - 4392  long ER34243X    4393 - 4399  long ER34243Y    4400 - 4406 
      ER34244     4407 - 4407       ER34245     4408 - 4408       ER34246     4409 - 4409 
      ER34247     4410 - 4410       ER34248     4411 - 4411       ER34249     4412 - 4412 
 long ER34250     4413 - 4417       ER34251     4418 - 4418  long ER34251A    4419 - 4425 
      ER34251B    4426 - 4426  long ER34251C    4427 - 4432  long ER34251D    4433 - 4439 
 long ER34251E    4440 - 4445       ER34252     4446 - 4447       ER34253     4448 - 4451 
 long ER34254     4452 - 4456       ER34255     4457 - 4457       ER34256     4458 - 4459 
      ER34257     4460 - 4460       ER34258     4461 - 4462       ER34259     4463 - 4463 
      ER34260     4464 - 4464       ER34261     4465 - 4466       ER34261A    4467 - 4467 
      ER34262     4468 - 4468       ER34263     4469 - 4470       ER34264     4471 - 4471 
      ER34265     4472 - 4473       ER34266     4474 - 4475       ER34267     4476 - 4477 
      ER34268     4478 - 4484  long ER34269     4485 - 4489       ER34301     4490 - 4494 
      ER34302     4495 - 4496       ER34303     4497 - 4498       ER34304     4499 - 4499 
      ER34305     4500 - 4502       ER34306     4503 - 4504       ER34307     4505 - 4508 
      ER34308     4509 - 4509       ER34309     4510 - 4510       ER34310     4511 - 4512 
      ER34311     4513 - 4516       ER34312     4517 - 4517       ER34313     4518 - 4519 
      ER34314     4520 - 4521       ER34315     4522 - 4523       ER34316     4524 - 4524 
      ER34317     4525 - 4525       ER34318     4526 - 4529       ER34319     4530 - 4530 
      ER34320     4531 - 4531       ER34321     4532 - 4533       ER34322     4534 - 4537 
      ER34323     4538 - 4539       ER34324     4540 - 4541       ER34325     4542 - 4545 
      ER34326     4546 - 4547       ER34327     4548 - 4551       ER34328     4552 - 4553 
      ER34329     4554 - 4555       ER34330     4556 - 4559       ER34331     4560 - 4560 
      ER34332     4561 - 4562       ER34333     4563 - 4566       ER34334     4567 - 4567 
      ER34335     4568 - 4568       ER34336     4569 - 4570       ER34337     4571 - 4573 
      ER34338     4574 - 4576       ER34339     4577 - 4578       ER34340     4579 - 4582 
      ER34341     4583 - 4585       ER34342     4586 - 4588       ER34343     4589 - 4590 
      ER34344     4591 - 4594       ER34345     4595 - 4596       ER34346     4597 - 4597 
      ER34347     4598 - 4598       ER34348     4599 - 4600       ER34349     4601 - 4602 
      ER34350     4603 - 4603       ER34351     4604 - 4604       ER34352     4605 - 4605 
      ER34353     4606 - 4607       ER34354     4608 - 4611       ER34355     4612 - 4613 
      ER34356     4614 - 4615       ER34357     4616 - 4619       ER34358     4620 - 4621 
      ER34359     4622 - 4625       ER34360     4626 - 4627       ER34361     4628 - 4629 
      ER34362     4630 - 4633       ER34363     4634 - 4634       ER34364     4635 - 4636 
      ER34365     4637 - 4640       ER34366     4641 - 4641       ER34367     4642 - 4642 
      ER34368     4643 - 4644       ER34369     4645 - 4647       ER34370     4648 - 4650 
      ER34371     4651 - 4652       ER34372     4653 - 4656       ER34373     4657 - 4659 
      ER34374     4660 - 4662       ER34375     4663 - 4664       ER34376     4665 - 4668 
      ER34377     4669 - 4670       ER34378     4671 - 4671       ER34379     4672 - 4672 
      ER34380     4673 - 4674       ER34381     4675 - 4675       ER34382     4676 - 4676 
      ER34383     4677 - 4678       ER34384     4679 - 4680       ER34385     4681 - 4681 
      ER34386     4682 - 4683       ER34387     4684 - 4685       ER34388     4686 - 4687 
      ER34389     4688 - 4689       ER34390     4690 - 4691       ER34391     4692 - 4693 
      ER34392     4694 - 4695       ER34393     4696 - 4696       ER34393A    4697 - 4697 
      ER34393B    4698 - 4703       ER34393C    4704 - 4704       ER34393D    4705 - 4710 
      ER34393E    4711 - 4711       ER34393F    4712 - 4717       ER34393G    4718 - 4718 
      ER34393H    4719 - 4724       ER34393I    4725 - 4725  long ER34393J    4726 - 4731 
      ER34393K    4732 - 4732  long ER34393L    4733 - 4738       ER34393M    4739 - 4739 
      ER34393N    4740 - 4745       ER34393O    4746 - 4746       ER34393P    4747 - 4752 
      ER34393Q    4753 - 4753       ER34393R    4754 - 4759       ER34393S    4760 - 4760 
      ER34393T    4761 - 4766       ER34393U    4767 - 4767       ER34393V    4768 - 4773 
      ER34393W    4774 - 4774  long ER34393X    4775 - 4781  long ER34393Y    4782 - 4788 
      ER34394     4789 - 4789       ER34395     4790 - 4790       ER34396     4791 - 4791 
      ER34397     4792 - 4792       ER34398     4793 - 4793       ER34399     4794 - 4794 
 long ER34400     4795 - 4799       ER34401     4800 - 4800  long ER34401A    4801 - 4807 
      ER34401B    4808 - 4808  long ER34401C    4809 - 4814  long ER34401D    4815 - 4821 
 long ER34401E    4822 - 4827       ER34402     4828 - 4829       ER34403     4830 - 4833 
 long ER34404     4834 - 4838       ER34405     4839 - 4839       ER34406     4840 - 4841 
      ER34407     4842 - 4842       ER34408     4843 - 4844       ER34409     4845 - 4845 
      ER34410     4846 - 4847       ER34411     4848 - 4849       ER34412     4850 - 4851 
      ER34413     4852 - 4858  long ER34414     4859 - 4863       ER34501     4864 - 4868 
      ER34502     4869 - 4870       ER34503     4871 - 4872       ER34504     4873 - 4875 
      ER34505     4876 - 4877       ER34506     4878 - 4881       ER34507     4882 - 4882 
      ER34508     4883 - 4883       ER34509     4884 - 4885       ER34510     4886 - 4889 
      ER34511     4890 - 4890       ER34512     4891 - 4892       ER34513     4893 - 4894 
      ER34514     4895 - 4896       ER34515     4897 - 4897       ER34516     4898 - 4898 
      ER34517     4899 - 4902       ER34518     4903 - 4903       ER34519     4904 - 4904 
      ER34520     4905 - 4906       ER34521     4907 - 4910       ER34522     4911 - 4912 
      ER34523     4913 - 4914       ER34524     4915 - 4918       ER34525     4919 - 4920 
      ER34526     4921 - 4924       ER34527     4925 - 4926       ER34528     4927 - 4928 
      ER34529     4929 - 4932       ER34530     4933 - 4933       ER34531     4934 - 4935 
      ER34532     4936 - 4939       ER34533     4940 - 4940       ER34534     4941 - 4941 
      ER34535     4942 - 4943       ER34536     4944 - 4946       ER34537     4947 - 4949 
      ER34538     4950 - 4951       ER34539     4952 - 4955       ER34540     4956 - 4958 
      ER34541     4959 - 4961       ER34542     4962 - 4963       ER34543     4964 - 4967 
      ER34544     4968 - 4969       ER34545     4970 - 4970       ER34546     4971 - 4971 
      ER34547     4972 - 4973       ER34548     4974 - 4975       ER34549     4976 - 4976 
      ER34550     4977 - 4977       ER34551     4978 - 4978       ER34552     4979 - 4980 
      ER34553     4981 - 4984       ER34554     4985 - 4986       ER34555     4987 - 4988 
      ER34556     4989 - 4992       ER34557     4993 - 4994       ER34558     4995 - 4998 
      ER34559     4999 - 5000       ER34560     5001 - 5002       ER34561     5003 - 5006 
      ER34562     5007 - 5007       ER34563     5008 - 5009       ER34564     5010 - 5013 
      ER34565     5014 - 5014       ER34566     5015 - 5015       ER34567     5016 - 5017 
      ER34568     5018 - 5020       ER34569     5021 - 5023       ER34570     5024 - 5025 
      ER34571     5026 - 5029       ER34572     5030 - 5032       ER34573     5033 - 5035 
      ER34574     5036 - 5037       ER34575     5038 - 5041       ER34576     5042 - 5043 
      ER34577     5044 - 5044       ER34578     5045 - 5045       ER34579     5046 - 5047 
      ER34580     5048 - 5048       ER34581     5049 - 5049       ER34582     5050 - 5050 
      ER34583     5051 - 5051       ER34584     5052 - 5052       ER34585     5053 - 5053 
      ER34586     5054 - 5054       ER34587     5055 - 5055       ER34588     5056 - 5056 
      ER34589     5057 - 5057       ER34590     5058 - 5058       ER34591     5059 - 5059 
      ER34592     5060 - 5061       ER34593     5062 - 5063       ER34594     5064 - 5064 
      ER34595     5065 - 5066       ER34596     5067 - 5068       ER34597     5069 - 5070 
      ER34598     5071 - 5072       ER34599     5073 - 5074       ER34600     5075 - 5076 
      ER34601     5077 - 5078       ER34602     5079 - 5079       ER34603     5080 - 5080 
      ER34604     5081 - 5081       ER34605     5082 - 5082       ER34606     5083 - 5083 
      ER34607     5084 - 5084       ER34608     5085 - 5085  long ER34609     5086 - 5090 
      ER34610     5091 - 5091       ER34611     5092 - 5092       ER34612     5093 - 5098 
      ER34613     5099 - 5099       ER34614     5100 - 5105       ER34615     5106 - 5106 
      ER34616     5107 - 5112       ER34617     5113 - 5113       ER34618     5114 - 5119 
      ER34619     5120 - 5120  long ER34620     5121 - 5126       ER34621     5127 - 5127 
 long ER34622     5128 - 5133       ER34623     5134 - 5134       ER34624     5135 - 5140 
      ER34625     5141 - 5141  long ER34626     5142 - 5147       ER34627     5148 - 5148 
      ER34628     5149 - 5154       ER34629     5155 - 5155       ER34630     5156 - 5161 
      ER34631     5162 - 5162  long ER34632     5163 - 5168       ER34633     5169 - 5169 
 long ER34634     5170 - 5176  long ER34635     5177 - 5183  long ER34636     5184 - 5190 
      ER34637     5191 - 5191  long ER34638     5192 - 5197  long ER34639     5198 - 5204 
 long ER34640     5205 - 5210       ER34641     5211 - 5212       ER34642     5213 - 5216 
 long ER34643     5217 - 5221       ER34644     5222 - 5222       ER34645     5223 - 5224 
      ER34646     5225 - 5225       ER34647     5226 - 5227       ER34648     5228 - 5229 
      ER34649     5230 - 5231       ER34650     5232 - 5238  long ER34651     5239 - 5243 
using "${raw}/IND2017ER.txt", clear;

label variable  ER30000      "RELEASE NUMBER" ;                                  
label variable  ER30001      "1968 INTERVIEW NUMBER" ;                           
label variable  ER30002      "PERSON NUMBER 68" ;
label variable  ER31988      "ETHNICITY ELIGIBILITY FOR LNPS" ;                  
label variable  ER31989      "ETHNICITY OF LNPS SAMPLING AREA" ;                 
label variable  ER31990      "MEXICAN LATINO STRATUM" ;                          
label variable  ER31991      "MEXICAN LATINO SECU" ;                             
label variable  ER31992      "PUERTO RICAN LATINO STRATUM" ;                     
label variable  ER31993      "PUERTO RICAN LATINO SECU" ;                        
label variable  ER31994      "CUBAN LATINO STRATUM" ;                            
label variable  ER31995      "CUBAN LATINO SECU" ;                               
label variable  ER31996      "SAMPLING ERROR STRATUM" ;                          
label variable  ER31997      "SAMPLING ERROR CLUSTER" ;                          
label variable  ER32000      "SEX OF INDIVIDUAL" ;                               
label variable  ER32001      "WTR ALWAYS IN RESPONDING FAMILY UNIT" ;            
label variable  ER32002      "WTR EVER CODED INSTITUTIONAL" ;                    
label variable  ER32003      "WTR ORIGINAL SAMPLE/BORN IN/MOVED IN" ;            
label variable  ER32004      "WTR EVER MOVED OUT OF FU OR DIED" ;                
label variable  ER32005      "WTR EVER OUT OF STUDY 1 YEAR OR MORE" ;            
label variable  ER32006      "WHETHER SAMPLE OR NONSAMPLE" ;                     
label variable  ER32007      "YEAR OF MOST RECENT NONRESPONSE" ;                 
label variable  ER32008      "YEAR FIRST BECAME NONRESPONSE" ;                   
label variable  ER32009      "1968 ID OF MOTHER" ;                               
label variable  ER32010      "PERSON # OF MOTHER" ;                              
label variable  ER32011      "YEAR MOTHER BORN" ;                                
label variable  ER32012      "TOTAL # CHILDREN BORN TO MOTHER" ;                 
label variable  ER32013      "ORDER OF BIRTH TO MOTHER" ;                        
label variable  ER32014      "BIRTH WEIGHT OF THIS INDIVIDUAL" ;                 
label variable  ER32015      "MARITAL STATUS OF MOTHER AT BIRTH" ;               
label variable  ER32016      "1968 ID OF FATHER" ;                               
label variable  ER32017      "PERSON # OF FATHER" ;                              
label variable  ER32018      "YEAR FATHER BORN" ;                                
label variable  ER32019      "TOTAL # CHILDREN BORN TO FATHER" ;                 
label variable  ER32020      "ORDER OF BIRTH TO FATHER" ;                        
label variable  ER32021      "YEAR BIRTH INFO MOST RECENTLY UPDATED" ;           
label variable  ER32022      "# LIVE BIRTHS TO THIS INDIVIDUAL" ;  
label variable  ER30642      "1990 INTERVIEW NUMBER" ;
label variable  ER30689      "1991 INTERVIEW NUMBER" ;
label variable  ER30733      "1992 INTERVIEW NUMBER" ;
label variable  ER30806      "1993 INTERVIEW NUMBER" ;
label variable  ER33101      "1994 INTERVIEW NUMBER" ;
label variable  ER33201      "1995 INTERVIEW NUMBER" ;
label variable  ER33301      "1996 INTERVIEW NUMBER" ;
label variable  ER33401      "1997 INTERVIEW NUMBER" ;
label variable  ER33501      "1999 INTERVIEW NUMBER" ;
label variable  ER33601      "2001 INTERVIEW NUMBER" ;
label variable  ER33701      "2003 INTERVIEW NUMBER" ;
label variable  ER33801      "2005 INTERVIEW NUMBER" ;
label variable  ER33901      "2007 INTERVIEW NUMBER" ;
label variable  ER34201      "2013 INTERVIEW NUMBER" ;                           
label variable  ER34202      "SEQUENCE NUMBER                       13" ;        
label variable  ER34203      "RELATION TO HEAD                      13" ;        
label variable  ER34204      "AGE OF INDIVIDUAL                     13" ;        
label variable  ER34205      "MONTH INDIVIDUAL BORN                 13" ;        
label variable  ER34206      "YEAR INDIVIDUAL BORN                  13" ;        
label variable  ER34207      "MARITAL PAIRS INDICATOR               13" ;        
label variable  ER34208      "WHETHER MOVED IN/OUT                  13" ;        
label variable  ER34209      "MONTH MOVED IN/OUT                    13" ;        
label variable  ER34210      "YEAR MOVED IN/OUT                     13" ;        
label variable  ER34211      "RESPONDENT?                           13" ;        
label variable  ER34212      "SN 1ST PERSON WHO HELPED WITH IW      13" ;        
label variable  ER34213      "SN 2ND PERSON WHO HELPED WITH IW      13" ;        
label variable  ER34214      "SN 3RD PERSON WHO HELPED WITH IW      13" ;        
label variable  ER34215      "WTR COVERED BY TANF PAYMENTS IN 2012  13" ;        
label variable  ER34216      "EMPLOYMENT STATUS                     13" ;        
label variable  ER34217      "MONTH LAST IN SCHOOL                  13" ;        
label variable  ER34218      "YEAR LAST IN SCHOOL                   13" ;        
label variable  ER34219      "HIGHEST GRADE OF SCHOOL COMPLETED     13" ;        
label variable  ER34220      "WTR REC HS DIPLOMA/GED/NEITHER        13" ;        
label variable  ER34221      "TYPE OF HIGHEST DEGREE                13" ;        
label variable  ER34222      "MONTH GRADUATED BACHELOR DEGREE       13" ;        
label variable  ER34223      "YEAR GRADUATED BACHELOR DEGREE        13" ;        
label variable  ER34224      "BACHELOR DEGREE MAJOR                 13" ;        
label variable  ER34225      "MONTH GRADUATED HIGHEST DEGREE        13" ;        
label variable  ER34226      "YEAR GRADUATED HIGHEST DEGREE         13" ;        
label variable  ER34227      "HIGHEST DEGREE MAJOR                  13" ;        
label variable  ER34228      "WTR CURRENTLY ENROLLED IN SCHOOL      13" ;        
label variable  ER34229      "GRADE CURRENTLY ENROLLED              13" ;        
label variable  ER34230      "YEARS COMPLETED EDUCATION             13" ;        
label variable  ER34231      "HEALTH GOOD?                          13" ;        
label variable  ER34232      "H61E2 WTR STATE INSURNCE PLN FOR KIDS 13" ;        
label variable  ER34233      "H61M MONTHS UNINSURED IN 11           13" ;        
label variable  ER34234      "H61N MONTHS UNINSURED IN 12           13" ;        
label variable  ER34235      "H61D3 WTR COVERED BY INSURANCE NOW    13" ;        
label variable  ER34236      "H61E TYPE CURRENT HEALTH INS MEN 1    13" ;        
label variable  ER34237      "H61E TYPE CURRENT HEALTH INS MEN 2    13" ;        
label variable  ER34238      "H61E TYPE CURRENT HEALTH INS MEN 3    13" ;        
label variable  ER34239      "H61F SN 1ST PERSON EMP PROVIDES INS   13" ;        
label variable  ER34240      "H61F SN 2ND PERSON EMP PROVIDES INS   13" ;        
label variable  ER34241      "H61G SN 1ST PERSON POLICY HOLDER      13" ;        
label variable  ER34242      "H61G SN 2ND PERSON POLICY HOLDER      13" ;        
label variable  ER34243      "WHETHER MEDICARE NUMBER GIVEN         13" ;        
label variable  ER34243A     "G76 NUMBER OF JOBS IN PY              13" ;        
label variable  ER34243B     "G84A_G94B IMPUTED INTEREST            13" ;        
label variable  ER34243C     "ACC G84A_G94B IMPUTED - INTEREST      13" ;        
label variable  ER34243D     "G84B IMPUTED TANF                     13" ;        
label variable  ER34243E     "ACC G84B IMPUTED -TANF                13" ;         
label variable  ER34243F     "G84C_G94C IMPUTED SSI                 13" ;        
label variable  ER34243G     "ACC G84C_G94C IMPUTED - SSI           13" ;        
label variable  ER34243H     "G84D_G94D IMPUTED WELFARE             13" ;        
label variable  ER34243I     "ACC G84D_G94D IMPUTED - WELFARE       13" ;        
label variable  ER34243J     "G84F IMPUTED VETERANS BEN             13" ;        
label variable  ER34243K     "ACC G84F IMPUTED - VETERANS BEN       13" ;        
label variable  ER34243L     "G84G IMPUTED PENSION/ANN              13" ;        
label variable  ER34243M     "ACC G84G IMPUTED - PENSION/ANN        13" ;        
label variable  ER34243N     "G84H IMPUTED UNEMP COMP               13" ;        
label variable  ER34243O     "ACC G84H IMPUTED - UNEMP COMP         13" ;        
label variable  ER34243P     "G84J IMPUTED WORKERS COMP             13" ;        
label variable  ER34243Q     "ACC G84J IMPUTED - WORKERS COMP       13" ;        
label variable  ER34243R     "G84K IMPUTED CHILD SUPPORT            13" ;        
label variable  ER34243S     "ACC G84K IMPUTED - CHILD SUPPORT      13" ;        
label variable  ER34243T     "G84L IMPUTED HELP FROM RELS           13" ;        
label variable  ER34243U     "ACC G84L IMPUTED - HELP FROM RELS     13" ;        
label variable  ER34243V     "G84M_G94F IMPUTED OTHER INCOME        13" ;        
label variable  ER34243W     "ACC G84M_G94F IMPUTED - OTHER INCOME  13" ;        
label variable  ER34243X     "OFUM BUSINESS LABOR INCOME - IMPUTED  13" ;        
label variable  ER34243Y     "OFUM BUSINESS ASSET INCOME - IMPUTED  13" ;        
label variable  ER34244      "G33A WTR SOC SEC TYPE DISABILITY      13" ;        
label variable  ER34245      "G33A WTR SOC SEC TYPE RETIREMENT      13" ;        
label variable  ER34246      "G33A WTR SOC SEC TYPE SURVIVOR        13" ;        
label variable  ER34247      "G33A WTR SOC SEC TYPE DEP OF DISABLED 13" ;        
label variable  ER34248      "G33A WTR SOC SEC TYPE DEP OF RETIRED  13" ;        
label variable  ER34249      "G33A WTR SOC SEC TYPE OTHER           13" ;        
label variable  ER34250      "G34 AMT SOC SEC RCD                   13" ;        
label variable  ER34251      "G34 ACC SOC SEC AMT                   13" ;        
label variable  ER34251A     "OFUM TOTAL LABOR INCOME- IMPUTED      13" ;        
label variable  ER34251B     "ACCURACY OFUM TOTAL LABOR INCOME      13" ;        
label variable  ER34251C     "OFUM TOTAL ASSET INCOME - IMPUTED     13" ;        
label variable  ER34251D     "OFUM TOTAL TAXABLE INCOME - IMPUTED   13" ;        
label variable  ER34251E     "OFUM TOTAL TRANSFER INCOME -IMPUTED   13" ;        
label variable  ER34252      "MONTH S/O FAM FORMED                  13" ;        
label variable  ER34253      "YEAR S/O FAM FORMED                   13" ;        
label variable  ER34254      "MAIN FAM ID FOR S/O                   13" ;        
label variable  ER34255      "FOLLOW STATUS                         13" ;        
label variable  ER34256      "WHY FOLLOWABLE                        13" ;        
label variable  ER34257      "WTR ELIGIBLE FOR TA                   13" ;        
label variable  ER34258      "RESULT OF TA IW ATTEMPT               13" ;        
label variable  ER34259      "WTR ELIGIBLE FOR CDS 2014             13" ;        
label variable  ER34260      "SELECTION STATUS FOR CDS 2014         13" ;        
label variable  ER34261      "RESULT OF CDS 2014 IW ATTEMPT         13" ;        
label variable  ER34261A     "WTR CDS 2014 IW CODED COMPLETE        13" ;        
label variable  ER34262      "WTR ELIGIBLE FOR DUST 2013            13" ;        
label variable  ER34263      "RESULT OF DUST 2013 IW ATTEMPT        13" ;        
label variable  ER34264      "WTR ELIG FOR CRCS 2014                13" ;         
label variable  ER34265      "RESULT OF CRCS IW ATTEMPT 14          13" ;          
label variable  ER34266      "TYPE OF IND RECORD                    13" ;        
label variable  ER34267      "WHY NONRESPONSE                       13" ;        
label variable  ER34268      "CORE/IMM INDIVIDUAL LONGITUDINAL WT   13" ;        
label variable  ER34269      "CORE/IMM INDIVIDUAL CROSS-SECTION WT  13" ;        
label variable  ER34301      "2015 INTERVIEW NUMBER" ;                           
label variable  ER34302      "SEQUENCE NUMBER                       15" ;        
label variable  ER34303      "RELATION TO HEAD                      15" ;        
label variable  ER34304      "WTR SAME SEX PARTNER OF HD            15" ;        
label variable  ER34305      "AGE OF INDIVIDUAL                     15" ;        
label variable  ER34306      "MONTH INDIVIDUAL BORN                 15" ;        
label variable  ER34307      "YEAR INDIVIDUAL BORN                  15" ;        
label variable  ER34308      "MARITAL PAIRS INDICATOR               15" ;        
label variable  ER34309      "WHETHER MOVED IN/OUT                  15" ;        
label variable  ER34310      "MONTH MOVED IN/OUT                    15" ;        
label variable  ER34311      "YEAR MOVED IN/OUT                     15" ;        
label variable  ER34312      "RESPONDENT?                           15" ;        
label variable  ER34313      "SN 1ST PERSON WHO HELPED WITH IW      15" ;        
label variable  ER34314      "SN 2ND PERSON WHO HELPED WITH IW      15" ;        
label variable  ER34315      "SN 3RD PERSON WHO HELPED WITH IW      15" ;        
label variable  ER34316      "WTR COVERED BY TANF PAYMENTS IN 2014  15" ;        
label variable  ER34317      "EMPLOYMENT STATUS                     15" ;        
label variable  ER34318      "YEAR HIGHEST EDUCATION UPDATED        15" ;        
label variable  ER34319      "WHETHER EDUCATED IN US                15" ;        
label variable  ER34320      "WTR REC HS DIPLOMA/GED/NEITHER        15" ;        
label variable  ER34321      "MONTH GRADUATED HIGH SCHOOL           15" ;        
label variable  ER34322      "YEAR GRADUATED HIGH SCHOOL            15" ;        
label variable  ER34323      "GRADE LEVEL IF GED                    15" ;        
label variable  ER34324      "MONTH LAST IN SCHOOL IF GED           15" ;        
label variable  ER34325      "YEAR LAST IN SCHOOL IF GED            15" ;        
label variable  ER34326      "MONTH RECEIVED GED                    15" ;        
label variable  ER34327      "YEAR RECEIVED GED                     15" ;        
label variable  ER34328      "GRADE OF SCHOOL FINISHED IF NEITHER   15" ;        
label variable  ER34329      "MONTH LAST IN SCHOOL IF NEITHER       15" ;        
label variable  ER34330      "YEAR LAST IN SCHOOL IF NEITHER        15" ;        
label variable  ER34331      "WTR ATTENDED COLLEGE                  15" ;        
label variable  ER34332      "MONTH LAST ATTENDED COLLEGE           15" ;        
label variable  ER34333      "YEAR LAST ATTENDED COLLEGE            15" ;        
label variable  ER34334      "HIGHEST YEAR COLLEGE COMPLETED        15" ;        
label variable  ER34335      "WTR RECEIVED COLLEGE DEGREE           15" ;        
label variable  ER34336      "TYPE OF HIGHEST DEGREE                15" ;        
label variable  ER34337      "BACHELOR DEGREE MAJOR MEN1            15" ;        
label variable  ER34338      "BACHELOR DEGREE MAJOR MEN2            15" ;        
label variable  ER34339      "MONTH GRADUATED BACHELOR DEGREE       15" ;        
label variable  ER34340      "YEAR GRADUATED BACHELOR DEGREE        15" ;        
label variable  ER34341      "HIGHEST DEGREE MAJOR MEN1             15" ;        
label variable  ER34342      "HIGHEST DEGREE MAJOR MEN2             15" ;        
label variable  ER34343      "MONTH GRADUATED HIGHEST DEGREE        15" ;        
label variable  ER34344      "YEAR GRADUATED HIGHEST DEGREE         15" ;        
label variable  ER34345      "YEARS OF FOREIGN EDUCATION            15" ;        
label variable  ER34346      "FOREIGN DEGREE                        15" ;        
label variable  ER34347      "WTR CURRENTLY ENROLLED IN SCHOOL      15" ;        
label variable  ER34348      "GRADE CURRENTLY ENROLLED              15" ;        
label variable  ER34349      "YEARS COMPLETED EDUCATION             15" ;        
label variable  ER34350      "UP: WTR ATTENDED SCHOOL SINCE LAST IW 15" ;        
label variable  ER34351      "UP: WHETHER EDUCATED IN US            15" ;        
label variable  ER34352      "UP: WTR REC HS DIPLOMA/GED/NEITHER    15" ;        
label variable  ER34353      "UP: MONTH GRADUATED HIGH SCHOOL       15" ;        
label variable  ER34354      "UP: YEAR GRADUATED HIGH SCHOOL        15" ;        
label variable  ER34355      "UP: GRADE LEVEL IF GED                15" ;        
label variable  ER34356      "UP: MONTH LAST IN SCHOOL IF GED       15" ;        
label variable  ER34357      "UP: YEAR LAST IN SCHOOL IF GED        15" ;        
label variable  ER34358      "UP: MONTH RECEIVED GED                15" ;        
label variable  ER34359      "UP: YEAR RECEIVED GED                 15" ;        
label variable  ER34360      "UP: GRADE SCHOOL FINISHED IF NEITHER  15" ;        
label variable  ER34361      "UP: MONTH LAST IN SCHOOL IF NEITHER   15" ;        
label variable  ER34362      "UP: YEAR LAST IN SCHOOL IF NEITHER    15" ;        
label variable  ER34363      "UP: WTR ATTENDED COLLEGE              15" ;        
label variable  ER34364      "UP: MONTH LAST ATTENDED COLLEGE       15" ;        
label variable  ER34365      "UP: YEAR LAST ATTENDED COLLEGE        15" ;        
label variable  ER34366      "UP: HIGHEST YEAR COLLEGE COMPLETED    15" ;        
label variable  ER34367      "UP: WTR RECEIVED COLLEGE DEGREE       15" ;        
label variable  ER34368      "UP: TYPE OF HIGHEST DEGREE            15" ;        
label variable  ER34369      "UP: BACHELOR DEGREE MAJOR MEN1        15" ;        
label variable  ER34370      "UP: BACHELOR DEGREE MAJOR MEN2        15" ;        
label variable  ER34371      "UP: MONTH GRADUATED BACHELOR DEGREE   15" ;        
label variable  ER34372      "UP: YEAR GRADUATED BACHELOR DEGREE    15" ;        
label variable  ER34373      "UP: HIGHEST DEGREE MAJOR MEN1         15" ;        
label variable  ER34374      "UP: HIGHEST DEGREE MAJOR MEN2         15" ;        
label variable  ER34375      "UP: MONTH GRADUATED HIGHEST DEGREE    15" ;        
label variable  ER34376      "UP: YEAR GRADUATED HIGHEST DEGREE     15" ;        
label variable  ER34377      "UP: YEARS OF FOREIGN EDUCATION        15" ;        
label variable  ER34378      "UP: FOREIGN DEGREE                    15" ;        
label variable  ER34379      "UP: WTR CURRENTLY ENROLLED IN SCHOOL  15" ;        
label variable  ER34380      "UP: GRADE CURRENTLY ENROLLED          15" ;        
label variable  ER34381      "HEALTH GOOD?                          15" ;        
label variable  ER34382      "H61E2 WTR STATE INSURNCE PLN FOR KIDS 15" ;        
label variable  ER34383      "H61M MONTHS UNINSURED IN 13           15" ;        
label variable  ER34384      "H61N MONTHS UNINSURED IN 14           15" ;        
label variable  ER34385      "H61D3 WTR COVERED BY INSURANCE NOW    15" ;        
label variable  ER34386      "H61E TYPE CURRENT HEALTH INS MEN 1    15" ;        
label variable  ER34387      "H61E TYPE CURRENT HEALTH INS MEN 2    15" ;        
label variable  ER34388      "H61E TYPE CURRENT HEALTH INS MEN 3    15" ;        
label variable  ER34389      "H61F SN 1ST PERSON EMP PROVIDES INS   15" ;        
label variable  ER34390      "H61F SN 2ND PERSON EMP PROVIDES INS   15" ;        
label variable  ER34391      "H61G SN 1ST PERSON POLICY HOLDER      15" ;        
label variable  ER34392      "H61G SN 2ND PERSON POLICY HOLDER      15" ;        
label variable  ER34393      "WHETHER MEDICARE NUMBER GIVEN         15" ;        
label variable  ER34393A     "G76 NUMBER OF JOBS IN PY              15" ;        
label variable  ER34393B     "G84A_G94B IMPUTED INTEREST            15" ;        
label variable  ER34393C     "ACC G84A_G94B IMPUTED - INTEREST      15" ;        
label variable  ER34393D     "G84B IMPUTED TANF                     15" ;        
label variable  ER34393E     "ACC G84B IMPUTED - TANF               15" ;        
label variable  ER34393F     "G84C_G94C IMPUTED SSI                 15" ;        
label variable  ER34393G     "ACC G84C_G94C IMPUTED - SSI           15" ;        
label variable  ER34393H     "G84D_G94D IMPUTED WELFARE             15" ;        
label variable  ER34393I     "ACC G84D_G94D IMPUTED - WELFARE       15" ;        
label variable  ER34393J     "G84F IMPUTED VETERANS BEN             15" ;        
label variable  ER34393K     "ACC G84F IMPUTED - VETERANS BEN       15" ;        
label variable  ER34393L     "G84G IMPUTED PENSION/ANN              15" ;        
label variable  ER34393M     "ACC G84G IMPUTED - PENSION/ANN        15" ;        
label variable  ER34393N     "G84H IMPUTED UNEMP COMP               15" ;        
label variable  ER34393O     "ACC G84H IMPUTED - UNEMP COMP         15" ;        
label variable  ER34393P     "G84J IMPUTED WORKERS COMP             15" ;        
label variable  ER34393Q     "ACC G84J IMPUTED - WORKERS COMP       15" ;        
label variable  ER34393R     "G84K IMPUTED CHILD SUPPORT            15" ;        
label variable  ER34393S     "ACC G84K IMPUTED - CHILD SUPPORT      15" ;        
label variable  ER34393T     "G84L IMPUTED HELP FROM RELS           15" ;        
label variable  ER34393U     "ACC G84L IMPUTED - HELP FROM RELS     15" ;        
label variable  ER34393V     "G84M_G94F IMPUTED OTHER INCOME        15" ;        
label variable  ER34393W     "ACC G84M_G94F IMPUTED - OTHER INCOME  15" ;        
label variable  ER34393X     "OFUM BUSINESS LABOR INCOME - IMPUTED  15" ;        
label variable  ER34393Y     "OFUM BUSINESS ASSET INCOME - IMPUTED  15" ;        
label variable  ER34394      "G33A WTR SOC SEC TYPE DISABILITY      15" ;        
label variable  ER34395      "G33A WTR SOC SEC TYPE RETIREMENT      15" ;        
label variable  ER34396      "G33A WTR SOC SEC TYPE SURVIVOR        15" ;        
label variable  ER34397      "G33A WTR SOC SEC TYPE DEP OF DISABLED 15" ;        
label variable  ER34398      "G33A WTR SOC SEC TYPE DEP OF RETIRED  15" ;        
label variable  ER34399      "G33A WTR SOC SEC TYPE OTHER           15" ;        
label variable  ER34400      "G34 AMT SOC SEC RCD                   15" ;        
label variable  ER34401      "G34 ACC SOC SEC AMT                   15" ;        
label variable  ER34401A     "OFUM TOTAL LABOR INCOME- IMPUTED      15" ;        
label variable  ER34401B     "ACCURACY OFUM TOTAL LABOR INCOME      15" ;        
label variable  ER34401C     "OFUM TOTAL ASSET INCOME - IMPUTED     15" ;        
label variable  ER34401D     "OFUM TOTAL TAXABLE INCOME - IMPUTED   15" ;        
label variable  ER34401E     "OFUM TOTAL TRANSFER INCOME -IMPUTED   15" ;        
label variable  ER34402      "MONTH S/O FAM FORMED                  15" ;        
label variable  ER34403      "YEAR S/O FAM FORMED                   15" ;        
label variable  ER34404      "MAIN FAM ID FOR S/O                   15" ;        
label variable  ER34405      "FOLLOW STATUS                         15" ;        
label variable  ER34406      "WHY FOLLOWABLE                        15" ;        
label variable  ER34407      "WTR ELIGIBLE FOR TA                   15" ;        
label variable  ER34408      "RESULT OF TA IW ATTEMPT               15" ;        
label variable  ER34409      "WTR ELIG FOR WELL-BEING 2016          15" ;        
label variable  ER34410      "RESULT OF WELL-BEING IW ATTEMPT 16    15" ;        
label variable  ER34411      "TYPE OF IND RECORD                    15" ;        
label variable  ER34412      "WHY NONRESPONSE                       15" ;        
label variable  ER34413      "CORE/IMM INDIVIDUAL LONGITUDINAL WT   15" ;        
label variable  ER34414      "CORE/IMM INDIVIDUAL CROSS-SECTION WT  15" ;        
label variable  ER34501      "2017 INTERVIEW NUMBER" ;                           
label variable  ER34502      "SEQUENCE NUMBER                       17" ;        
label variable  ER34503      "RELATION TO REFERENCE PERSON          17" ;        
label variable  ER34504      "AGE OF INDIVIDUAL                     17" ;        
label variable  ER34505      "MONTH INDIVIDUAL BORN                 17" ;        
label variable  ER34506      "YEAR INDIVIDUAL BORN                  17" ;        
label variable  ER34507      "MARITAL PAIRS INDICATOR               17" ;        
label variable  ER34508      "WHETHER MOVED IN/OUT                  17" ;        
label variable  ER34509      "MONTH MOVED IN/OUT                    17" ;        
label variable  ER34510      "YEAR MOVED IN/OUT                     17" ;        
label variable  ER34511      "RESPONDENT?                           17" ;        
label variable  ER34512      "SN 1ST PERSON WHO HELPED WITH IW      17" ;        
label variable  ER34513      "SN 2ND PERSON WHO HELPED WITH IW      17" ;        
label variable  ER34514      "SN 3RD PERSON WHO HELPED WITH IW      17" ;        
label variable  ER34515      "WTR COVERED BY TANF PAYMENTS IN 2016  17" ;        
label variable  ER34516      "EMPLOYMENT STATUS                     17" ;        
label variable  ER34517      "YEAR HIGHEST EDUCATION UPDATED        17" ;        
label variable  ER34518      "WHETHER EDUCATED IN US                17" ;        
label variable  ER34519      "WTR REC HS DIPLOMA/GED/NEITHER        17" ;        
label variable  ER34520      "MONTH GRADUATED HIGH SCHOOL           17" ;        
label variable  ER34521      "YEAR GRADUATED HIGH SCHOOL            17" ;        
label variable  ER34522      "GRADE LEVEL IF GED                    17" ;        
label variable  ER34523      "MONTH LAST IN SCHOOL IF GED           17" ;        
label variable  ER34524      "YEAR LAST IN SCHOOL IF GED            17" ;        
label variable  ER34525      "MONTH RECEIVED GED                    17" ;        
label variable  ER34526      "YEAR RECEIVED GED                     17" ;        
label variable  ER34527      "GRADE OF SCHOOL FINISHED IF NEITHER   17" ;        
label variable  ER34528      "MONTH LAST IN SCHOOL IF NEITHER       17" ;        
label variable  ER34529      "YEAR LAST IN SCHOOL IF NEITHER        17" ;        
label variable  ER34530      "WTR ATTENDED COLLEGE                  17" ;        
label variable  ER34531      "MONTH LAST ATTENDED COLLEGE           17" ;        
label variable  ER34532      "YEAR LAST ATTENDED COLLEGE            17" ;        
label variable  ER34533      "HIGHEST YEAR COLLEGE COMPLETED        17" ;        
label variable  ER34534      "WTR RECEIVED COLLEGE DEGREE           17" ;        
label variable  ER34535      "TYPE OF HIGHEST DEGREE                17" ;        
label variable  ER34536      "BACHELOR DEGREE MAJOR MEN1            17" ;        
label variable  ER34537      "BACHELOR DEGREE MAJOR MEN2            17" ;        
label variable  ER34538      "MONTH GRADUATED BACHELOR DEGREE       17" ;        
label variable  ER34539      "YEAR GRADUATED BACHELOR DEGREE        17" ;        
label variable  ER34540      "HIGHEST DEGREE MAJOR MEN1             17" ;        
label variable  ER34541      "HIGHEST DEGREE MAJOR MEN2             17" ;        
label variable  ER34542      "MONTH GRADUATED HIGHEST DEGREE        17" ;        
label variable  ER34543      "YEAR GRADUATED HIGHEST DEGREE         17" ;        
label variable  ER34544      "YEARS OF FOREIGN EDUCATION            17" ;        
label variable  ER34545      "FOREIGN DEGREE                        17" ;        
label variable  ER34546      "WTR CURRENTLY ENROLLED IN SCHOOL      17" ;        
label variable  ER34547      "GRADE CURRENTLY ENROLLED              17" ;        
label variable  ER34548      "YEARS COMPLETED EDUCATION             17" ;        
label variable  ER34549      "UP: WTR ATTENDED SCHOOL SINCE LAST IW 17" ;        
label variable  ER34550      "UP: WHETHER EDUCATED IN US            17" ;        
label variable  ER34551      "UP: WTR REC HS DIPLOMA/GED/NEITHER    17" ;        
label variable  ER34552      "UP: MONTH GRADUATED HIGH SCHOOL       17" ;        
label variable  ER34553      "UP: YEAR GRADUATED HIGH SCHOOL        17" ;        
label variable  ER34554      "UP: GRADE LEVEL IF GED                17" ;        
label variable  ER34555      "UP: MONTH LAST IN SCHOOL IF GED       17" ;        
label variable  ER34556      "UP: YEAR LAST IN SCHOOL IF GED        17" ;        
label variable  ER34557      "UP: MONTH RECEIVED GED                17" ;        
label variable  ER34558      "UP: YEAR RECEIVED GED                 17" ;        
label variable  ER34559      "UP: GRADE SCHOOL FINISHED IF NEITHER  17" ;        
label variable  ER34560      "UP: MONTH LAST IN SCHOOL IF NEITHER   17" ;        
label variable  ER34561      "UP: YEAR LAST IN SCHOOL IF NEITHER    17" ;        
label variable  ER34562      "UP: WTR ATTENDED COLLEGE              17" ;        
label variable  ER34563      "UP: MONTH LAST ATTENDED COLLEGE       17" ;        
label variable  ER34564      "UP: YEAR LAST ATTENDED COLLEGE        17" ;        
label variable  ER34565      "UP: HIGHEST YEAR COLLEGE COMPLETED    17" ;        
label variable  ER34566      "UP: WTR RECEIVED COLLEGE DEGREE       17" ;        
label variable  ER34567      "UP: TYPE OF HIGHEST DEGREE            17" ;        
label variable  ER34568      "UP: BACHELOR DEGREE MAJOR MEN1        17" ;        
label variable  ER34569      "UP: BACHELOR DEGREE MAJOR MEN2        17" ;        
label variable  ER34570      "UP: MONTH GRADUATED BACHELOR DEGREE   17" ;        
label variable  ER34571      "UP: YEAR GRADUATED BACHELOR DEGREE    17" ;        
label variable  ER34572      "UP: HIGHEST DEGREE MAJOR MEN1         17" ;        
label variable  ER34573      "UP: HIGHEST DEGREE MAJOR MEN2         17" ;        
label variable  ER34574      "UP: MONTH GRADUATED HIGHEST DEGREE    17" ;        
label variable  ER34575      "UP: YEAR GRADUATED HIGHEST DEGREE     17" ;        
label variable  ER34576      "UP: YEARS OF FOREIGN EDUCATION        17" ;        
label variable  ER34577      "UP: FOREIGN DEGREE                    17" ;        
label variable  ER34578      "UP: WTR CURRENTLY ENROLLED IN SCHOOL  17" ;        
label variable  ER34579      "UP: GRADE CURRENTLY ENROLLED          17" ;        
label variable  ER34580      "HEALTH GOOD?                          17" ;        
label variable  ER34581      "H5N/H50A CKPT WTR INDIVIDUAL IS 65+   17" ;        
label variable  ER34582      "H5N2/H50B WTR CHNGE MAKING DECISIONS  17" ;        
label variable  ER34583      "H5N3/H50C WTR CHNGE INTEREST ACTVTIES 17" ;        
label variable  ER34584      "H5N4/H50D WTR CHNGE REPEATNG STORIES  17" ;        
label variable  ER34585      "H5N5/H50E WTR CHNGE LEARNING/USE TOOLS17" ;        
label variable  ER34586      "H5N6/H50F WTR CHNGE REMEMBERING DATES 17" ;        
label variable  ER34587      "H5N7/H50G WTR CHNGE HNDLNG MONEY ISSUE17" ;        
label variable  ER34588      "H5N8/H50H WTR CHNGE REMEMBERING APPTS 17" ;        
label variable  ER34589      "H5N9/H50I WTR CHNGE IN THINKING/MEMORY17" ;        
label variable  ER34590      "WTR ENDORSED 2+ MEMORY PROBLEMS       17" ;        
label variable  ER34591      "H61E2 WTR STATE INSURNCE PLN FOR KIDS 17" ;        
label variable  ER34592      "H61M MONTHS UNINSURED IN 15           17" ;        
label variable  ER34593      "H61N MONTHS UNINSURED IN 16           17" ;        
label variable  ER34594      "H61D3 WTR COVERED BY INSURANCE NOW    17" ;        
label variable  ER34595      "H61E TYPE CURRENT HEALTH INS MEN 1    17" ;        
label variable  ER34596      "H61E TYPE CURRENT HEALTH INS MEN 2    17" ;        
label variable  ER34597      "H61E TYPE CURRENT HEALTH INS MEN 3    17" ;        
label variable  ER34598      "H61F SN 1ST PERSON EMP PROVIDES INS   17" ;        
label variable  ER34599      "H61F SN 2ND PERSON EMP PROVIDES INS   17" ;        
label variable  ER34600      "H61G SN 1ST PERSON POLICY HOLDER      17" ;        
label variable  ER34601      "H61G SN 2ND PERSON POLICY HOLDER      17" ;        
label variable  ER34602      "WHETHER MEDICARE NUMBER GIVEN         17" ;        
label variable  ER34603      "G33A WTR SOC SEC TYPE DISABILITY      17" ;        
label variable  ER34604      "G33A WTR SOC SEC TYPE RETIREMENT      17" ;        
label variable  ER34605      "G33A WTR SOC SEC TYPE SURVIVOR        17" ;        
label variable  ER34606      "G33A WTR SOC SEC TYPE DEP OF DISABLED 17" ;        
label variable  ER34607      "G33A WTR SOC SEC TYPE DEP OF RETIRED  17" ;        
label variable  ER34608      "G33A WTR SOC SEC TYPE OTHER           17" ;        
label variable  ER34609      "G34 AMT SOC SEC RCD                   17" ;        
label variable  ER34610      "G34 ACC SOC SEC AMT                   17" ;        
label variable  ER34611      "G76 NUMBER OF JOBS IN PY              17" ;        
label variable  ER34612      "G84A_G94B IMPUTED INTEREST            17" ;        
label variable  ER34613      "ACC G84A_G94B IMPUTED - INTEREST      17" ;        
label variable  ER34614      "G84B IMPUTED TANF                     17" ;        
label variable  ER34615      "ACC G84B IMPUTED - TANF               17" ;        
label variable  ER34616      "G84C_G94C IMPUTED SSI                 17" ;        
label variable  ER34617      "ACC G84C_G94C IMPUTED - SSI           17" ;        
label variable  ER34618      "G84D_G94D IMPUTED WELFARE             17" ;        
label variable  ER34619      "ACC G84D_G94D IMPUTED - WELFARE       17" ;        
label variable  ER34620      "G84F IMPUTED VETERANS BEN             17" ;        
label variable  ER34621      "ACC G84F IMPUTED - VETERANS BEN       17" ;        
label variable  ER34622      "G84G IMPUTED PENSION/ANN              17" ;        
label variable  ER34623      "ACC G84G IMPUTED - PENSION/ANN        17" ;        
label variable  ER34624      "G84H IMPUTED UNEMP COMP               17" ;        
label variable  ER34625      "ACC G84H IMPUTED - UNEMP COMP         17" ;        
label variable  ER34626      "G84J IMPUTED WORKERS COMP             17" ;        
label variable  ER34627      "ACC G84J IMPUTED - WORKERS COMP       17" ;        
label variable  ER34628      "G84K IMPUTED CHILD SUPPORT            17" ;        
label variable  ER34629      "ACC G84K IMPUTED - CHILD SUPPORT      17" ;        
label variable  ER34630      "G84L IMPUTED HELP FROM RELS           17" ;        
label variable  ER34631      "ACC G84L IMPUTED - HELP FROM RELS     17" ;        
label variable  ER34632      "G84M_G94F IMPUTED OTHER INCOME        17" ;        
label variable  ER34633      "ACC G84M_G94F IMPUTED - OTHER INCOME  17" ;        
label variable  ER34634      "OFUM BUSINESS LABOR INCOME - IMPUTED  17" ;        
label variable  ER34635      "OFUM BUSINESS ASSET INCOME - IMPUTED  17" ;        
label variable  ER34636      "OFUM TOTAL LABOR INCOME- IMPUTED      17" ;        
label variable  ER34637      "ACCURACY OFUM TOTAL LABOR INCOME      17" ;        
label variable  ER34638      "OFUM TOTAL ASSET INCOME - IMPUTED     17" ;        
label variable  ER34639      "OFUM TOTAL TAXABLE INCOME - IMPUTED   17" ;        
label variable  ER34640      "OFUM TOTAL TRANSFER INCOME -IMPUTED   17" ;        
label variable  ER34641      "MONTH S/O FAM FORMED                  17" ;        
label variable  ER34642      "YEAR S/O FAM FORMED                   17" ;        
label variable  ER34643      "MAIN FAM ID FOR S/O                   17" ;        
label variable  ER34644      "FOLLOW STATUS                         17" ;        
label variable  ER34645      "WHY FOLLOWABLE                        17" ;        
label variable  ER34646      "WTR ELIGIBLE FOR TA                   17" ;        
label variable  ER34647      "RESULT OF TA IW ATTEMPT               17" ;        
label variable  ER34648      "TYPE OF IND RECORD                    17" ;        
label variable  ER34649      "WHY NONRESPONSE                       17" ;        
label variable  ER34650      "CORE/IMM INDIVIDUAL LONGITUDINAL WT   17" ;        
label variable  ER34651      "CORE/IMM INDIVIDUAL CROSS-SECTION WT  17" ;        

#delimit cr

// Generate IDs

	* Individual
	gen ID = ER30001*1000 + ER30002
	lab var ID "ER30001*1000 + ER30002"
	
	* Bio Parents
	gen mother_ID = ER32009*1000 + ER32010
	lab var mother_ID "ER32009*1000 + ER32010"
	gen father_ID = ER32016*1000 + ER32017
	lab var father_ID "ER32016*1000 + ER32017"
	
// Save

order *ID
compress
note:  data created/saved on TS
save "${pre}/ind2017.dta", replace
