# Library
library(ggplot2)
library(hrbrthemes)


# Dummy data
x <- LETTERS[1:20]
y <- paste0("var", seq(1,20))
data <- expand.grid(X=x, Y=y)
data$Z <- runif(400, 0, 5)


head(data)
# Heatmap 
ggplot(data, aes(X, Y, fill= Z)) + geom_tile()


### Heatmap for my data ####


input <- read.table("Heatmap_input.txt", sep="\t", header = TRUE)
head(input)

#Create a long formatted dataframe 
melted_df <- melt(input) 


head(melted_df)


#Heatmap 
pp <- ggplot(melted_df, aes(variable, id, fill= value)) +  geom_tile() + 
  scale_fill_gradient(low="white", high="red") 

heatmap_plot <- pp + theme(legend.key.size = unit(0.6, "cm"), legend.text = element_text(color= "Black", size= 6), axis.text.x = element_text(color= "Black", size= 5, angle = 90), axis.text.y = element_text(size=5, angle=40)) + 
  xlab("Samples") + ylab("Genes") + 
  labs(title= paste(" Heatmap")) +  
  theme(plot.title = element_text(hjust = 0.5)) 
 
heatmap_plot


