cls 
clear

use "/Users/jacksardinia/Downloads/OMNI513.dta"
/*Need to FIRST format times in excel file to CUSTOM/ [h]:mm:ss*/

*RENAMING VARIABLES
*Index Patient Tracking Tool (start time)
rename timestarted IPTTst
*Index Patient Tracking Tool (end time)
rename timeendedraclicknowto IPTTet
*Index Patient (research assistant's name)
rename researchassistantsname IPra
*Index Patient (screening event date)
rename rascreeningdate IPsd
*Index Questionnaire (start time)
rename starttime IQst
*Index Questionnaire (end time)
rename endtime IQet
*Index Medical Data Extraction (start time)
rename k IMDEst
*Index Medical Data Extraction (end time)
rename l IMDEet 
*Index HHC Information Log (start time)
rename m HHCILst 
*Index HHC Information Log (end time)
rename n HHCILet
*HHC Screening (start time)
rename o HHCSst
*HHC Screening (end time)
rename p HHCSet
*HHC Screening (date of 1st household visit)
rename dateofthefirsthouseholdvisi HHCSdofhhv
*HHC Screening (1st household visit)
rename householdvisitattemptchoice HHCSfv
*HHC Screening (2nd household visit)
rename s HHCSsv 
*HHC Screening (3rd household visit)
rename t HHCStv
*HHC Screening (first HH visit start time)
rename timestartedwiththe1stvisit HHCSfhhvst
*HHC Screening (second HH visit start time)
rename timestartedwiththe2ndvisit HHCshhvst
*HHC Screening (third HH visit start time)
rename timestartedwiththe3rdvisit HHCthhvst
*Randomization Module (study arm)
rename randomisationarmclickthe RMsa
*HHC Consenting and Data Collection (gx start time)
rename teststarttime HHCCADCgxst
*HHC Symptomatic Questionnaire (ra name)
rename raname HHCSQran
*HHC Symptomatic Questionnaire (start time)
rename ae HHCSQst
*HHC Results and Sputum Collection (time done)
rename timedone HHCRASCtd
*HHC Symptomatic Questionnaire (end time)
rename ah HHCSQet
*HHC Results and Sputum Collection (time of sputum collection)
rename timeofsputumcollection HHCRASCtosc
*HHC Lab Results (time of specimen collection)
rename timeofspecimencollection HHCLRtosc
*HHC Lab Results (report date)
rename reportdate HHCLRrd
*HHC Lab Results (date processed)
rename dateprocessed HHCLRdp
*Presentation Testing (start time)
rename am PTst
*Presentation Testing (end time)
rename an PTet
*Presentation Results/Treatment Initiation (start time)
rename ao PRTIst
*Presentation Results/Treatment Initiation (end time)
rename ap PRTIet
*Is the household member present at the 1st visit?
rename isthehouseholdmemberpresent IHHMP1
*Is the household member present at the 2nd visit?
rename as IHHMP2
*Is the household member present at the 3rd visit?
rename at IHHMP3
*Minutes spent walking to the clinic (English)?
rename minuteswalking MWE
*Minutes spent walking to the clinic (Xhosa)?
rename imizuzuuhambangenyawo MWX
*Minutes spent walking to the clinic (Afrikaans)?
rename minutegestap MWA
*Minutes spent transporting to the clinic (English)?
rename minutestransport MTE
*Minutes spent transporting to the clinic (Xhosa)?
rename imizuzuuhambangesithuthi MTX
*Minutes spent transporting to the clinic (Afrikaans)?
rename minutemetvervoer MTA
*Minutes spent other to the clinic (English)?
rename minutesother MOE
*Minutes spent other to the clinic (Xhosa)?
rename imizuzuenye MOX
*Minutes spent other to the clinic (Afrikaans)?
rename minuteander MOA
*Payment for transportation to the clinic (English)?
rename ifyoupaidfortransporthowm PTE
*Payment for transportation to the clinic (Xhosa)?
rename ukubaubhateleisithuthikuxab PTX
*Payment for transportation to the clinic (Afrikaans)?
rename indienjybetaalhetvirvervoer PTA
*Total waiting time (English)?
rename whatwasthetotaltraveltimea TWE
*Total waiting time (Afrikaans)?
rename watwasdietotaletydwatuspa TWA
*Total waiting time (Xhosa)?
rename uchitheixeshaelingakananiendl TWX
*How much did you spend on food (English)?
rename howmuchdidyouspendonfoodd SOFE
*How much did you spend on food (Xhosa)?
rename usebenzisemaliniekutyeniendle SOFX
*How much did you spend on food (Afrikaans)?
rename hoebaiegeldhetjyintotaals SOFA
*Date of symptomatic questionnaire
rename dateofsymptomaticquestionnair HHCdosq
*Household income (English)
rename whatisyourtotalhouseholdinc incomeE
*Household income (Afrikaans)
rename watisjoutotalehuishoudelike incomeA
*Household income (Xhosa)
rename yimaliniimalieyingenisokwikha incomeX
*Household income HHC
rename cb incomeHHC

*Note that new names from here will invert letter case

/*TOTAL TIME INDEX PATIENT TRACKING TOOL*/
*convert Time (Started) of Index Enrollment: Index Patient Tracking tool to numeric*
gen timeoneS=clock(IPTTst, "hms")
format timeoneS %tc
gen ipttST= hh(timeoneS) + mm(timeoneS)/60
*convert Time (Ended) of Index Enrollment: Index Patient Tracking tool to numeric*
gen timeoneE=clock(IPTTet, "hms")
format timeoneE %tc
gen ipttET= hh(timeoneE) + mm(timeoneE)/60
*Gen variable: Total Time: Index Enrollment: Index Patient Tracking tool [and covert to minutes]
gen indexpatienttrackingtoolTT=(ipttET-ipttST)*60
replace indexpatienttrackingtoolTT=round(indexpatienttrackingtoolTT,.1)
replace indexpatienttrackingtoolTT=. if indexpatienttrackingtoolTT <0
sum indexpatienttrackingtoolTT, detail 


/*TOTAL TIME INDEX QUESTIONNAIRE TOOL*/
*convert Time (Started) of Index questionnaire to numeric*
gen timetwoS=clock(IQst, "hms")
format timetwoS %tc
gen iqST= hh(timetwoS) + mm(timetwoS)/60
*convert Time (Ended) of Index questionnaire to numeric*
gen timetwoE=clock(IQet, "hms")
format timetwoE %tc
gen iqET= hh(timetwoE) + mm(timetwoE)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen indexquestionnaireTT=(iqET-iqST)*60
replace indexquestionnaireTT=round(indexquestionnaireTT,.1)
sum indexquestionnaireTT, detail 
order indexquestionnaireTT, after(indexpatienttrackingtoolTT)
/*TOTAL TIME INDEX MEDICAL DATA EXTRACTION*/
*convert Time (Started) of Index Medical Data Extraction to numeric*
gen time3S=clock(IMDEst, "hms")
format time3S %tc
gen imdeST= hh(time3S) + mm(time3S)/60
*convert Time (Ended) of Index questionnaire to numeric*
gen time3E=clock(IMDEet, "hms")
format time3E %tc
gen imdeET= hh(time3E) + mm(time3E)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen indexmedicaldataextractionTT=(imdeET-imdeST)*60
replace indexmedicaldataextractionTT=round(indexmedicaldataextractionTT,.1)
sum indexmedicaldataextractionTT, detail 
order indexmedicaldataextractionTT, last

/*TOTAL TIME INDEX HHC INFORMATION LOG*/
*convert Time (Started) of Index Medical Data Extraction to numeric*
gen time4S=clock(HHCILst, "hms")
format time4S %tc
gen hhcilST= hh(time4S) + mm(time4S)/60
*convert Time (Ended) of Index questionnaire to numeric*
gen time4E=clock(HHCILet, "hms")
format time4E %tc
gen hhcilET= hh(time4E) + mm(time4E)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen indexhouseholdcontactinfoTT=(hhcilET-hhcilST)*60
replace indexhouseholdcontactinfoTT=round(indexhouseholdcontactinfoTT,.1)
sum indexhouseholdcontactinfoTT, detail 
order indexhouseholdcontactinfoTT, last

/*AVERAGE TOTAL TIME PROCESS 1*/
egen process1tt=rowtotal(indexpatienttrackingtoolTT indexquestionnaireTT indexmedicaldataextractionTT), missing
replace process1tt=. if process1tt==0 | process1tt <0
sum process1tt, detail

tabulate IPra, summarize(process1tt)

/*TOTAL TIME HHC: Screening *1*(from start time to point at which "Household visit" is checked")
		-note that this is the time estimated for UNSUCESSFUL HHCIs;;; also note that this is for first visit= 2nd and 3rd visit cannot be account for*/
*convert Time (Started) of HHC Screening to numeric*
gen time5S=clock(HHCSst, "hms")
format time5S %tc
gen hhcsST= hh(time5S) + mm(time5S)/60
*convert Time (*Ended*/start HHC- first visit- numeric*
gen time5E=clock(HHCSfhhvst, "hms")
format time5E %tc
gen hhcsFHHVST= hh(time5E) + mm(time5E)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen householdcontactscreeningTT1=(hhcsFHHVST-hhcsST)*60 

replace householdcontactscreeningTT1=. if IHHMP1=="No" 
*outliers
replace householdcontactscreeningTT1=. if householdcontactscreeningTT1<0 | householdcontactscreeningTT1>15
sum householdcontactscreeningTT1, detail
tab householdcontactscreeningTT1


*Removing outliers- assumed as errors. May need to be changed*/

/*TOTAL TIME HHC: Screening (from the time started with visit (1/2/or 3) to end time)*/
/*gen time6S=clock(HHCSfhhvst, "hms")
format time6S %tc
gen hhcsFHHVST=hh(time6S) + mm(time6s)/60*/
*convert Time (ended) to numeric
gen time6E=clock(HHCSet, "hms")
format time6E %tc
gen hhcsET= hh(time6E) + mm(time6E)/60
*Gen variable: Total time: HHCS when patient is there first time *
gen householdcontactscreeningA=(hhcsET-hhcsFHHVST)*60
replace householdcontactscreeningA=. if IHHMP1=="No"
*outliers
replace householdcontactscreeningA=. if householdcontactscreeningA>60
replace householdcontactscreeningA=. if householdcontactscreeningA<0
sum householdcontactscreeningA, detail
tab householdcontactscreeningA
*Gen variable: Total time: HHCS when patient is there second time *
*convert Time (*start HHC- second visit- numeric*
gen time7E=clock(HHCshhvst, "hms")
format time7E %tc
gen hhcsSHHVST= hh(time7E) + mm(time7E)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen householdcontactscreeningB=(hhcsET-hhcsSHHVST)*60
replace householdcontactscreeningB=round(householdcontactscreeningB,.1)
replace householdcontactscreeningB=. if IHHMP2=="No"
*outliers
replace householdcontactscreeningB=. if householdcontactscreeningB>60
replace householdcontactscreeningB=. if householdcontactscreeningB<0
sum householdcontactscreeningB, detail
tab householdcontactscreeningB
*Gen variable: Total time: HHCS when patient is there 3rd time *
*convert Time (*Ended*/start HHC- first visit- numeric*
gen time8E=clock(HHCthhvst, "hms")
format time8E %tc
gen hhcsTHHVST= hh(time8E) + mm(time8E)/60
*Gen variable: Total Time: questionnaire [and covert to minutes]
gen householdcontactscreeningC=(hhcsET-hhcsTHHVST)*60
replace householdcontactscreeningC=round(householdcontactscreeningC,.1)
replace householdcontactscreeningC=. if IHHMP3=="No" 
*outliers
replace householdcontactscreeningC=. if householdcontactscreeningC>60
replace householdcontactscreeningC=. if householdcontactscreeningC<0
sum householdcontactscreeningC, detail
tab householdcontactscreeningC
*Generate householdcontactscreeningABC for all three
gen householdcontactscreeningABC=.
replace householdcontactscreeningABC=householdcontactscreeningA if householdcontactscreeningA!=. & householdcontactscreeningB==. & householdcontactscreeningC==.
replace householdcontactscreeningABC=householdcontactscreeningB if householdcontactscreeningB!=. & householdcontactscreeningA==. & householdcontactscreeningC==.
replace householdcontactscreeningABC=householdcontactscreeningC if householdcontactscreeningC!=. & householdcontactscreeningA==. & householdcontactscreeningB==.
sum householdcontactscreeningABC
tab householdcontactscreeningABC

*Gen variable: Total time: symptomatic questionnaire 
gen time9S=clock(HHCSQst, "hms")
format time9S %tc
gen hhcsqST= hh(time9S)+ mm(time9S)/60

*convert time (ended) of questionnaire)
gen time9E=clock(HHCSQet, "hms")
format time9E %tc
gen hhcsqET= hh(time9E) + mm(time9E)/60
*HHC symptomatic questionnaire total time 
gen hhcsqTT=(hhcsqET-hhcsqST)*60
replace hhcsqTT=. if hhcsqTT<0
sum hhcsqTT
tab hhcsqTT


order HHCdosq, last
****NOTE-- I think need to convert this to time as has been done above; need to account for those that start and end on different days 
/*egen lateend= max(hhcsqET), by (screeningid)
egen latest=min(hhcsqST), by (screeningid)
gen HHCSQTT=lateend-latest
sum HHCSQTT
tab HHCSQTT
fda*/
*Total HHC screening time First visit
gen HHCStotalA=.
replace HHCStotalA=(hhcsqET-hhcsFHHVST)*60
replace HHCStotalA=. if HHCStotalA<0
replace HHCStotalA=. if HHCdosq!=HHCSdofhhv
tab HHCStotalA
sum HHCStotalA
*Total HHC screening time Second visit
gen HHCStotalB=.
replace HHCStotalB=(hhcsqET-hhcsSHHVST)*60
replace HHCStotalB=. if HHCStotalB<0
replace HHCStotalB=. if HHCdosq!=dateofthesecondhouseholdvis
tab HHCStotalB
sum HHCStotalB
*Total HHC screening time Third visit
gen HHCStotalC=.
replace HHCStotalC=(hhcsqET-hhcsTHHVST)*60
replace HHCStotalC=. if HHCStotalC<0
replace HHCStotalC=. if HHCdosq!=dateofthethirdhouseholdvisi
tab HHCStotalC
sum HHCStotalC

gen HHCStotalABC=.
replace HHCStotalABC=HHCStotalA if HHCStotalA!=0 & HHCStotalB==. & HHCStotalC==.
replace HHCStotalABC=HHCStotalB if HHCStotalB!=0 & HHCStotalA==. & HHCStotalC==.
replace HHCStotalABC=HHCStotalC if HHCStotalC!=0 & HHCStotalA==. & HHCStotalB==.
tab HHCStotalABC
sum HHCStotalABC

*Total time for HHC: Results and sputum collection 



*Q 12 -time to travel questions
*destring Q12s
destring MWE, replace
destring MWX, replace
destring MWA, replace
destring MTE, replace
destring MTX, replace
destring MTA, replace
destring MOE, replace
destring MOX, replace
destring MOA, replace
destring PTE, replace
destring PTX, replace
destring PTA, replace
destring TWE, replace
destring TWX, replace
destring TWA, replace
destring SOFE, replace
destring SOFX, replace
destring SOFA, replace 

*Combine MWs
generate mw=.
replace mw=MWE if MWE !=. & MWX==. & MWA==.
replace mw=MWX if MWX!=. & MWE==. & MWA==.
replace mw=MWA if MWA!=. & MWE==. & MWX==.

*Combine MTs
generate mt=.
replace mt=MTE if MTE !=. & MTX==. & MTA==.
replace mt=MTX if MTX!=. & MTE==. & MTA==.
replace mt=MTA if MTA!=. & MTE==. & MTX==.


*Combine MOs
generate mo=.
replace mo=MOE if MOE !=. & MOX==. & MOA==.
replace mo=MOX if MOX!=. & MOE==. & MOA==.
replace mo=MOA if MOA!=. & MOE==. & MOX==.

*Minutes getting to the clinic
generate mgtc=.
replace mgtc=mw+mt if mw!=. & mt!=.
replace mgtc=mt if mt!=. & mw==. & mo==.
replace mgtc=mw if mw!=. & mt==. & mo==.
replace mgtc=mo if mo!=. 


*Combine PTs
generate pt=.
replace pt=PTE if PTE !=. & PTX==. & PTA==.
replace pt=PTX if PTX!=. & PTE==. & PTA==.
replace pt=PTA if PTA!=. & PTE==. & PTX==.


*Combine TWs
generate tw=.
replace tw=TWE if TWE !=. & TWX==. & TWA==.
replace tw=TWX if TWX!=. & TWE==. & TWA==.
replace tw=TWA if TWA!=. & TWE==. & TWX==.



*Combine SOFs
generate sof=.
replace sof=SOFE if SOFE !=. & SOFX==. & SOFA==.
replace sof=SOFX if SOFX!=. & SOFE==. & SOFA==.
replace sof=SOFA if SOFA!=. & SOFE==. & SOFX==.

*Combine incomes

tab incomeA
tab incomeX
tab incomeE
tab incomeHHC 
tab HHCSQet
tab HHCSQran
gen INCOME=.
tab HHCCADCgxst



*analysis for excel sheet
*Index Patient Tracking Tool Total Time 
sum indexpatienttrackingtoolTT, detail
*Index Patient Questionnaire Total Time 
sum indexquestionnaireTT, detail
*Index Patient Medical Data Extraction Total Time 
sum indexmedicaldataextractionTT, detail
*Index Household Contact Info Total Time 
sum indexhouseholdcontactinfoTT, detail
*Index Enrollment Total Time (Process 1 total time)
sum process1tt, detail
*Household Contact Screening Total Time (if negative) 
sum householdcontactscreeningTT1, detail
*Household Contact Screening Tool Total Time (MEAN when patient is there 1/2/or 3 time)
sum householdcontactscreeningABC, detail
*Household Contact Screening: Symptomatic Questionnaire Total Time 
sum hhcsqTT, detail
*HHC Total Time (Process 2 total time)
sum HHCStotalABC, detail
*Minutes getting to the clinic
sum mgtc, detail
*Minutes waiting at the clinic
sum tw, detail
tab tw
*Money spent on food (RAND)
sum sof, detail
tab sof
*Money spent on travel during the visit (RAND)
sum pt, detail
