library(readr)

## =========================================================================
## 4701 File

columns <- c(
  "ssn",       # 1-5
  "blank01",   # 6-100
  "age",       # 101-102
  "race",      # 103
  "sex",       # 104
  "mar.st",    # 105
  "dob",       # 106-109
  "blank02",   # 110-319
  "weight",    # 320-324
  "height",    # 325-327
  "blank03"    # 328-end
)

starts <- c(1, 6, 101, 103, 104, 105, 106, 110, 320, 325, 328)
ends   <- c(5, 100, 102, 103, 104, 105, 109, 319, 324, 327,  NA)
cn <- columns

url <- "https://wwwn.cdc.gov/nchs/data/nhanes1/DU4701.txt"

NHANES.1.1 <- read_fwf(
  file = url,
  col_positions = fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHANES.1.1 <- NHANES.1.1[ , !startsWith(names(NHANES.1.1), "blank")]

## =========================================================================
## 4081 File

columns <- c(
  "ssn",           # 1-5
  "blank01",       # 6-262
  "hist.arth",     # 263
  "blank02",       # 264-286
  "hist.hrt.att",  # 287
  "blank03",       # 288-292
  "hist.CVA",      # 293
  "blank04",       # 294-404
  "alcohol",       # 405
  "blank05"        # 406-end
)

starts <- c(1, 6, 263, 264, 287, 288, 293, 294, 405, 406)
ends   <- c(5, 262, 263, 286, 287, 292, 293, 404, 405,  NA)
cn <- columns

url <- "https://wwwn.cdc.gov/nchs/data/nhanes1/DU4081.txt"

NHANES.1.2 <- read_fwf(
  file = url,
  col_positions = fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHANES.1.2 <- NHANES.1.2[ , !startsWith(names(NHANES.1.2), "blank")]

## =========================================================================
## 4091 File

columns <- c(
  "ssn",           # 1-5
  "blank01",       # 6-378
  "smoke",         # 379
  "blank02",       # 380-488
  "med.dia.ins",   # 489
  "med.dia.oral",  # 490
  "blank03",       # 491-559
  "med.hbp",       # 560
  "blank04"        # 561-end
)

starts <- c(1, 6, 379, 380, 489, 490, 491, 560, 561)
ends   <- c(5, 378, 379, 488, 489, 490, 559, 560, NA)
cn <- columns

url <- "https://wwwn.cdc.gov/nchs/data/nhanes1/DU4091.txt"

NHANES.1.3 <- read_fwf(
  file = url,
  col_positions = fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHANES.1.3 <- NHANES.1.3[ , !startsWith(names(NHANES.1.3), "blank")]

save(NHANES.1.1, NHANES.1.2, NHANES.1.3, file = "NHANES_1.Rdata")
