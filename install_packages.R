# install_packages.R -------------------------------------------------------
#
# Run this once before your first `source("R/explore_dm.R")`:
#
#     source("install_packages.R")
#
# It installs only what this practice repo needs, and skips anything you
# already have.
# --------------------------------------------------------------------------

needed <- c("pharmaversesdtm", "dplyr")
missing <- needed[!vapply(needed, requireNamespace, logical(1), quietly = TRUE)]

if (length(missing) == 0) {
  message("All set — ", paste(needed, collapse = ", "), " are already installed.")
} else {
  message("Installing: ", paste(missing, collapse = ", "))
  install.packages(missing)
}
