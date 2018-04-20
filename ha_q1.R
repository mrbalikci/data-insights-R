# use appropirate library
library(tidyverse)
library(data.table)

# check the directory and files
getwd()
dir()

# read csv data 
data <- read_csv("home_away_data.csv")
data
# look up some basic information of the data
head(data)
# column names
names(data)


##  1. What is booking conversion and inquiry conversion for each site?  
##  2. How do they compare year-over-year and to each other? 
##  3. How does it compare between owner type and supplier type?  
##  4. What do you think we could do to move travelers from inquiries to bookings?

unique(data['measure_names'])

total_net_bookings_a <- filter(data, site == 'Site A', measure_names == 'Total Net Bookings')
total_net_bookings_a

total_net_bookings <- sum(total_net_bookings_a$measure_values)

inquiries_a <- filter(data, site == 'Site A', measure_names == 'Inquiries')
inquiries <- sum(inquiries_a$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)

site_a <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_a) <- 'Site A'
site_a

total_net_bookings_b <- filter(data, site == 'Site B', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_b$measure_values)

inquiries_b <- filter(data, site == 'Site B', measure_names == 'Inquiries')
inquiries <- sum(inquiries_b$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)

site_b <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_b) <- 'Site B'
site_b

df_a_b <- rbind('Site A' = site_a, 'Site B' = site_b)
df_a_b

typeof(df_a_b)

write.csv(df_a_b, file = "q1a1.csv")

q1a1 = read.csv('q1a1.csv')
q1a1


# How do they compare year-over-year and to each other?

## SITE A

tnb_s_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_16$measure_values)

inq_s_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_16$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_a_16 <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_a_16) <- 'Site A'
site_a_16

tnb_s_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_17$measure_values)

inq_s_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_17$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent


site_a_17 <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_a_17) <- 'Site A'
site_a_17

df_a_16_17 <- rbind('Site A 2016' = site_a_16, 'Site A 2017' = site_a_17)
df_a_16_17

## SITE B 

tnb_s_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_16$measure_values)

inq_s_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_16$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_B_16 <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_16) <- 'Site B'
site_B_16

tnb_s_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_17$measure_values)

inq_s_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_17$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent


site_B_17 <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_17) <- 'Site B'
site_B_17

df_B_16_17 <- rbind('Site B 2016' = site_B_16, 'Site B 2017' = site_B_17)
df_B_16_17

df_A_B_16_17 <- rbind(df_a_16_17, df_B_16_17)
df_A_B_16_17

write.csv(df_A_B_16_17, file = "q1a2.csv")

q1a2 = read.csv('q1a2.csv')
q1a2

##  Q1A3. How does it compare between owner type and supplier type? 

# OWNER TYPE - Person Type

## SITE A
data

tnb_s_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_FRBO$measure_values)

inq_s_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_FRBO$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_A_FRBO <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_a_FRBO) <- 'Site A FRBO'
site_A_FRBO

tnb_s_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_PM$measure_values)

inq_s_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_PM$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent


site_A_PM <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_A_PM) <- 'Site A PM'
site_A_PM

df_A_FRBO_PM <- rbind('Site A FRBO' = site_A_FRBO, 'Site A PM' = site_A_PM)
df_A_FRBO_PM

# SITE B

tnb_s_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_FRBO$measure_values)

inq_s_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_FRBO$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_B_FRBO <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_FRBO) <- 'Site B FRBO'
site_B_FRBO

tnb_s_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_PM$measure_values)

inq_s_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_PM$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_B_PM <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_PM) <- 'Site B PM'
site_B_PM

df_B_FRBO_PM <- rbind('Site B FRBO' = site_B_FRBO, 'Site B PM' = site_B_PM)
df_B_FRBO_PM

df_A_B_FRBO_PM <- rbind(df_A_FRBO_PM, df_B_FRBO_PM)
df_A_B_FRBO_PM

write.csv(df_A_B_FRBO_PM, file = "q1a3.csv")

q1a3 = read.csv('q1a3.csv')
q1a3

# SUPPLIER TYPE - Person Type

## SITE A
data
# Platfrom
tnb_s_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_platform$measure_values)

inq_s_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_platform$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_A_platform <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_A_platform) <- 'Site A Platform'
site_A_platform

# Integrated 
tnb_s_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_A_integrated$measure_values)

inq_s_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Inquiries')
inquiries <- sum(inq_s_A_integrated$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_A_integrated <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_A_integrated) <- 'Site A Integrated'
site_A_integrated

df_A_platfrom_integrated <- rbind('Site A Platfrom' = site_A_platform, 'Site A Integrated' = site_A_integrated)
df_A_platfrom_integrated

# SITE B
# Platfrom
tnb_s_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_platform$measure_values)

inq_s_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_platform$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_B_platform <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_platform) <- 'Site B Platform'
site_B_platform

# Integrated 
tnb_s_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_s_B_integrated$measure_values)

inq_s_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Inquiries')
inquiries <- sum(inq_s_B_integrated$measure_values)

percent <- round((total_net_bookings/inquiries)*100,2)
percent

site_B_integrated <- data.frame(total_net_bookings, inquiries, percent)
rownames(site_B_integrated) <- 'Site B Integrated'
site_B_integrated

df_B_platfrom_integrated <- rbind('Site B Platfrom' = site_B_platform, 'Site B Integrated' = site_B_integrated)
df_B_platfrom_integrated

df_A_B_platfrom_integrated <- rbind(df_A_platfrom_integrated, df_B_platfrom_integrated)
df_A_B_platfrom_integrated

write.csv(df_A_B_platfrom_integrated, file = "q1a4.csv")

q1a4 = read.csv('q1a4.csv')
q1a4
