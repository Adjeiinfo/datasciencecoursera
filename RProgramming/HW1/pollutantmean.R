ollutantmean <- function(directory, pollutant, id = 1:332) {

 	## 'directory' is a character vector of length 1 indicating
 	## the location of the CSV files

 	## 'pollutant' is a character vector of length 1 indicating
 	## the name of the pollutant for which we will calculate the
 	## mean; either "sulfate" or "nitrate".

 	 ## 'id' is an integer vector indicating the monitor ID numbers
 	 ## to be used

 	 ## Return the mean of the pollutant across all monitors list
 	 ## in the 'id' vector (ignoring NA values)



 	 #make filename
 	 filename <- sprintf("%03d.csv",id)
 	 filenames <- list.files(directory)

 	 files_full <- list.files(directory, full.names= TRUE )

 	 #create an impty data frame 
 	 mydata <- data.frame()
 	 for (i in 1:length(filename))
 	 {
 	 	indexx <- which(filenames == filename[i])
 	 	mydata <- rbind(mydata,read.csv(files_full[indexx]))
 	 }

 	#ge the col of interest  (just for debug)
 	str(mydata)
 	colToAnalyze <- mydata[[pollutant]]

 	#compute the mean
 	colMean <- mean(colToAnalyze, na.rm=TRUE)
 	colMean

 	#sprintf ("%s mean is %f", pollutant, colMean)



}
