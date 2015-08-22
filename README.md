# Coursera_cleaningdataproject
Project related to the Coursera course "Getting and Cleaning Data"

## Explanation about the workings of the script *run_analysis.R*

# line 1:
I got the working directory so I could go back to it 

# lines 4 to 9:
I set the path to the train dataset and read the files **x_train.txt**, **y_train.txt** and **subject_train.txt**. Those files were stored to the variables *texto1*, *texto2* and *texto3* for future use.

These variables hold string vectors.  Each line of the file was a position of the vector.

# lines 12 to 20:
First, I went back to the working directory. Then I set the path to the test dataset and read the files **x_test.txt**, **y_test.txt** and **subject_test.txt**. Those files were store to the variables *texto4*, *texto5* and *texto6* for future use.

These variables also hold string vectors.  Each line of the file was a position of the vector.

In the variable *totalLinhas*, I stored the total number of lines used by the test and the train datasets together. This value was later used to pre-allocate a dataframe where the data from the 2 datasets was to be stored.

# lines 24 to 35
First, I went back to the working directory. Then I set the path to the UCI HAR Dataset directory. The objective was to read the file **features.txt** to get the name of the columns of the dataframe that will store the data from the test and train datasets. This was done on lines 24 to 26.

Lines 28 to 29, I read the file **features.txt** into the dataframe *colunas* and set the names of the columns to *ordem* and *titulo* in order to work easier.

On line 30 I created another dataframe, called *colunasSel*, based on the dataframe *colunas*, with the index (column *ordem*) and the names (column *titulo*) of the columns that represented mean and std of the measurements. The parameter of the grep function **'std|mean[^F]'** took care of this selection, excluding the meanFreq columns, wich I considered not to be part of the information requested in the exercise.

On line 32 I created an empty dataframe,called *df*, with the number of columns equal to the number of columns selected on line 30 and the number of rows equal to the variable *totalLinhas*, that hold the total number of lines used by the train and test datasets together.

On line 33 I added 2 extra columns of characters to the *df* dataframe above, to be able to store the activity and the subject data.

On line 35 I gave the columns of the dataframe their names.

# line 38
I read the file **activity_labels.txt** and stored it on the variable *activity_labels*.

# lines 41 to 55
These lines processed the data from the train dataset. The main file was the **x_train.txt**, that hold the data of the sensors readings. The rest of the data was in the files **y_train.txt**, that hold the activity labels, and **subject_train.txt**, that hold the number of the subject.

These 3 files were related by the line number. Every observation had the same line number on each of the 3 files.

As said previously, those 3 files were read into the variables *texto1*, *texto2* and *texto3* respectively. Therefore, each observation had the same position on each of the 3 vectors.

On line 41 I initialized variable *controleDF*, that was used to insert data on the dataframe *df*, one line each time. The new data replaced the empty lines and rows of the preallocated dataframe *df*. Therefore *controleDF* hold the current row number, during processing, of the *df* dataframe.

On line 42 I initialized variable *controle*, that was used to keep track of position of the vectors, allowing to extract data form the vectors holding the activities labels (*texto2*) and the subjects (*texto3*), and compatibilize with the data from the sensor readings vector (*texto1*). Therefore *controle* hold the current row position, during processing, of the *texto1* vector.

In the first loop *controle* and *controleDF* had the same value.

On line 43 there was a for loop that looped through the vector holding the sensor readings (*texto1*).

On line 44, every line of the sensor reading was broken into a vector of numerics with 561 positions, called *campos*. It was done considering that the fields were separated by one or two spaces (the **'[ ]+'** parameter of the strsplit function).

line 46, I read the value of the corresponding activity label.

line 47, I read the subject related to the sensor readings.

lines 49 to 51, I inserted into the *df* dataframe the values extracted from the variables read.

lines 53 and 55, the values of the variables *controle* and *controleDf* were incremented.

# lines 59 to 73
These lines processed the data from the test dataset. The main file was the **x_test.txt**, that hold the data of the sensors readings. The rest of the data was in the files **y_test.txt**, that hold the activity labels, and **subject_test.txt**, that hold the number of the subject.

These 3 files were related by the line number. Every observation had the same line number on each of the 3 files.

As said previously, those 3 files were read into the variables *texto4*, *texto5* and *texto6* respectively. Therefore, each observation had the same position on each of the 3 vectors.

On line 59 the variable *controle* was reset. After that, everything happend in the same way as on lines 43 through 56.

On lines 75 to 77 there was a check to verify if all preallocated lines where used.

The final processing happend from line 84 through 99. The *df* dataframe was split by subject and activity into a list of dataframes called *listaSplit*.

Again an empty dataframe was pre-allocated, called *dfFinal*. It had the same number of columns and columns names of the *df* dataframe and a number of rows equal to the number of itens of the list of split dataframes (line 87 to 90).

Lines 93 through 99, each item of *listaSplit* was processed. For each dataframe in *listaSplit* the average of each column was calculated and included in the *dfFinal* along with the corresponding activity and subject (lines 95 through 97).
 

