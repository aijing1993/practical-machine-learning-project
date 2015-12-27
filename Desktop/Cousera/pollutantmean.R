setwd("C:/Users/Administrator.LAHX-20150203QA/Downloads/rprog-data-specdata/")
pollutantmean <- function(directory, pollutant, id = 1:332) {
        directory<-("./specdata")
        file.names <- list.files(directory)
        file.numbers <- as.numeric(sub('\\.csv$','', file.names))
        selected.files <- na.omit(file.names[match(id, file.numbers)])
        selected.dfs <- lapply(file.path(directory,selected.files), read.csv)
        mean(c(sapply(selected.dfs, function(x) x[ ,pollutant])), na.rm=TRUE)
}