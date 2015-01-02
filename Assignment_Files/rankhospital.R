rankhospital <- function(state, outcome, num = "best") {
        outcomecsv<- read.csv("outcome-of-care-measures.csv", colClasses="character")
        colnames(outcomecsv)[11] <- "heart attack"
        colnames(outcomecsv)[17] <- "heart failure"
        colnames(outcomecsv)[23] <- "pneumonia"
        colnames(outcomecsv)[2] <- "hospital"
        
        state <- as.character(state)
        outcome<-as.character(outcome)
        #num=as.numeric(num)
        
        v=c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% v) stop("invalid outcome")
        
        if (!state %in% csv[,7]) stop("invalid state") 
        

        e<-subset(outcomecsv, State==state)
        f=e[, c("hospital", outcome)]
        f[,2]=as.numeric(f[,2])
        #na.omit(f)
        g=f[order(f[2], f[1]), ]
        h=g[complete.cases(g), ]
        if (num=="best") { 
                a=g$hospital[1] 
        }
        if (num=="worst") { 
                a=g$hospital[nrow(h)]
        }
        else { 
                a=g$hospital[num]
        }
        a
}
        


