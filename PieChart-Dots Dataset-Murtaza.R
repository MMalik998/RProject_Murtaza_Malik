#installing the package (ggplot2)
install.packages("ggplot2")
library(ggplot2)
head(dots)

#I create the pie chart on the Categorical variable (align) of my dataset (dots). We also have to remember that before creating the pie chart, we have a create the frequency distribution table of the variable (align).

FdtAlign=table(dots$align)
FdtAlign=as.data.frame(FdtAlign)
FdtAlign
#Using the 'Colnames' function, I change the names of the variables. 
colnames(FdtAlign)= c("Company", "Frequency")


#Now, we create the pie Chart.
gPlot=ggplot(FdtAlign, aes(x="", y=Frequency, fill=Company))
g2=gPlot+geom_col() + coord_polar(theta = "y") +
  theme_dark() + theme(plot.title = element_text(colour = "purple", size = 15, face = "bold", hjust = .5)) +
  ggtitle("Frequency Distribution of Company") +
  geom_text(aes(label= Frequency), position = position_stack(vjust = .5)) +
  scale_fill_manual(values = c("orange", "red"))
g2

#Using the "ggsave" function, we save our pie chart. 
ggsave("CompanyDis.png")


