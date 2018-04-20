
# 1. What is the take rate for each brand and how does that compare year-over-year? 
# 2. How does it compare between owner type and supplier type?  
# 3. How could we go about increasing this percentage along with any potential risks to doing so?
  
# Take Rate = (Transactional Sales) / (Gross Booking Value)

data
head(data)
names(data)

# What is the take rate for EACH BRAND and how does that compare year-over-year? 

# SITE A 

trans_sales_A <- filter(data, site == 'Site A', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A$measure_values)

gross_booking_A <- filter(data, site == 'Site A', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A$measure_values)

percent <- round((transactional_sales/gross_booking_value_A)*100,2)

site_A <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A) <- 'Site A'
site_A

# SITE B

trans_sales_B <- filter(data, site == 'Site B', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B$measure_values)

gross_booking_B <- filter(data, site == 'Site B', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B$measure_values)

percent <- round((transactional_sales/gross_booking_value_B)*100,2)

site_B <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B) <- 'Site B'
site_B

df_site_A_B <- rbind('Site A' = site_A, 'Site B' = site_B)
df_site_A_B

write.csv(df_site_A_B, file = "q3a1.csv")

q3a1 = read.csv('q3a1.csv')
q3a1

# 1. What is the take rate for each brand and how does that compare YEAR-OVER-YEAR? 

# 2016 SITE A 
trans_sales_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_16$measure_values)

gross_booking_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_16$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_A_16 <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_16) <- 'Site A 2016'
site_A_16

# 2017 SITE A 
trans_sales_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_17$measure_values)

gross_booking_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_17$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_A_17 <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_17) <- 'Site A 2017'
site_A_17

df_site_A_16_17 <- rbind('Site A 2016' = site_A_16, 'Site A 2017' = site_A_17)
df_site_A_16_17


# 2016 SITE B 
trans_sales_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_16$measure_values)

gross_booking_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_16$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_B_16 <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_16) <- 'Site B 2016'
site_B_16

# 2017 SITE B
trans_sales_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_17$measure_values)

gross_booking_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_17$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_B_17 <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_17) <- 'Site B 2017'
site_B_17

df_site_B_16_17 <- rbind('Site B 2016' = site_B_16, 'Site B 2017' = site_B_17)
df_site_B_16_17


df_site_A_B_16_17 <- rbind(df_site_A_16_17, df_site_B_16_17)
df_site_A_B_16_17


write.csv(df_site_A_B_16_17, file = "q3a2.csv")

q3a2 = read.csv('q3a2.csv')
q3a2

# How does it compare between owner type and supplier type? 

# OWNER TYPE 
# SITE A
# FRBO

trans_sales_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_FRBO$measure_values)

gross_booking_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_FRBO$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_A_FRBO <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_FRBO) <- 'Site A FRBO'
site_A_FRBO

# PM
trans_sales_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_PM$measure_values)

gross_booking_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_PM$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_A_PM <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_PM) <- 'Site A PM'
site_A_PM

df_Site_A_FRBO_PM <- rbind('Site A FRBO' = site_A_FRBO, 'Site A PM' = site_A_PM)
df_Site_A_FRBO_PM

# SITE B 
# FRBO

trans_sales_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_FRBO$measure_values)

gross_booking_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_FRBO$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_B_FRBO <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_FRBO) <- 'Site B FRBO'
site_B_FRBO

# PM
trans_sales_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_PM$measure_values)

gross_booking_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_PM$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)

site_B_PM <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_PM) <- 'Site B PM'
site_B_PM

df_Site_B_FRBO_PM <- rbind('Site B FRBO' = site_B_FRBO, 'Site B PM' = site_B_PM)
df_Site_B_FRBO_PM

df_Site_A_B_FRBO_PM <- rbind(df_Site_A_FRBO_PM, df_Site_B_FRBO_PM)
df_Site_A_B_FRBO_PM

write.csv(df_Site_A_B_FRBO_PM, file = "q3a3.csv")

q3a3 = read.csv('q3a3.csv')
q3a3

# SUPPLIER TYPE - Person Type

## SITE A
# Platfrom
trans_sales_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_platform$measure_values)

gross_booking_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_platform$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)
percent

site_A_platform <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_platform) <- 'Site A Platform'
site_A_platform

# Integrated

trans_sales_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_A_integrated$measure_values)

gross_booking_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_A_integrated$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)
percent

site_A_integrated <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_A_integrated) <- 'Site A Integrated'
site_A_integrated

df_A_platfrom_integrated <- rbind('Site A Platfrom' = site_A_platform, 'Site A Integrated' = site_A_integrated)
df_A_platfrom_integrated

# SITE B 

# Platfrom
trans_sales_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_platform$measure_values)

gross_booking_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_platform$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)
percent

site_B_platform <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_platform) <- 'Site B Platform'
site_B_platform

# Integrated

trans_sales_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Transactional Sales')
transactional_sales <- sum(trans_sales_B_integrated$measure_values)

gross_booking_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Gross Booking Value')
gross_booking_value <- sum(gross_booking_B_integrated$measure_values)

percent <- round((transactional_sales/gross_booking_value)*100,2)
percent

site_B_integrated <- data.frame(transactional_sales, gross_booking_value, percent)
rownames(site_B_integrated) <- 'Site B Integrated'
site_B_integrated

df_B_platfrom_integrated <- rbind('Site B Platfrom' = site_B_platform, 'Site B Integrated' = site_B_integrated)
df_B_platfrom_integrated


df_A_B_platfrom_integrated <- rbind(df_A_platfrom_integrated, df_B_platfrom_integrated)
df_A_B_platfrom_integrated

write.csv(df_A_B_platfrom_integrated, file = "q3a4.csv")

q3a4 = read.csv('q3a4.csv')
q3a4
