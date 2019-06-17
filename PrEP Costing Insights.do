
cls 
clear

use "/Users/jacksardinia/Downloads/PrEP1122.dta"

****RENAME VAIRABLES****
*rename baseline questionnaire start time
rename starttime BQst
*rename baseline questionnaire study site
rename studysite BQstudysite
*rename baseline questionnaire particiipant type
rename participanttype BQparticipanttype
*rename baseline questionnaire end time 
rename endtime BQet
*rename BQFingerPrint ACASI staff member
rename k BQFAstaff
*rename BQFingerPrint ACASI Date
rename l BQFAdate
*rename BQFingerPrint ACASI start time
rename m BQFAst
*rename BQFingerPrint ACASI end time 
rename n BQFAet
*rename PREP: Screening and Enrolment staff member
rename o PSEstaff
*rename PREP: Screening and Enrolment date
rename p PSEdate
*rename PREP: Screening and Enrolment start time
rename q PSEst
*rename PREP: Screening and Enrolment end time
rename r PSEet
*rename PREP: Screening and Enrolment ACASI completion 
rename radidtheparticipantcomplete PSEacasicomp
*rename Late Initiation staff
rename t LIstaff
*rename Late Initiation date 
rename u LIdate
*rename Late Initiation start time 
rename v LIst
*rename Late Initiation end time 
rename w LIet
*rename PREP: Specimen Collections staff member
rename x PSCstaff
*rename PREP: Specimen Collections date
rename y PSCdate
*rename PREP: Specimen Collections start time 
rename z PSCst
*rename PREP: Specimen Collections end time 
rename aa PSCet
*rename PREP: Randomization staff member
rename ab PRstaff
*rename PREP: Randomization date
rename ac PRdate
*rename PREP: Randomization start time 
rename ad PRst
*rename PREP: Randomization end time 
rename ae PRet
*rename PREP: Contacts and Medications Pick-Up staff member 
rename af PCAMPstaff
*rename PREP: Contacts and Medications Pick-Up date
rename ag PCAMPdate
*rename PREP: Contacts and Medications Pick-Up start time
rename ah PCAMPst
*rename PREP: Contacts and Medications Pick-Up end time 
rename ai PCAMPet
*rename PREP: Reminder Scheudules staff member 
rename aj PRSstaff
*rename PREP: Reminder Scheudules start time 
rename ak PRSst
*rename PREP: Reminder Scheudules end time 
rename al PRSet
*rename PREP Presentation staff member
rename am PPstaff
*rename PREP Presentation date 
rename an PPdate
*rename PREP Presentation start time 
rename ao PPst
*rename PREP Presentation end time 
rename ap PPet
*rename PREP: Orientation staff member 
rename aq POstaff
*rename PREP: Orientation date
rename ar POdate
*rename PREP: Orientation start time 
rename as POst
*rename PREP: Orientation end time 
rename at POet
*rename PREP: Prep Side-Effects and Adherence staff member
rename au PPSEAAstaff
*rename PREP: Prep Side-Effects and Adherence date 
rename av PPSEAAdate
*rename PREP: Prep Side-Effects and Adherence start time 
rename aw PPSEAAst
*rename PREP: Prep Side-Effects and Adherence end time 
rename ax PPSEAAet
*rename M1 PREP: Adherence Session staff member 
rename ay M1PASstaff
*rename M1 PREP: Adherence Session date
rename az M1PASdate
*rename M1 PREP: Adherence Session start time 
rename timestarted M1PASst
*rename M1 PREP: Adherence Session end time 
rename timefinishedfillingoutthisf M1PASet

*Note that the new names will follow a pattern inverting letters

