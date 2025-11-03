library(readr)

## =========================================================================
## 001 File

map.2.1 <- list(
  widths = c(11, 5, 1, 28, 1, 1, 1, 146),
  cn     = c("blank00",    # 1-11
             "ssn",        # 12–16
             "vital.st",   # 17
             "blank01",    # 18–45
             "sex",        # 46
             "race",       # 47
             "mar.st",     # 48
             "blank02")    # 49–194
)

NHEFS.2.1 <- read_fwf(
  file = "09466-0001-Data.txt",
  col_positions = fwf_widths(map.2.1$widths, map.2.1$cn),
  col_types = cols(.default = col_character())
)

NHEFS.2.1 <- NHEFS.2.1[ , !startsWith(names(NHEFS.2.1), "blank")]

## =========================================================================
## 002 File

columns <- c(
          "ssn",           # 1-5
          "blank01",       # 6-408
          "hist.arth",     # 409-410
          "blank02",       # 411-510
          "hist.hrt.att",  # 511-512
          "blank03",       # 513-514
          "hist.cor.byp",  # 515-516
          "blank04",       # 517-522
          "hist.TIA",      # 523-524
          "blank05",       # 525-562
          "hist.CVA",      # 563-564
          "blank06",       # 565-632
          "med.dia",       # 633-634
          "blank07",       # 635-648
          "med.hbp",       # 649-650
          "blank08",       # 651-1050
          "smoke",         # 1051-1052
          "blank09",       # 1053-1068
          "alcohol",       # 1069-1070
          "blank10",       # 1071-1107
          "weight",        # 1108-1110
          "blank11"        # 1111-1107
)

starts <- c(1, 6, 409, 411, 511, 513, 515, 517, 523, 525, 563, 565,
            633, 635, 649, 651, 1051,1053,1069,1071,1108,1111)

ends   <- c(5, 408, 410, 510, 512, 514, 516, 522, 524, 562, 564, 632,
            634, 648, 650, 1050,1052,1068,1070,1107,1110, NA)

cn     <- columns

NHEFS.2.2 <- read_fwf(
  "09466-0002-Data.txt",
  fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHEFS.2.2 <- NHEFS.2.2[ , !startsWith(names(NHEFS.2.2), "blank")]

## =========================================================================
## Analysis 

dim(NHEFS.2.1)
dim(NHEFS.2.2)

length(intersect(NHEFS.2.1$ssn, NHEFS.2.2$ssn))

save(NHEFS.2.1, NHEFS.2.2, file = "NHEFS_2.Rdata")
