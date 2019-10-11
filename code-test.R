library(stringi)

raw68 <- readLines("d:/6800/aci")
pattern <- "^\\[Header\\](\\s|\\S)+(\\[Data\\])"
rawone <- stringi::stri_flatten(raw68, collapse = '\n')

# data start with [Data], header between [Header] and [Data]
header <- stringi::stri_extract_all(rawone, regex = pattern)
data_meas <- stringi::stri_split(rawone, regex = pattern,
                                 omit_empty = TRUE)

data_temp <- stringi::stri_split(data_meas,regex = "\n", simplify = TRUE, omi_empty = TRUE)
data_temp <- t(data_temp)

data_name <- readr::read_tsv(data_temp, skip = 2, n_max = 5)
data_noname <- readr::read_tsv(data_temp, skip = 4, col_names = names(data_name))

