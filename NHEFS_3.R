library(readr)

## =========================================================================
## 001 File

map.3.1 <- list(
  widths = c(5, 4, 2, 2, 170, 2, 273, 2, 5430),
  cn     = c("ssn",        # 1-5
             "blank01",    # 6-9
             "sex",        # 10-11
             "vital.st",   # 12-13
             "blank02",    # 14-183
             "race",       # 184-185
             "blank03",    # 186-458
             "mar.st",     # 459-460
             "blank04")    # 461-5890
)

NHEFS.3.1 <- read_fwf(
  file = "09854-0004-Data.txt",
  col_positions = fwf_widths(map.3.1$widths, map.3.1$cn),
  col_types = cols(.default = col_character())
)

NHEFS.3.1 <- NHEFS.3.1[ , !startsWith(names(NHEFS.3.1), "blank")]

## =========================================================================
## 004 File

columns <- c(
            "ssn",           # 1-5
            "blank01",       # 6-626
            "hist.hrt.att",  # 627-628
            "blank02",       # 629-648
            "hist.cor.byp",  # 649-650
            "blank03",       # 651-666
            "hist.CVA",      # 667-668   # (your note: entry 5 means TIA)
            "blank04",       # 669-718
            "med.dia",       # 719-720
            "blank05",       # 721-754
            "med.hbp",       # 755-756
            "blank06",       # 757-1226
            "smoke",         # 1227-1228
            "blank07",       # 1229-1253
            "alcohol",       # 1254-1255
            "blank08",       # 1256-1294
            "weight",        # 1295-1297
            "blank09"        # 1298-NA
)

starts <- c(1, 6, 627, 629, 649, 651, 667, 669, 719, 721, 755, 757, 1227,1229,1254,1256,1295, 1298)
ends   <- c(5, 626, 628, 648, 650, 666, 668, 718, 720, 754, 756, 1226,1228,1253,1255,1294,1297, NA)
cn     <- columns

NHEFS.3.4 <- read_fwf(
  "09854-0004-Data.txt",
  fwf_positions(starts, ends, col_names = cn),
  col_types = cols(.default = col_character())
)

NHEFS.3.4 <- NHEFS.3.4[ , !startsWith(names(NHEFS.3.4), "blank")]

## =========================================================================
## Analysis 

dim(NHEFS.3.1)
dim(NHEFS.3.4)

length(intersect(NHEFS.3.1$ssn, NHEFS.3.4$ssn))

save(NHEFS.3.1, NHEFS.3.4, file = "NHEFS_2.Rdata")
