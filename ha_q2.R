# QUESTION 2

# 1. What is the cancellation rate of each brand and how do they compare? 
# 2. How did they change year-over-year?
# 3. How does it compare between owner type and supplier type? 
# 4. How could we try to decrease the cancellation rate?

# Q2A1 What is the cancellation rate of each brand and how do they compare? 
  
head(data)
names(data)

# SITE A 

cancellation_A <- filter(data, site == 'Site A', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_A$measure_values)

total_net_bookings_A <- filter(data, site == 'Site A', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_A$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_A <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A) <- 'Site A'
site_A


# SITE B

cancellation_B <- filter(data, site == 'Site B', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_B$measure_values)

total_net_bookings_B <- filter(data, site == 'Site B', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_B$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_B <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B) <- 'Site B'
site_B

df_A_B <- rbind('Site A' = site_A, 'Site B' = site_B)
df_A_B

write.csv(df_A_B, file = "q2a1.csv")

q2a1 = read.csv('q2a1.csv')
q2a1


# Q2A2 How did they change year-over-year?

# SITE A
# 2016 

cancellation_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_A_16$measure_values)

total_net_bookings_A_16 <- filter(data, site == 'Site A', year_of_date_id == '2016', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_A_16$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_A_16 <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_16) <- 'Site A 2016'
site_A_16

# 2017 
cancellation_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_A_17$measure_values)

total_net_bookings_A_17 <- filter(data, site == 'Site A', year_of_date_id == '2017', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_A_17$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_A_17 <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_17) <- 'Site A 2017'
site_A_17

df_A_16_17 <- rbind('Site A 2016' = site_A_16, 'Site A 2017' = site_A_17)
df_A_16_17

# SITE B
# 2016

cancellation_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_B_16$measure_values)

total_net_bookings_B_16 <- filter(data, site == 'Site B', year_of_date_id == '2016', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_B_16$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_B_16 <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_16) <- 'Site B 2016'
site_B_16

# 2017 
cancellation_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_B_17$measure_values)

total_net_bookings_B_17 <- filter(data, site == 'Site B', year_of_date_id == '2017', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(total_net_bookings_B_17$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)

site_B_17 <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_17) <- 'Site B 2017'
site_B_17

df_B_16_17 <- rbind('Site B 2016' = site_B_16, 'Site B 2017' = site_B_17)
df_B_16_17

df_A_B_16_17 <- rbind(df_A_16_17, df_B_16_17)
df_A_B_16_17

write.csv(df_A_B_16_17, file = "q2a2.csv")

q2a2 = read.csv('q2a2.csv')
q2a2

# Q2A3 How does it compare between owner type and supplier type? 

# OWNER TYPE - Person Type

## SITE A
data

cancel_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Total Cancellations')
cancellation <- sum(cancel_A_FRBO$measure_values)

tnb_A_FRBO <- filter(data, site == 'Site A', person_type == 'FRBO', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_A_FRBO$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_A_FRBO <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_FRBO) <- 'Site A FRBO'
site_A_FRBO


cancel_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Total Cancellations')
cancellation <- sum(cancel_A_PM$measure_values)

tnb_A_PM <- filter(data, site == 'Site A', person_type == 'PM', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_A_PM$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_A_PM <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_FRBO) <- 'Site A PM'
site_A_PM

df_A_FRBO_PM <- rbind('Site A FRBO' = site_A_FRBO, 'Site A PM' = site_A_PM)
df_A_FRBO_PM


# SITE B

cancel_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Total Cancellations')
cancellation <- sum(cancel_B_FRBO$measure_values)

tnb_B_FRBO <- filter(data, site == 'Site B', person_type == 'FRBO', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_B_FRBO$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_B_FRBO <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_FRBO) <- 'Site B FRBO'
site_B_FRBO


cancel_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Total Cancellations')
cancellation <- sum(cancel_B_PM$measure_values)

tnb_B_PM <- filter(data, site == 'Site B', person_type == 'PM', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_B_PM$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_B_PM <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_FRBO) <- 'Site B PM'
site_B_PM

df_B_FRBO_PM <- rbind('Site B FRBO' = site_B_FRBO, 'Site B PM' = site_B_PM)
df_B_FRBO_PM

df_A_B_FRBO_PM <- rbind(df_A_FRBO_PM, df_B_FRBO_PM)
df_A_B_FRBO_PM

write.csv(df_A_B_FRBO_PM, file = "q2a3.csv")

q2a3 = read.csv('q2a3.csv')
q2a3

# SUPPLIER TYPE - Person Type

## SITE A
data
# Platfrom
cancellation_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_A_platform$measure_values)

tnb_A_platform <- filter(data, site == 'Site A', supplier_type == 'Platform', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_A_platform$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_A_platform <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_platform) <- 'Site A Platform'
site_A_platform

# Integrated 
cancellation_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_A_integrated$measure_values)

tnb_A_integrated <- filter(data, site == 'Site A', supplier_type == 'Integrated', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_A_integrated$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_A_integrated <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_A_integrated) <- 'Site A Integrated'
site_A_integrated

df_A_platfrom_integrated <- rbind('Site A Platfrom' = site_A_platform, 'Site A Integrated' = site_A_integrated)
df_A_platfrom_integrated

# SITE B
# Platfrom
cancellation_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_B_platform$measure_values)

tnb_B_platform <- filter(data, site == 'Site B', supplier_type == 'Platform', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_B_platform$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_B_platform <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_platform) <- 'Site B Platform'
site_B_platform

# Integrated 
cancellation_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Total Cancellations')
cancellation <- sum(cancellation_B_integrated$measure_values)

tnb_B_integrated <- filter(data, site == 'Site B', supplier_type == 'Integrated', measure_names == 'Total Net Bookings')
total_net_bookings <- sum(tnb_B_integrated$measure_values)

percent <- round((cancellation/total_net_bookings)*100,2)
percent

site_B_integrated <- data.frame(cancellation, total_net_bookings, percent)
rownames(site_B_integrated) <- 'Site B Integrated'
site_B_integrated

df_B_platfrom_integrated <- rbind('Site B Platfrom' = site_B_platform, 'Site B Integrated' = site_B_integrated)
df_B_platfrom_integrated


df_A_B_platfrom_integrated <- rbind(df_A_platfrom_integrated, df_B_platfrom_integrated)
df_A_B_platfrom_integrated

write.csv(df_A_B_platfrom_integrated, file = "q2a4.csv")

q2a4 = read.csv('q2a4.csv')
q2a4
