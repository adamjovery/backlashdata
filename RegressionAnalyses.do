****************************************************************
*Replication Dataset - Model (1), (2), and (3)
****************************************************************
*Installing necessary modules
ssc install ivreg2
ssc install ranktest

*Importing replication dataset
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
tab country_year, gen (CY)

*Altered Table 1, OLS and IV regressions Model (1)

foreach x of varlist median_nationalism cog_nationalism median_nat_autarchy cog_nat_autarchy radical_right {

		reg `x' import_shock OldSocPerCap1995 CY*, cluster(nuts2_year)
		
		outreg2 using altTable1.xls, nolabel bracket bdec(3) e(rkf) 

		ivreg2 `x' OldSocPerCap1995 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable1.xls, nolabel bracket bdec(3)  e(rkf) append

}

*Altered Table 2, IV regressions additional outcomes Model (2)

foreach x of varlist cog_net_autarky protectionist_left protectionist_right liberal_right pro_trade_left protectionist_left_proper cog_economic_conservatism cog_economic_nationalism {

		ivreg2 `x' OldSocPerCap1995 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable2.xls, nolabel bracket bdec(3) e(rkf) append

}

*Altered Table 3, IV regressions alternate instrumental variables Model (3)

foreach x of varlist cog_nationalism cog_nat_autarchy radical_right  {

		ivreg2 `x' OldSocPerCap1995 CY* (import_shock_all=instrument_for_shock_all), first cluster(nuts2_year)

		outreg2 using altTable3.xls, nolabel bracket bdec(3) e(rkf) 
		
		
		ivreg2 `x' OldSocPerCap1995 import_shock_eu CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable3.xls, nolabel bracket bdec(3) e(rkf) append

		
		ivreg2 `x' OldSocPerCap1995 import_shock_eu15 import_shock_eu12 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable3.xls, nolabel bracket bdec(3) e(rkf) append

		
		ivreg2 `x' OldSocPerCap1995 export_growth fdi_inflow fdi_outflow CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable3.xls, nolabel bracket bdec(3) e(rkf) append

}

*****************************************************************
*Panel Dataset - Model (4) and (5)
*****************************************************************
*Importing panel dataset
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear

*Setting panel data
xtset cowcode year

*Generating natural logged variables
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)


***Fixed effects - Model (4)*************************************
xtreg lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum, fe robust
xtreg lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum, fe robust
xtreg lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum, fe robust

***Fixed effects with social protection - Model (5)**************
xtreg lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc, fe robust
xtreg lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc, fe robust
xtreg lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc, fe robust
