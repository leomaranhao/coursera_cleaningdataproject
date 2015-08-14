wd <- getwd()

# Read the train dataset
novodir<-file.path("UCI HAR Dataset","train")
setwd(novodir)

texto1 <- readLines("X_train.txt")
texto2 <- readLines("y_train.txt")
texto3 <- readLines("subject_train.txt")

# Read the test dataset
setwd(wd)
novodir<-file.path("UCI HAR Dataset","test")
setwd(novodir)

texto4 <- readLines("X_test.txt")
texto5 <- readLines("y_test.txt")
texto6 <- readLines("subject_test.txt")

totalLinhas <- length(texto2) + length(texto5)

# Create de data.frame that will hold the two datasets and set the columns lables
# The vector colunasSel will hold the columns of interest
setwd(wd)
novodir<-file.path("UCI HAR Dataset")
setwd(novodir)

colunas<-read.table("features.txt")
names(colunas)<-c("ordem", "titulo")
colunasSel<-colunas[grep("std|mean[^F]", colunas$titulo),]

df<-data.frame(rep(list(numeric(totalLinhas)),length(colunasSel$titulo)), stringsAsFactors = FALSE)
df<-cbind(df,character(totalLinhas),character(totalLinhas), stringsAsFactors = FALSE)

names(df)<-c(as.character(colunasSel$titulo),"Activity","Subject")

# Read the activity labels
activityLabels<-read.table("activity_labels.txt")

# Process the train dataset
controleDf <- 1
controle <- 1
for(linha in texto1){
        campos<-as.numeric(strsplit(linha, "[ ]+")[[1]][2:562])

        ordemLabel <- texto2[controle]
        ordemsubject <- texto3[controle]
        
        df[controleDf,1:length(colunasSel$ordem)] <- campos[colunasSel$ordem]
        df[controleDf,length(colunasSel$ordem)+1] <- as.character(activityLabels[,2])[as.numeric(ordemLabel)]
        df[controleDf,length(colunasSel$ordem)+2] <- ordemsubject
        
        controle <- controle + 1
        
        controleDf <- controleDf + 1
}

# Process the test dataset
controle <- 1
for(linha in texto4){
        campos<-as.numeric(strsplit(linha, "[ ]+")[[1]][2:562])
        
        ordemLabel <- texto5[controle]
        ordemsubject <- texto6[controle]
        
        df[controleDf,1:length(colunasSel$ordem)] <- campos[colunasSel$ordem]
        df[controleDf,length(colunasSel$ordem)+1] <- as.character(activityLabels[,2])[as.numeric(ordemLabel)]
        df[controleDf,length(colunasSel$ordem)+2] <- ordemsubject
        
        controle <- controle + 1
        
        controleDf <- controleDf + 1
}

if(totalLinhas != controleDf-1) {
        print("Error during processing!!")
}

setwd(wd)

#generate final data.frame applying mean function to every column
# by activity and by subject

listaSplit<-split(df,list(df$Subject,df$Activity))
numberRows<-length(listaSplit)

dfFinal<-data.frame(rep(list(numeric(numberRows)),length(colunasSel$titulo)), stringsAsFactors = FALSE)
dfFinal<-cbind(dfFinal,character(numberRows),character(numberRows), stringsAsFactors = FALSE)

names(dfFinal)<-c(as.character(colunasSel$titulo),"Activity","Subject")

controle <- 1
for(lista in listaSplit){
    
    dfFinal[controle,1:length(colunasSel$ordem)] <- sapply(lista[,1:length(colunasSel$ordem)], mean)
    dfFinal[controle,length(colunasSel$ordem)+1] <- lista[1,length(colunasSel$ordem)+1]
    dfFinal[controle,length(colunasSel$ordem)+2] <- lista[1,length(colunasSel$ordem)+2]
    
    controle <- controle + 1
    
}