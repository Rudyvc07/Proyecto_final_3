ANTECEDENTES PARA LA RECOPILACION DE DATOS

Los experimentos se llevaron con un grupo de 30 voluntarios dentro de un grupo de 19 - 48 años. Cada persona realizó seis actividades con el telefono inteligente (Samsung Galaxy S II) en la cintura. Utilizando su acelerometro y giroscopio integrado, donde se calculo la aceleracion lineal 3-axial y la velocidad angular 3-axial a una tasa constante de 50Hz. El conjunto de informacion se selecciono un test y train con 30% y 70% de forma aleatoria.

REPOSITORIO DE DATOS
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

ENLACE DE DESCARGA 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

ARCHIVOS DEL REPOSITORIO DE DESCARGA

Todos los archivos estan para el test y train:

1- README.txt

2- features_info.txt

3- features.txt

4- activity_labels.txt

5- train/X_train.txt

6- train/y_train.txt

7- test/X_test.txt

8- test/y_test.txt

9- train/subject_train.txt
 
CARACTERISTICAS DE LAS VARIABLES

Las características seleccionadas en el conjunto de datos provienen de las señales sin procesar de 3 ejes del acelerómetro y el giroscopio tAcc-XYZ y tGyro-XYZ. Luego, la señal de aceleración se separó en señales de aceleración de cuerpo y gravedad (tBodyAcc-XYZ y tGravityAcc-XYZ)

La aceleración lineal del cuerpo y la velocidad angular se derivaron a tiempo para obtener señales de Jerk (tBodyAccJerk-XYZ y tBodyGyroJerk-XYZ). Finalmente, la magnitud se muestra mediante lo siguiente (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

DESCRIPCION DE LOS ARCHIVOS

Entre los archivos exportados consta de 180 observaciones para los 30 identificadores de sujeto. Hay 48 variables con sus medias para cada actividad.

Lista de etiquetas para el conjunto de datos:
Activity_Labels Subjectidentifier Time_Body_Acceleration_Mean_X Time_Body_Acceleration_Mean_Y Time_Body_Acceleration_Mean_Z Time_Gravity_Acceleration_Mean_X Time_Gravity_Acceleration_Mean_Y Time_Gravity_Acceleration_Mean_Z Time_Body_AccelerationJerk_Mean_X Time_Body_AccelerationJerk_Mean_Y Time_Body_AccelerationJerk_Mean_Z Time_Body_Gyro_Mean_X Time_Body_Gyro_Mean_Y Time_Body_Gyro_Mean_Z Time_Body_GyroJerk_Mean_X Time_Body_GyroJerk_Mean_Y Time_Body_GyroJerk_Mean_Z Frequency_Body_Acceleration_Mean_X Frequency_Body_Acceleration_Mean_Y Frequency_Body_Acceleration_Mean_Z Frequency_Body_AccelerationJerk_Mean_X Frequency_Body_AccelerationJerk_Mean_Y Frequency_Body_AccelerationJerk_Mean_Z Frequency_Body_Gyro_Mean_X Frequency_Body_Gyro_Mean_Y Frequency_Body_Gyro_Mean_Z Time_Body_Acceleration_StandardDeviation_X Time_Body_Acceleration_StandardDeviation_Y Time_Body_Acceleration_StandardDeviation_Z Time_Gravity_Acceleration_StandardDeviation_X Time_Gravity_Acceleration_StandardDeviation_Y Time_Gravity_Acceleration_StandardDeviation_Z Time_Body_AccelerationJerk_StandardDeviation_X Time_Body_AccelerationJerk_StandardDeviation_Y Time_Body_AccelerationJerk_StandardDeviation_Z Time_Body_Gyro_StandardDeviation_X Time_Body_Gyro_StandardDeviation_Y Time_Body_Gyro_StandardDeviation_Z Time_Body_GyroJerk_StandardDeviation_X Time_Body_GyroJerk_StandardDeviation_Y Time_Body_GyroJerk_StandardDeviation_Z Frequency_Body_Acceleration_StandardDeviation_X Frequency_Body_Acceleration_StandardDeviation_Y Frequency_Body_Acceleration_StandardDeviation_Z Frequency_Body_AccelerationJerk_StandardDeviation_X Frequency_Body_AccelerationJerk_StandardDeviation_Y Frequency_Body_AccelerationJerk_StandardDeviation_Z Frequency_Body_Gyro_StandardDeviation_X Frequency_Body_Gyro_StandardDeviation_Y Frequency_Body_Gyro_StandardDeviation_Z


ARCHIVOS PROPOCIONADOS AL FINAL DEL PROYECTO 

1- README.md: Planteammos los obejtivos del proyecto

2- CodeBox.md: Brindamos la informacion del repositorio de datos y definimos algunas variables

3- run_analysis.R: Es el script desarrollado para los objetivos del proyecto

4- tidydata.txt: El archivo plano donde exportamos los resultados buscados (media y desviacion standar)
