
if (!require("pacman")) install.packages("pacman")

pacman::p_load(tidyverse) #... List other packages of interest here (e.g. stat packages etc.)


### Read in the .csv files
dat1 <- read_csv("OPE_STE_BLU_TIE_GFU_SRO_gas.csv")
dat2 <- read_csv("ERK_ITA_ALX.csv")
dat3 <- read_csv("LUN_CRO_OTS_BUF_LCA_MYV_gas.csv")

#bind it all together into one data frame for plotting ease
dat_all <- rbind(dat1, dat2, dat3)


ggplot(dat_all, aes(lakename, iso.CH4.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

ggplot(dat_all, aes(lakename, conc.CH4.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

ggplot(dat_all, aes(lakename, iso.CO2.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

ggplot(dat_all, aes(lakename, conc.CO2.insitu, group = lakename, fill = lakename))+
  geom_boxplot(color = "black")+
  geom_point(aes(color = as.factor(campaign)), size = 4)

ggplot(dat_all, aes(location, iso.CH4.insitu, group = lakename, color = as.factor(campaign)))+
  geom_point(aes(color = as.factor(campaign)), size = 4)+
  facet_wrap(~lakename)

ggplot(dat_all, aes(location, conc.CH4.insitu, group = lakename, color = as.factor(campaign)))+
  geom_point(aes(color = as.factor(campaign)), size = 4)+
  facet_wrap(~lakename)