/*TOTAL TIME BQ: Screening and Enrollment Tool*/
*convert Time (Started) of tool to numeric*
gen time1S=clock(BQst, "hms")
format time1S %tc
gen bqST= hh(time1S) + mm(time1S)/60
*convert Time (Ended) of tool to numeric
gen time1E=clock(BQet, "hms")
format time1E %tc
gen bqET= hh(time1E) + mm(time1E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen bqTT=(bqET-bqST)*60
replace bqTT=round(bqTT,.1)
replace bqTT=. if bqTT <0
sum bqTT
tab bqTT

/*TOTAL TIME BQ: FingerPrint and ACASI*/
*convert Time (Started) of tool to numeric*
gen time2S=clock(BQFAst, "hms")
format time2S %tc
gen bqfaST= hh(time2S) + mm(time2S)/60
*convert Time (Ended) of tool to numeric
gen time2E=clock(BQFAet, "hms")
format time2E %tc
gen bqfaET= hh(time2E) + mm(time2E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen bqfaTT=(bqfaET-bqfaST)*60
replace bqfaTT=round(bqfaTT,.1)
replace bqfaTT=. if bqfaTT <0
sum bqfaTT
tab bqfaTT

/*TOTAL TIME PREP: Screening and Enrolment*/
*convert Time (Started) of tool to numeric*
gen time3S=clock(PSEst, "hms")
format time3S %tc
gen pseST= hh(time3S) + mm(time3S)/60
*convert Time (Ended) of tool to numeric
gen time3E=clock(PSEet, "hms")
format time3E %tc
gen pseET= hh(time3E) + mm(time3E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen pseTT=(pseET-pseST)*60
replace pseTT=round(pseTT,.1)
replace pseTT=. if pseTT <0
sum pseTT
tab pseTT

/*TOTAL TIME Late Initiation*/
*convert Time (Started) of tool to numeric*
gen time4S=clock(LIst, "hms")
format time4S %tc
gen liST= hh(time4S) + mm(time4S)/60
*convert Time (Ended) of tool to numeric
gen time4E=clock(LIet, "hms")
format time4E %tc
gen liET= hh(time4E) + mm(time4E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen liTT=(liET-liST)*60
replace liTT=round(liTT,.1)
replace liTT=. if liTT <0
sum liTT
tab liTT

/*TOTAL TIME PREP: Specimen Collections*/
*convert Time (Started) of tool to numeric*
gen time5S=clock(PSCst, "hms")
format time5S %tc
gen pscST= hh(time5S) + mm(time5S)/60
*convert Time (Ended) of tool to numeric
gen time5E=clock(PSCet, "hms")
format time5E %tc
gen pscET= hh(time5E) + mm(time5E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen pscTT=(pscET-pscST)*60
replace pscTT=round(pscTT,.1)
replace pscTT=. if pscTT <0
sum pscTT
tab pscTT

/*TOTAL TIME PREP: Randomization*/
*convert Time (Started) of tool to numeric*
gen time6S=clock(PRst, "hms")
format time6S %tc
gen prST= hh(time6S) + mm(time6S)/60
*convert Time (Ended) of tool to numeric
gen time6E=clock(PRet, "hms")
format time6E %tc
gen prET= hh(time6E) + mm(time6E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen prTT=(prET-prST)*60
replace prTT=round(prTT,.1)
replace prTT=. if prTT <0
sum prTT
tab prTT

/*TOTAL TIME PREP: Contacts and Medications Pick-Up */
*convert Time (Started) of tool to numeric*
gen time7S=clock(PCAMPst, "hms")
format time7S %tc
gen pcampST= hh(time7S) + mm(time7S)/60
*convert Time (Ended) of tool to numeric
gen time7E=clock(PCAMPet, "hms")
format time7E %tc
gen pcampET= hh(time7E) + mm(time7E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen pcampTT=(pcampET-pcampST)*60
replace pcampTT=round(pcampTT,.1)
replace pcampTT=. if pcampTT <0
sum pcampTT
tab pcampTT

/*TOTAL TIME PREP: Reminder Scheudules*/
*convert Time (Started) of tool to numeric*
gen time8S=clock(PRSst, "hms")
format time8S %tc
gen prsST= hh(time8S) + mm(time8S)/60
*convert Time (Ended) of tool to numeric
gen time8E=clock(PRSet, "hms")
format time8E %tc
gen prsET= hh(time8E) + mm(time8E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen prsTT=(prsET-prsST)*60
replace prsTT=round(prsTT,.1)
replace prsTT=. if prsTT <0
sum prsTT
tab prsTT

/*TOTAL TIME PREP: Presentation*/
*convert Time (Started) of tool to numeric*
gen time9S=clock(PPst, "hms")
format time9S %tc
gen ppST= hh(time9S) + mm(time9S)/60
*convert Time (Ended) of tool to numeric
gen time9E=clock(PPet, "hms")
format time9E %tc
gen ppET= hh(time9E) + mm(time9E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen ppTT=(ppET-ppST)*60
replace ppTT=round(ppTT,.1)
replace ppTT=. if ppTT <0
sum ppTT
tab ppTT

/*TOTAL TIME PREP: Orientation*/
*convert Time (Started) of tool to numeric*
gen time10S=clock(POst, "hms")
format time10S %tc
gen poST= hh(time10S) + mm(time10S)/60
*convert Time (Ended) of tool to numeric
gen time10E=clock(POet, "hms")
format time10E %tc
gen poET= hh(time10E) + mm(time10E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen poTT=(poET-poST)*60
replace poTT=round(poTT,.1)
replace poTT=. if poTT <0
sum poTT
tab poTT

/*TOTAL TIME PREP: Prep Side-Effects and Adherence*/
*convert Time (Started) of tool to numeric*
gen time11S=clock(PPSEAAst, "hms")
format time11S %tc
gen ppseaaST= hh(time11S) + mm(time11S)/60
*convert Time (Ended) of tool to numeric
gen time11E=clock(PPSEAAet, "hms")
format time11E %tc
gen ppseaaET= hh(time11E) + mm(time11E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen ppseaaTT=(ppseaaET-ppseaaST)*60
replace ppseaaTT=round(ppseaaTT,.1)
replace ppseaaTT=. if ppseaaTT <0
sum ppseaaTT
tab ppseaaTT

/*TOTAL TIME PREP:Adherence Session*/
*convert Time (Started) of tool to numeric*
gen time12S=clock(M1PASst, "hms")
format time12S %tc
gen m1pasST= hh(time12S) + mm(time12S)/60
*convert Time (Ended) of tool to numeric
gen time12E=clock(M1PASet, "hms")
format time12E %tc
gen m1pasET= hh(time12E) + mm(time12E)/60
*Gen variable: Total Time "BQ: Screening and Enrollment Tool" [and convert to minutes]
gen m1pasTT=(m1pasET-m1pasST)*60
replace m1pasTT=round(m1pasTT,.1)
replace m1pasTT=. if m1pasTT <0
sum m1pasTT
tab m1pasTT
