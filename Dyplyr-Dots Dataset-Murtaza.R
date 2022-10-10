  #                                              ITC 255
  #                                         Dplyr Assignment
  #                                        Murtaza Malik Aqbal

  # First, I upload my Dataset (dots) from the web & install the "dplyr" Package. 
dots=read.csv(url("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/dots.csv"))
head(dots)
tail(dots)
View(dots)
install.packages("dplyr")
library("dyplr")
str(dots)

    #filter function: We use the "Filter" function to create sub-datasets of our choice by sitting conditions to variables.To simply say, if we want to find how many observations in out dataset for example goes to the gym & does not smoke, we find that using the "Function" function.
list(dots)
fRandom=filter(dots, time==40, choice==T1)
head(fRandom)
   
     #Using logical operators such as &(and), |(or), and !(not)
unique(dots$choice)
c=filter(dots, choice=='T1' | choice=='T2')
head(c)
#explanation of the above code: Since my dataset(dots) has no clear and understandable variables, we can say in the above code and wanted to filter out T1 and T2 from "Choice" variable in the dataset "dots". 

cCombined=filter(dots, choice=='T1' | choice=='T2' & align=='dots')
head(cCombined)
#Here we combined the '|' and '&' together to get only the observations with the specified criteria above, out of the dataset. 


    #Function %in% is used to find observations within a variable using specified conditions. 
filter(dots, time %in% c(20, 180))
#Here I selected observations who has time between 20 to 180.
    

    #using algebraic operation such as ==(equal), <(smaller), >(bigger) in Filter function
filter(dots, coherence<8)
#Here I filtered out observations with coherence less than 8


    #Arrange function: is used to arrange observations. 
head(arrange(dots, desc(time)))
#Here I arranged the variables of "Time" variable from big to small. We also note that the "desc" function arranged the observations from large to small. If we want to arrange from small to large, we do not add the "desc" function and simply write the name of the variable. 


    #Select function: As its name clarifies, we use the "Select" function to select variables of our choice from the dataset
select(dots, c(time, choice, coherence))
#Here I selected only the "time", "choice", and "coherence" variables out of the "dots" dataset. 
#If we want to bring one variables to first(left side of the dataset next to the number of observations), we use the "everything" function next the name of the variable.
select(dots, firing_rate, everything())

#we can also use the ":" function to select from one variable to another only, excludiing other variables in the dataset .
select(dots, choice:coherence)
#here my dataset has only the variables from "choice" to "coherence".

#we can use the "-" function do remove a variable from our dataset. In the below function, I have deleted the "choice" variable from the dataset.
select(dots, -(choice))


    #Rename function: We use this function to change the names of variables in our dataset. 
rename(dots, aligning=align)
#here I changed the name of the "align" variable into "aligning".


    #mutate function: This function is used to create new variables using the data available from existing variables in the dataset. 
head(mutate(dots, Total_time_plus_coherence= time+coherence))
#here I created a new variable(Total_time_plus_coherence) in the dataset by adding the values of the "time" and "coherence" variables together.


    #summarize function: We use the "summarize" function to get different kinds of summaries on our dataset. We can use the mean, median, mode, quantiles, percentiles, and other types of summaries using the "summarize" function.
summarise(dots, median(time), median(coherence))
#here I found the median of the "time", and "coherence" variables. The median of time is 80, and the median of coherence is 6.4.
#we can also use the "group_by" function to first make groups from our main dataset and then summarize data from that grouped dataset. 
Choice= group_by(dots, choice)
summarise(Choice, mean(firing_rate), sd(firing_rate))
#Here I have found the mean and standard deviation of the firing_rate variable from the "Choice" grouped dataset that I had created. 


    #Pull Function: This function is used to take out a variable from a dataset and represent it as a vector.
tTime=pull(dots, time)
head(tTime)
#Here I took out the "Time" variable out of the "dots" dataset and presented it as a vector.


    #Sample_n function: is used to create a sample from a dataset.
dim(dots)
#we have 848 observations and we want to take a random sample of 420 observations.
SampleForm=sample_n(dots, 420)
head(SampleForm)

#  Thank you!
