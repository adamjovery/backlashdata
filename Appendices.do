****************************************************************
***Appendix 1: Descriptive Statistics***************************
****************************************************************
***Appendix 1.1: Univariate statistics: dependent variables in replication dataset 
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
xtset country_year
xtsum median_nationalism cog_nationalism median_nat_autarchy cog_nat_autarchy radical_right cog_net_autarky protectionist_left protectionist_right liberal_right pro_trade_left protectionist_left_proper cog_economic_conservatism cog_economic_nationalism

***Appendix 1.2: Univariate statistics: independent variables in replication dataset
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
xtset country_year
xtsum import_shock OldSocPerCap1995 instrument_for_shock instrument_for_shock_all import_shock_eu import_shock_eu15 import_shock_eu12 export_growth fdi_inflow fdi_outflow

***Appendix 1.3: Univariate statistics: variables in collated panel dataset
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
xtset cowcode year
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
xtsum PopVoteShare LeftVoteShare RightVoteShare KOFFiGI ImportPen ImmigrationNum PpsCapSocProc

***Appendix 1.4: Univariate statistics: natural logged variables in collated panel dataset
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
xtset cowcode year
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)
xtsum lnPopVoteShare lnLeftVoteShare lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc

***Appendix 1.5: Histograms of variables in collated panel dataset 
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
histogram PopVoteShare, xline(25.48768) xlabel(25.48768 "Mean") xline(21.7) xmlabel(21.7 "Median")
histogram LeftVoteShare, xline(8.102933) xlabel(8.102933 "Mean") xline(3.7) xmlabel(3.7 "Median")
histogram RightVoteShare, xline(15.10029) xlabel(15.10029 "Mean") xline(12.8) xmlabel(12.8 "Median")
histogram KOFFiGI, xline(80.25412) xlabel(80.25412 "Mean") xline(82.13034) xmlabel(82.13034 "Median")
histogram ImportPen, xline(68.74555) xlabel(68.74555 "Mean") xline(57.27661) xmlabel(57.27661 "Median")
histogram ImmigrationNum, xline(160897.5) xlabel(160897.5 "Mean") xline(71813.5) xmlabel(71813.5 "Median")
histogram PpsCapSocProc, xline(7625.678) xlabel(7625.678 "Mean") xline(6908.125) xmlabel(6908.125 "Median")

***Appendix 1.6: Pairwise correlation for collated panel dataset
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
pwcorr PopVoteShare LeftVoteShare RightVoteShare KOFFiGI ImportPen ImmigrationNum PpsCapSocProc

***Appendix 1.7: Pairwise correlation for natural logged collated panel dataset
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)
pwcorr lnPopVoteShare lnLeftVoteShare lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc

****************************************************************
***Appendix 2: Replication dataset regression tests*************
****************************************************************
***Appendix 2.1: Anderson-Rubin tests - Model (1)
*Tests reported within the regressions
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
tab country_year, gen (CY)

foreach x of varlist median_nationalism cog_nationalism median_nat_autarchy cog_nat_autarchy radical_right {

		reg `x' import_shock OldSocPerCap1995 CY*, cluster(nuts2_year)
		
		ivreg2 `x' OldSocPerCap1995 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

}

***Appendix 2.2: Anderson-Rubin tests - Model (2)
*Tests reported within the regressions
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
tab country_year, gen (CY)

foreach x of varlist cog_net_autarky protectionist_left protectionist_right liberal_right pro_trade_left protectionist_left_proper cog_economic_conservatism cog_economic_nationalism {

		ivreg2 `x' OldSocPerCap1995 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		outreg2 using altTable2.xls, nolabel bracket bdec(3) e(rkf) append

}

***Appendix 2.3: Anderson-Rubin tests - Model (3)
*Tests reported within the regressions
use "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta", clear
replace OldSocPerCap1995 = "." if OldSocPerCap1995 == "…"
destring, replace
tab country_year, gen (CY)

foreach x of varlist cog_nationalism cog_nat_autarchy radical_right  {

		ivreg2 `x' OldSocPerCap1995 CY* (import_shock_all=instrument_for_shock_all), first cluster(nuts2_year)
		
		ivreg2 `x' OldSocPerCap1995 import_shock_eu CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		ivreg2 `x' OldSocPerCap1995 import_shock_eu15 import_shock_eu12 CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

		ivreg2 `x' OldSocPerCap1995 export_growth fdi_inflow fdi_outflow CY* (import_shock=instrument_for_shock), first cluster(nuts2_year)

}

****************************************************************
***Appendix 3: Panel dataset regression tests*******************
****************************************************************
***Appendix 3.1: Variance inflation factors
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
regress lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc
vif
regress lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc
vif
regress lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc
vif

***Appendix 3.2: Modified Wald tests for heteroscedasticity
ssc install xttest3
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
xtset cowcode year
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)

xtreg lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xttest3

xtreg lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xttest3

xtreg lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xttest3

***Appendix 3.3: Wooldridge tests for autocorrelation
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
xtset cowcode year
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)

xtreg lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtserial lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc

xtreg lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtserial lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc

xtreg lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtserial lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc

***Appendix 3.4: Cross-sectional dependencies
*4.9
ssc install xtcd2
use "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", clear
xtset cowcode year
gen lnPopVoteShare = ln(PopVoteShare)
gen lnLeftVoteShare = ln(LeftVoteShare)
gen lnRightVoteShare = ln(RightVoteShare)
gen lnKOFFiGI = ln(KOFFiGI)
gen ImportPen = ImportConPrice/(GdpConPrice + ImportConPrice - ExportConPrice) *100
gen lnImportPen = ln(ImportPen)
gen lnImmigrationNum = ln(ImmigrationNum)
gen lnPpsCapSocProc = ln(PpsCapSocProc)

xtreg lnPopVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtcd2

xtreg lnLeftVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtcd2

xtreg lnRightVoteShare lnKOFFiGI lnImportPen lnImmigrationNum lnPpsCapSocProc,fe
xtcd2