library(readr)

## =========================================================================
## 001 File

map.1.1 <- list(
  widths = c(5, 1, 25, 1, 1, 1, 46),
  cn     = c("ssn",        # 1–5
             "vital.st",   # 6
             "blank01",    # 7–31
             "sex",        # 32
             "race",       # 33
             "mar.st",     # 34
             "blank02")    # 35–80
)

NHEFS.1.1 <- read_fwf(
  file = "08900-0001-Data.txt",
  col_positions = fwf_widths(map.1.1$widths, map.1.1$cn),
  col_types = cols(.default = col_character())
)

NHEFS.1.1 <- NHEFS.1.1[ , !startsWith(names(NHEFS.1.1), "blank")]

## =========================================================================
## 004 File

columns <- c(
             "ssn",          # 1-5
             "blank01",      # 6-1162
             "hist.hrt.att", # 1163
             "blank02",      # 1164-1198
             "hist.TIA",     # 1199
             "blank03",      # 1200-1204
             "hist.CVA",     # 1205
             "blank04",      # 1206-1239
             "dia.hbp",      # 1240
             "blank05",      # 1241-1262
             "dia.med",      # 1263
             "blank06",      # 1264-1991
             "smoke",        # 1992
             "blank07",      # 1993-2128
             "alcohol",      # 2129-2130
             "blank08",      # 2131-3710
             "hist.arth",    # 3711
             "blank09",      # 3712-4148
             "wght.on",      # 4149
             "weight",       # 4150-4152
             "blank10"       # 4153-end
)

starts <- c(1, 6, 1163, 1164, 1199, 1200, 1205, 1206, 1240, 1241, 1263, 1264, 
            1992, 1993, 2129, 2131, 3711, 3712, 4149, 4150, 4153)
ends   <- c(5, 1162, 1163, 1198, 1199, 1204, 1205, 1239, 1240, 1262, 1263, 
            1991, 1992, 2128, 2130, 3710, 3711, 4148, 4149, 4152, NA) 
cn     <- columns

NHEFS.1.4 <- read_fwf(
  "08900-0004-Data.txt",
  fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHEFS.1.4 <- NHEFS.1.4[ , !startsWith(names(NHEFS.1.4), "blank")]

## =========================================================================
## Analysis 

dim(NHEFS.1.1)
dim(NHEFS.1.4)

length(intersect(NHEFS.1.1$ssn, NHEFS.1.4$ssn))

save(NHEFS.1.1, NHEFS.1.4, file = "NHEFS_1.Rdata")
