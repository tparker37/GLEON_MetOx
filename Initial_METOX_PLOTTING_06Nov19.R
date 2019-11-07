# Ryan McClure
# updated 06Nov19
# open to edit

if (!require("pacman")) install.packages("pacman")

#pacman is super useful for projects because it will automatically download the packages
#from CRAN if a user of this script does not have a specific package on their computer.

pacman::p_load(tidyverse) #... List other packages of interest here (e.g. stat packages etc.)


### Read in the .csv files
dat1 <- read_csv("OPE_STE_BLU_TIE_GFU_SRO_gas.csv")
dat2 <- read_csv("ERK_ITA_ALX.csv")
dat3 <- read_csv("LUN_CRO_OTS_BUF_LCA_MYV_gas.csv")

#bind it all together into one data frame for plotting
dat_all <- rbind(dat1, dat2, dat3)

### Compare the spatial differences in CH4 isotopes and concentration
# this stems from the main concept from the TDS paper. 
ggplot(dat_all, aes(location, iso.CH4.insitu, color = as.factor(campaign)))+
  geom_point(aes(color = as.factor(campaign)), size = 4)+
  facet_wrap(~lakename)

ggplot(dat_all, aes(location, conc.CH4.insitu, group = lakename, color = as.factor(campaign)))+
  geom_point(aes(color = as.factor(campaign)), size = 4)+
  facet_wrap(~lakename)


# Isotope CH4  boxplots of all the currently analyzed lakes 
ggplot(dat_all, aes(lakename, iso.CH4.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

# CH4 concentraion boxplots of all the currently analyuzed lakes 
ggplot(dat_all, aes(lakename, conc.CH4.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

### !!! SAme can be done for CO2. Just copy the scripts above and replace .CH4. with .CO2.

# compare across campaigns with all current lakes included... Is there substantial 
# differences in the isotopic CH4 signal during early season stratification compared to 
# middle and late stratification?
ggplot(dat_all, aes(campaign, iso.CH4.insitu, group = campaign, fill = as.factor(campaign)))+
  geom_boxplot(color = "black")

# compare across campaigns with all current lakes included... Is there substantial 
# differences in the CH4 concentration signal during early season stratification compared to 
# middle and late stratification?
ggplot(dat_all, aes(campaign, conc.CH4.insitu, group = campaign, fill = as.factor(campaign)))+
  geom_boxplot(color = "black", outlier.size = -1)+ ### removed outliers for viewing purposes
  ylim(c(0,3))

#Neither campaign comparisons are significantly different. However, The fact the 13CH4 signal is lighter in the 
#spring as concentration is higher while the signature is heavier during late stratification is neat.







