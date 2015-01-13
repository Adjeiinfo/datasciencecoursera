corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0

        ## Return a numeric vector of correlations

        files_full <- list.files(directory, full.names= TRUE )

        #empty vector my cor
        mycor <- vector()

        #get complete cases 
        for (i in 1:length(files_full)){
         	mdata <- read.csv(files_full[i])
        	mdata <- mdata[complete.cases(mdata),]

        	if (dim(mdata)[1] > threshold)
        	{
        		#str(mdata)
        		mycor = rbind(mycor, cor(mdata$sulfate, mdata$nitrate))
        	}	
        }
       
       mycor


}
