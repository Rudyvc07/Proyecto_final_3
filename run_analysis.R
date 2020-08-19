
### Ruta de Directorio
pathproyecto = file.path("UCI HAR Dataset")

### Creamos un rachivo con 28 nombres

files_names= list.files(pathproyecto, recursive = TRUE)

### Observamos los resultados
View(files_names)

## Crear conjunto de datos de entrenamiento y prueba

xtrain = read.table(file.path(pathproyecto, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(pathproyecto, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(pathproyecto, "train", "subject_train.txt"),header = FALSE)

xtest = read.table(file.path(pathproyecto, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(pathproyecto, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(pathproyecto, "test", "subject_test.txt"),header = FALSE)

## Crear archivo para nombres de columnas

features = read.table(file.path(pathproyecto, "features.txt"),header = FALSE)


activityLabels = read.table(file.path(pathproyecto, "activity_labels.txt"),header = FALSE)

### etiquetar los conjutos de prueba y entrenamiento: 
## TEST
colnames(xtest) = features[,2]
colnames(ytest) = "actId"
colnames(subject_test) = "subjectId"

## TRAIN
colnames(xtrain) = features[,2]
colnames(ytrain) = "actId"
colnames(subject_train) = "subjectId"



### Crear el control para las etiquetas 

colnames(activityLabels) <- c('activityId','activityType')

### PARTE I DEL PROYECTO ####

## COMBINAR LOS CONJUNTOS DE ENTRENAMIENTO Y PRUEBA

## cOMBINAR MARCO DE DATOS DEL TEST 
mrg_test = cbind(ytest, subject_test, xtest)

## cOMBINAR MARCO DE DATOS DEL TRAIN
mrg_train = cbind(ytrain, subject_train, xtrain)

## FUSIONAR CONJUNTO DE DATOS TEST Y TRAIN

setAllInOne = rbind(mrg_train, mrg_test)

### PARTE II DEL PROYECTO ####

## EXTRAER LAS MEDIAS Y DESVIACION ESTANDAR DE CADA MEDICION 

## BORRAR CARACTERES INNECESARIOS DE LAS COLUMNAS 
names_new <- make.names(names = colnames(setAllInOne), unique = TRUE, allow_ = TRUE)
colnames(setAllInOne)<- names_new
data.frame(colnames(setAllInOne))

names(setAllInOne)
## COLUMNAS DE MEDIAS Y DESVIACION ESTANDAR
library(dplyr)

mean_and_std <- bind_cols(select(setAllInOne, contains("SubjectId"))
                          ,select(setAllInOne, contains("actId"))
                          ,select(setAllInOne, contains("mean..."))
                          ,select(setAllInOne, contains("std...")))

### PARTE III DEL PROYECTO ####

## UTILIZAR LO NOMBRES DE LOS DESCRIPTIVOS PARA NOMBRAR LAS ACTIVIDADES EN EL CUNJUNTO DE DATOS

## IMPORTAMOS LAS ETIQUETAS

act_labels <- read.table("activity_labels.txt", header = FALSE)
names(act_labels) <- c("actId", "Activity_Labels")
All_data_act <- merge(mean_and_std,act_labels,by="actId"  ,all = TRUE)

##

act_labels_temp <- select(All_data_act , "Activity_Labels")
tempdata <- select(All_data_act , -"actId" , -"Activity_Labels")
totaldata <- bind_cols(act_labels_temp , tempdata)

### PARTE IV DEL PROYECTO ####

## ETIQUETAR CONJUNTO DE DATOS CON NOMBRES DE VARIABLES DESCRIPTIVOS

encab<-gsub("tBody","Time_Body_",names(totaldata))%>%
  gsub("tGravity","Time_Gravity_",encab)%>%
       gsub("fBody","Frequency_Body_",encab)%>%gsub(".mean...","_Mean_",encab)%>%
       gsub(".std...","_StandardDeviation_",encab)%>%gsub("Acc","Acceleration",encab)

encab <- gsub("tBody","Time_Body_",names(totaldata))
encab <- gsub("tGravity","Time_Gravity_",encab)
encab <- gsub("fBody","Frequency_Body_",encab)
encab <- gsub(".mean...","_Mean_",encab)
encab <- gsub(".std...","_StandardDeviation_",encab)
encab <- gsub("Acc","Acceleration",encab)
names(totaldata) <- encab

### PARTE V DEL PROYECTO ####

## CREAMOS UN CONJUNTO DE DATOS INDEPENDIENTE CON EL PROMEDIO DE CADA VARIABLE PARA CADA ACTIVIDAD 
## CON LOS CONJUNTOS DE DATOS DEL PASO IV

## CREAR UNA LISTA DE COLUMNAS PARA PROEDIAR EXCEPTO ACTIVITY_LABEL Y SUBJECTID 
list <- encab[-c(1 , 2)]

## AGREGAR LOS DATOS ESTABLECIDOS POR Activity_Label Y SubjectId Y GENERAR LA MEDIA PARA 
## CADA UNA DE LAS VARIABLES MEDIDAS.

tidydata <- aggregate(totaldata[,c(list)],
            by = list(Activity_Labels  = totaldata$Activity_Labels,
            Subjectidentifier = totaldata$subjectId ), FUN = mean)

## EXPORTAR EL CONJUNTO DE DATOS CALCULADO 
write.table(tidydata , file = "tidydata.txt" , row.names = F)
