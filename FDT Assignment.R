#ITC 255
#Murtaza malik Aqbal
#FDT Assignement

#Questions:

#1. Upload the dataset iris from the web 

#2. Choose a numerical variable  and construct its FDT

#Answers:

#1:
# we will upload the Iris Dataset from internet to R using the following code:
dfIris=read.csv(url("https://gist.githubusercontent.com/netj/8836201/raw/6f9306ad21398ea43cba4f7d537619d0e07d5ae3/iris.csv"))
head(dfIris)

#2:
#Now that we have uploaded the dataset, I select Petal.length and change it to a categorical variable.
#Petal.length

summary(dfIris$petal.length)
#We use summary function so we can select categories looking at the data the summary function shows. 

#Define Categories:
#short when petal.length<3 medium when petal.length>=3 but less than 5 long when petal.length when otherwise

#Selection:
CatPetal.length=c()

for (m in 1: length(dfIris)) {
  if(dfIris$petal.length[m]<3){
    CatPetal.length[m]="short"
    }else if (dfIris$petal.length[m]>=3 & dfIris$petal.length[m] < 5) {
      CatPetal.length[m]="medium"
   }   else { 
        CatPetal.length[m]= "long"}
    
}

head(CatPetal.length)

Petal.length= cbind(dfIris$petal.length, CatPetal.length)
View(Petal.length)

#Now that we have CatPetal.length as a categorical variable, we can create its frequency distribution table.
absfreq=table(dfIris$petal.length)
absfreq
relfreq=round(prop.table(absfreq), 1)
relfreq
cumfreq=cumsum(relfreq)
cumfreq
fdtPetal.length= cbind(absfreq, relfreq, cumfreq)
fdtPetal.length




#Creating the function to return the Fdt of a categorical function.

fdtCat= function(z){
  absfreq=table(z)
  relfreq=round(prop.table(absfreq), 1)
  cumfreq=cumsum(relfreq)
  fdtPetal.length= cbind(absfreq, relfreq, cumfreq)
  return(fdtPetal.length)
}

#Now we test to see if our above function works.
fdtCat(dfIris$petal.length)

#We use the function we created to get the fdt of the categorcial petal.length variable which we worked on earlier. 
fdtCat(CatPetal.length)
