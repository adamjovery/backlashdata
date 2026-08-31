*checking for countries or times outside the scope of my research and dropping them if so
replace country= "delete" if (cowcode != 305) & (cowcode!= 211) & (cowcode!= 390) & (cowcode!= 375) & (cowcode!= 220) & (cowcode!= 255) & (cowcode!= 350) & (cowcode!= 205) & (cowcode!= 325) & (cowcode!= 212) & (cowcode!= 210) & (cowcode!= 235) & (cowcode!= 230) & (cowcode!= 380) & (cowcode!= 200)

replace country= "delete" if (year!= 1988) & (year!= 1989) & (year!= 1990) & (year!= 1991) & (year!= 1992) & (year!= 1993) & (year!= 1994) & (year!= 1995) & (year!= 1996) & (year!= 1997) & (year!= 1998) & (year!= 1999) & (year!= 2000) & (year!= 2001) & (year!= 2002) & (year!= 2003) & (year!= 2004) & (year!= 2005) & (year!= 2006) & (year!= 2007)


drop if country== "delete"
sort cowcode year