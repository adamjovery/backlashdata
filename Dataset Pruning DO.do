*checking for countries or times outside the scope of my research and dropping them if so
replace country= "delete" if (cowcode!= 310) & (cowcode!= 325) & (cowcode!= 220) & (cowcode!= 350) & (cowcode!= 290) & (cowcode!= 316) & (cowcode!= 360) & (cowcode!= 210) & (cowcode!= 352) & (cowcode!= 317) & (cowcode!= 349) & (cowcode!= 367) & (cowcode!= 225) & (cowcode!= 205) & (cowcode!= 380) & (cowcode!= 230) & (cowcode!= 211) & (cowcode!= 375) & (cowcode!= 390) & (cowcode!= 305) & (cowcode!= 395) & (cowcode!= 368) & (cowcode!= 355) & (cowcode!= 255) & (cowcode!= 366) & (cowcode!= 385) & (cowcode!= 344) & (cowcode!= 212) & (cowcode!= 235) & (cowcode!= 200) & (cowcode!= 338)


replace country= "delete" if (year!= 2013) & (year!= 2014) & (year!= 2015) & (year!= 2016) & (year!= 2017) & (year!= 2018) & (year!= 2019) & (year!= 2020) & (year!= 2021) & (year!= 2022) & (year!= 2023) & (year!= 2024)

drop if country== "delete"
sort cowcode year