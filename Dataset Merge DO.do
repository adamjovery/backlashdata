*import master dataset
use "C:\Users\adamj\Documents\UCL Diss\Imports.dta"

*merge each dataset into the master
merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ManufacturingImports.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\CurImports.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\BoPImports.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ImportsGrowth.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\Unemployment.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\SimAllTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\SimManTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\SimPriTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\WeightAllTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\WeightManTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\WeightPriTariff.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GdpSocProc.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ConCapSocProc.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\PpsCapSocProc.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\PopVoteShare.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\RightVoteShare.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\LeftVoteShare.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ImmigrationNum.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GiniCoef.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\CapitalOpenness.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GlobalisationIndex.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\FinancialGlobalisationIndex.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\HumanCapitalIndex.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ImportConPrice.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ExportConPrice.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ManValueConPrice.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ManValueCur.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ManImPer.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\ManExPer.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\MerchImCur.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\MerchExCur.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GvaConPrice.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GvaCur.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GdpConPrice.dta", nogenerate

merge 1:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\GdpCur.dta", nogenerate

*save completed dataset for use in regression analyses
save "C:\Users\adamj\Documents\UCL Diss\FinalDataset.dta", replace
clear