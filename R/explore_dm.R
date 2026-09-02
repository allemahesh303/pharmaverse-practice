# explore_dm.R ---------------------------------------------------------------
#
# A first look at the SDTM Demographics (DM) domain from {pharmaversesdtm}.
#
# Run it with:   source("R/explore_dm.R")
# (Run source("install_packages.R") once first if the libraries are missing.)
# --------------------------------------------------------------------------

library(pharmaversesdtm)
library(dplyr)

# Load the CDISC pilot Demographics dataset. This is an ordinary data frame.
data("dm")

message("DM has ", nrow(dm), " rows and ", ncol(dm), " columns.\n")

# --- 1. How many subjects are in each treatment arm? ----------------------
subjects_by_arm <- dm |>
  count(ARM, name = "n_subjects") |>
  arrange(desc(n_subjects))

cat("Subjects by treatment arm\n")
cat("-------------------------\n")
print(subjects_by_arm)
cat("\n")

# --- 2. Age summary within each arm --------------------------------------
age_by_arm <- dm |>
  group_by(ARM) |>
  summarise(
    n        = n(),
    mean_age = round(mean(AGE, na.rm = TRUE), 1),
    min_age  = min(AGE, na.rm = TRUE),
    max_age  = max(AGE, na.rm = TRUE),
    .groups  = "drop"
  )

cat("Age summary by treatment arm\n")
cat("----------------------------\n")
print(age_by_arm)
cat("\n")


# ============================  YOUR TURN  ============================
#
# Add ONE more summary of the `dm` data below, then run the script again.
#
# Pick whichever appeals to you (or invent your own):
#
#   (a) Sex distribution by arm:
#         count subjects by ARM and SEX, or use tidyr::pivot_wider() to
#         put "M" and "F" in their own columns.
#
#   (b) Race distribution overall:
#         dm |> count(RACE, sort = TRUE)
#
#   (c) Subjects per country:
#         dm |> count(COUNTRY, sort = TRUE)
#
#   (d) Anything else the DM domain can answer. Type ?dm for the
#       variable list.
#
# Give your result a name, then print() it with a short cat() header like
# the blocks above, so the output is readable.
#
# Then: git add, git commit, git push to your fork, and open a pull request.
# -------------------------------------------------------------------------

# your code here

