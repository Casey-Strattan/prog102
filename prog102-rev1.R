library(marinecs100b)

# Extracting data ---------------------------------------------------------

# How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.

# hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
# hotday_end <- as.POSIXct("2018-07-04 00:00:00", tz = "Etc/GMT+8")
# hotday_idx <- kefj_site == hottest_site &
#   kefj_datetime >= hotday_start &
#   kefj_datetime <= hotday_end
# hotday_datetime <- kefj_datetime[hotday_idx]
# hotday_temperature <- kefj_temperature[hotday_idx]
# hotday_exposure <- kefj_exposure[hotday_idx]

# If you want to change the site and date, what variables would need to change?
# You wound need to change "hottest_site"

# What would you pick for the temperature extraction function name and parameter
# names?
#


# Writing extraction functions --------------------------------------------

# Write your temperature extraction function here
site_temperature <- function(site, day) {
  day <- as.POSIXct(day, tz = "Etc/GMT+8")
  day_start <- day
  day_end <- day + 86400
  temp_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  site_temps <- kefj_temperature[temp_idx]
  return(site_temps)
}
# Write your exposure extraction function here
site_exposure <- function(site, day) {
  day <- as.POSIXct(day, tz = "Etc/GMT+8")
  day_start <- day
  day_end <- day + 86400
  exp_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  site_exp <- kefj_exposure[exp_idx]
  return(site_exp)
}
# Write your datetime extraction function here
get_datetimes <- function(site, day) {
  day <- as.POSIXct(day, tz = "Etc/GMT+8")
  day_start <- day
  day_end <- day + 86400
  datetime_idx <- kefj_site == site & kefj_datetime >= day_start & kefj_datetime <= day_end
  datetimes <- kefj_datetime[datetime_idx]
  return(datetimes)
}
# Visualize Nuka Pass temperatures on 2018-07-01
site_temps <- site_temperature("Nuka_Pass", "2012-06-01")
site_datetimes <- get_datetimes("Nuka_Pass", "2012-06-01")
plot(site_datetimes, site_temps)
# How does the visualization code above compare to what you wrote in PROG101?


# Functions within functions (optional) -----------------------------------

# How would you parameterize the visualization code into its own function?
# Specifically, what would you call that function and its parameters?

# Write your wrapper function for plot_kefj(). Call it to compare the
# visualizations for Nuka Pass on July 1, 2018 versus January 1, 2018.
