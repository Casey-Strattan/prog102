library(marinecs100b)


# Writing a utility function ----------------------------------------------

# P1: How did you extract the temperature and exposure from the hottest day?
# Copy-paste the code here.

# hotday_start <- as.POSIXct("2018-07-03 00:00:00", tz = "Etc/GMT+8")
# hotday_end <- as.POSIXct("2018-07-04 00:00:00", tz = "Etc/GMT+8")
# hotday_idx <- kefj_site == hottest_site &
#   kefj_datetime >= hotday_start &
#   kefj_datetime <= hotday_end
# hotday_datetime <- kefj_datetime[hotday_idx]
# hotday_temperature <- kefj_temperature[hotday_idx]
# hotday_exposure <- kefj_exposure[hotday_idx]

# P2: Fill in the blanks below to write the Alaskan datetime utility function.
make_datetime <- function(day) {
  day <- as.POSIXct(day, tz = "Etc/GMT+8")
  return(day)
}
# Extracting data ---------------------------------------------------------

# P3: Make a copy of your code from P1 and edit it to plot the temperature and
# exposure for "Aialik" on 2012-06-01

site <- "Aialik"
day_start <- as.POSIXct("2016-06-01 00:00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2016-06-02 00:00:00", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= day_start &
  kefj_datetime <= day_end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P4: Make a copy of your code from P3 and edit it to plot the temperature and
# exposure for "Harris" on 2016-04-05.

site <- "Harris"
day_start <- as.POSIXct("2016-04-05 00:00:00", tz = "Etc/GMT+8")
day_end <- as.POSIXct("2016-04-06 00:00:00", tz = "Etc/GMT+8")
day_idx <- kefj_site == site &
  kefj_datetime >= day_start &
  kefj_datetime <= day_end
day_datetime <- kefj_datetime[day_idx]
day_temperature <- kefj_temperature[day_idx]
day_exposure <- kefj_exposure[day_idx]
plot_kefj(day_datetime, day_temperature, day_exposure)

# P5: Compare your solutions for P3 and P4 - what variables changed?

#Site, day start, day end

# P6: What you would pick for the temperature extraction function and
# parameters' names?

# Extract temp, site, datetime_start, datetime_end.

# Writing extraction functions --------------------------------------------

# P7: Fill in the blanks in the code below to write your temperature extraction
# function.

extract_temp <- function(site, datetime_start, datetime_end) {
  datetime_start <- make_datetime(datetime_start)
  datetime_end <- make_datetime(datetime_end)
  temp_idx <- kefj_site == site & kefj_datetime >= datetime_start & kefj_datetime <= datetime_end
  site_temp <- kefj_temperature[temp_idx]
  return(site_temp)
}

# P8: Make a copy of your solution to P7, and edit it to create exposure and
# datetime extraction functions.

extract_exp <- function(site, datetime_start, datetime_end) {
  datetime_start <- make_datetime(datetime_start)
  datetime_end <- make_datetime(datetime_end)
  exp_idx <- kefj_site == site & kefj_datetime >= datetime_start & kefj_datetime <= datetime_end
  site_exp <- kefj_exposure[exp_idx]
  return(site_exp)
}

extract_times <- function(site, datetime_start, datetime_end) {
  datetime_start <- get_datetime(datetime_start)
  datetime_end <- get_datetime(datetime_end)
  datetime_idx <- kefj_site == site & kefj_datetime >= datetime_start & kefj_datetime <= datetime_end
  datetimes <- kefj_datetime[datetime_idx]
  return(datetimes)
}

# P9: Export your annotated screenshot as a JPEG called "annotated_function.jpg"
# and add it to your copy of the module repository. (It should be in the same
# folder as this file.)

# P10: Visualize Nuka Pass on July 1, 2018.

Nuka_Pass_temps <- extract_temp("Nuka_Pass", "2018-07-01", "2018-07-03")
Nuka_Pass_exps <- extract_exp("Nuka_Pass", "2018-07-01", "2018-07-03")
Nuka_Pass_times <- extract_times("Nuka_Pass", "2018-07-01", "2018-07-03")
plot_kefj(Nuka_Pass_times, Nuka_Pass_temps, Nuka_Pass_exps)

# P11: Save a copy of the Nuka Pass plot as "nuka_pass_2018-07-01.png" in this
# repo

# P12: Compare the code you wrote to create the plot in this module to the code
# you wrote in PROG101. Qualitatively, how do they compare? Which one is easier
# to read and why?

# This code is better because its easier to read and more concise. That makes this
# code easier to understand, debug, etc.
