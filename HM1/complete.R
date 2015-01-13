complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  filename <- sprintf("%03d.csv",id)
 # print (filename)
  
  files_full <- list.files(directory, full.names= TRUE )
  #print (class(id))
  
  dd <-read.csv(files_full[1])
  
  goog <- complete.cases(dd)
  dd <- dd[complete.cases(dd),]
  
  #print (dim(dd)[1])
  res <- data.frame(1, dim(dd)[1])
  
 # print (res)
  result <- data.frame()
 # print (id)
  for (i in 1:length(id))
  {
   # print(i)
    indexx <- which(list.files(directory) == filename[i])
    #print("here:")
    #print(indexx)
    mydata <- read.csv(files_full[indexx])
    mmdata <- mydata[complete.cases(mydata),]
   # myframe <- data.frame(id[i], dim(mmdata)[1])
    result <- rbind(result,data.frame(id[i], dim(mmdata)[1]))
  }
  colnames(result) <- c("id","nobs")

  result
}

