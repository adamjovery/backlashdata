****************************************************************
*Panel data estimation
****************************************************************
*Constructing GDP 2015 prices
import excel "C:\Users\adamj\Documents\UCL Diss\GDP data.xlsx", sheet("Data") firstrow
drop if SeriesName != "GDP (constant 2015 US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR GdpConPrice
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GdpConPrice.dta"
clear

*Constructing GDP current prices
import excel "C:\Users\adamj\Documents\UCL Diss\GDP data.xlsx", sheet("Data") firstrow
drop if SeriesName != "GDP (current US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR GdpCur
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GdpCur.dta"
clear

*Constructing Gross value added 2015 prices
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Gross value added at basic prices (GVA) (constant 2015 US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR GvaConPrice
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GvaConPrice.dta"
clear

*Constructing Gross value added current prices
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Gross value added at basic prices (GVA) (current US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR GvaCur
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GvaCur.dta"
clear

*Constructing Manufacturing value added current prices
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Manufacturing, value added (current US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ManValueCur
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ManValueCur.dta"
clear

*Constructing Merchandise Imports current prices
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Merchandise imports (current US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR MerchImCur
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\MerchImCur.dta"
clear

*Constructing Merchandise Exports current prices
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Merchandise exports (current US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR MerchExCur
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\MerchExCur.dta"
clear

*Constructing Manufacturing Exports percentage
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Manufactures exports (% of merchandise exports)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ManExPer
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ManExPer.dta"
clear


*Constructing Manufacturing Imports percentage
import excel "C:\Users\adamj\Documents\UCL Diss\importpendata.xlsx", sheet("Data") firstrow
drop if SeriesName != "Manufactures imports (% of merchandise imports)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ManImPer
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ManImPer.dta"
clear

*Constructing Imports 2015 prices
import excel "C:\Users\adamj\Documents\UCL Diss\WDI import pen download.xlsx", sheet("Data") firstrow
drop if SeriesName != "Imports of goods and services (constant 2015 US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ImportConPrice
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ImportConPrice.dta"
clear

*Constructing Exports 2015 prices
import excel "C:\Users\adamj\Documents\UCL Diss\WDI import pen download.xlsx", sheet("Data") firstrow
drop if SeriesName != "Exports of goods and services (constant 2015 US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ExportConPrice
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ExportConPrice.dta"
clear

*Constructing Manufacturing Value Added 2015 prices
import excel "C:\Users\adamj\Documents\UCL Diss\WDI import pen download.xlsx", sheet("Data") firstrow
drop if SeriesName != "Manufacturing, value added (constant 2015 US$)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ManValueConPrice
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ManValueConPrice.dta"
clear

*Constructing Imports
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Imports of goods and services (% of GDP)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR Imports
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\Imports.dta"
clear

*Constructing Manufacturing Imports
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Manufactures imports (% of merchandise imports)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ManufacturingImports
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ManufacturingImports.dta"
clear

*Constructing Imports constant currency
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators_v2.xlsx", sheet("Data") firstrow
drop if SeriesName != "Imports of goods and services (constant 2015 US$)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR CurImports
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\CurImports.dta"
clear

*Constructing Imports BoP
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators_v2.xlsx", sheet("Data") firstrow
drop if SeriesName != "Imports of goods and services (BoP, current US$)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR BoPImports
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\BoPImports.dta"
clear

*Constructing Imports annual % growth
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators_v2.xlsx", sheet("Data") firstrow
drop if SeriesName != "Imports of goods and services (annual % growth)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR ImportsGrowth
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ImportsGrowth.dta"
clear

*Constructing Unemployment %
import excel "C:\Users\adamj\Documents\UCL Diss\P_Data_Extract_From_World_Development_Indicators_v2.xlsx", sheet("Data") firstrow
drop if SeriesName != "Unemployment, total (% of total labor force) (national estimate)"

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR Unemployment
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\Unemployment.dta"
clear


*Constructing Tariffs (All/Simple)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, simple mean, all products (%)" 
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR SimAllTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\SimAllTariff.dta"
clear

*Constructing Tariffs (Manufactured/Simple)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, simple mean, manufactured products (%)" 
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR SimManTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\SimManTariff.dta"
clear

*Constructing Tariffs (PrimaryProducts/Simple)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, simple mean, primary products (%)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR SimPriTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\SimPriTariff.dta"
clear

*Constructing Tariffs (All/Weighted)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, weighted mean, all products (%)" 
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR WeightAllTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\WeightAllTariff.dta"
clear

*Constructing Tariffs (Manufactured/Weighted)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, weighted mean, manufactured products (%)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR WeightManTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\WeightManTariff.dta"
clear

*Constructing Tariffs (PrimaryProducts/Weighted)
import excel "C:\Users\adamj\Documents\UCL Diss\tariff_Data_Extract_From_World_Development_Indicators.xlsx", sheet("Data") firstrow
drop if SeriesName != "Tariff rate, applied, weighted mean, primary products (%)"
gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR WeightPriTariff
rename CountryName country
rename CountryCode countrycode
drop SeriesCode
drop SeriesName
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\WeightPriTariff.dta"
clear

*Constructing Social Protection as a percentage of GDP
import excel "C:\Users\adamj\Documents\UCL Diss\tps00098_page_spreadsheet.xlsx", sheet("Data") cellrange(A10:Y53) firstrow
drop C E G I K M O Q S U W Y
rename B YR2013
rename D YR2014
rename F YR2015
rename H YR2016
rename J YR2017
rename L YR2018
rename N YR2019
rename P YR2020
rename R YR2021
rename T YR2022
rename V YR2023
rename X YR2024

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ":"
destring, replace
rename YR GdpSocProc
rename GEOLabels country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GdpSocProc.dta",replace
clear

*Constructing Social Protection per capita at constant prices
import excel "C:\Users\adamj\Documents\UCL Diss\tps00099_page_spreadsheet.xlsx", sheet("Data") cellrange(A10:Y53) firstrow
drop C E G I K M O Q S U W Y
rename B YR2013
rename D YR2014
rename F YR2015
rename H YR2016
rename J YR2017
rename L YR2018
rename N YR2019
rename P YR2020
rename R YR2021
rename T YR2022
rename V YR2023
rename X YR2024

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ":"
destring, replace
rename YR ConCapSocProc
rename GEOLabels country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\ConCapSocProc.dta"
clear

*Constructing Social Protection per capita at PPS
import excel "C:\Users\adamj\Documents\UCL Diss\tps00100_page_spreadsheet.xlsx", sheet("Data") cellrange(A10:Y53) firstrow
drop C E G I K M O Q S U W Y
rename B YR2013
rename D YR2014
rename F YR2015
rename H YR2016
rename J YR2017
rename L YR2018
rename N YR2019
rename P YR2020
rename R YR2021
rename T YR2022
rename V YR2023
rename X YR2024

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ":"
destring, replace
rename YR PpsCapSocProc
rename GEOLabels country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\PpsCapSocProc.dta"
clear

*Constructing Populism vote share
import excel "C:\Users\adamj\Documents\UCL Diss\API-2024.xlsx",sheet("Populism vote share") cellrange(A1:CQ32) firstrow
keep A BQ BR BS BT BU BV BW BX BY BZ CA
rename BQ YR2013
rename BR YR2014
rename BS YR2015
rename BT YR2016
rename BU YR2017
rename BV YR2018
rename BW YR2019
rename BX YR2020
rename BY YR2021
rename BZ YR2022
rename CA YR2023

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR PopVoteShare
rename A country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\PopVoteShare.dta"
clear

*Constructing Radical right vote share
import excel "C:\Users\adamj\Documents\UCL Diss\API-2024.xlsx",sheet("Radical Right") cellrange(A1:CQ32) firstrow
keep A BQ BR BS BT BU BV BW BX BY BZ CA
rename BQ YR2013
rename BR YR2014
rename BS YR2015
rename BT YR2016
rename BU YR2017
rename BV YR2018
rename BW YR2019
rename BX YR2020
rename BY YR2021
rename BZ YR2022
rename CA YR2023

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR RightVoteShare
rename A country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\RightVoteShare.dta"
clear

*Constructing Radical left vote share
import excel "C:\Users\adamj\Documents\UCL Diss\API-2024.xlsx",sheet("Radical left") cellrange(A1:CQ32) firstrow
keep A BQ BR BS BT BU BV BW BX BY BZ CA
rename BQ YR2013
rename BR YR2014
rename BS YR2015
rename BT YR2016
rename BU YR2017
rename BV YR2018
rename BW YR2019
rename BX YR2020
rename BY YR2021
rename BZ YR2022
rename CA YR2023

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ".."
destring, replace
rename YR LeftVoteShare
rename A country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\LeftVoteShare.dta"
clear

*Constructing immigration
import excel "C:\Users\adamj\Documents\UCL Diss\tps00176_page_spreadsheet.xlsx", sheet("Sheet 1") cellrange(A18:Y75)
drop C E G I K M O Q S U W Y
rename B YR2013
rename D YR2014
rename F YR2015
rename H YR2016
rename J YR2017
rename L YR2018
rename N YR2019
rename P YR2020
rename R YR2021
rename T YR2022
rename V YR2023
rename X YR2024

gen id = _n
order id
reshape long YR , i(id) j(year)
replace YR = "." if YR == ":"
destring, replace
rename YR ImmigrationNum
rename A country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
destring, replace
save "C:\Users\adamj\Documents\UCL Diss\ImmigrationNum.dta", replace
clear

*Contructing inequality (Gini)
import excel "C:\Users\adamj\Documents\UCL Diss\API_SI.POV.GINI_DS2_en_excel_v2_34566.xls", sheet("Data") cellrange(A4:BR269) firstrow
keep CountryName BF BG BH BI BJ BK BL BM BN BO BP 
rename BF YR2013
rename BG YR2014
rename BH YR2015
rename BI YR2016
rename BJ YR2017
rename BK YR2018
rename BL YR2019
rename BM YR2020
rename BN YR2021
rename BO YR2022
rename BP YR2023
gen id = _n
order id
reshape long YR , i(id) j(year)
destring, replace
rename YR GiniCoef
rename CountryName country
drop id

do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
save "C:\Users\adamj\Documents\UCL Diss\GiniCoef.dta"
clear

*Capital openness index
use "C:\Users\adamj\Documents\UCL Diss\kaopen_2023.dta"
do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
drop cn
save "C:\Users\adamj\Documents\UCL Diss\CapitalOpenness.dta"
clear

*KOF index of globalisation
import excel "C:\Users\adamj\Documents\UCL Diss\KOFGI_2025_public.xlsx", sheet("Sheet1") firstrow
do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
keep KOFGI year cowcode
save "C:\Users\adamj\Documents\UCL Diss\GlobalisationIndex.dta"
clear

*KOF index of financial globalisation
import excel "C:\Users\adamj\Documents\UCL Diss\KOFGI_2025_public.xlsx", sheet("Sheet1") firstrow
do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
keep KOFFiGI year cowcode
save "C:\Users\adamj\Documents\UCL Diss\FinancialGlobalisationIndex.dta"
clear

*Human Capital Index
use "C:\Users\adamj\Documents\UCL Diss\pwt1001.dta"
do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"
do "C:\Users\adamj\Documents\UCL Diss\Dataset Pruning Do.do"
keep hc year cowcode
save "C:\Users\adamj\Documents\UCL Diss\HumanCapitalIndex.dta"
clear

***************************************************************
*Colantone and Stanig replication/alteration
***************************************************************

*Constructing social protection dataset for 1989 to 2005
import excel "C:\Users\adamj\Documents\UCL Diss\olddata.xlsx", sheet("Sheet3") firstrow

rename Totalsocialprotectionexpendit OldSocPerGdp
rename E OldSocPerCap
rename F OldSocPerCap1995

drop if (OldSocPerGdp == "…") & (OldSocPerCap == "…" ) & (OldSocPerCap1995 == "…") 
save "C:\Users\adamj\Documents\UCL Diss\OldSocProc.dta"
clear

*Cleaning replication dataset from Colantone and Stanig
use "C:\Users\adamj\Documents\UCL Diss\Analysis_Dataset_District_Level.dta"
do "C:\Users\adamj\Documents\UCL Diss\Dataset COW codes Do.do"

merge m:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\OldSocProc.dta"
drop if (OldSocPerGdp == "") & (OldSocPerCap == "" ) & (OldSocPerCap1995 == "") 
merge m:1 cowcode year using "C:\Users\adamj\Documents\UCL Diss\OldNetMigration.dta"
save "C:\Users\adamj\Documents\UCL Diss\ModifiedReplication.dta"
clear
