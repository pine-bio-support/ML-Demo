library(ggfortify)

data <- read.table("PCA_input_tpose_outlier_removal.txt", sep="\t", header=TRUE, row.names=1)

dim(data)

df <- data[2:2856]

pca_res <- prcomp(df, scale.=TRUE, center = TRUE)

autoplot(pca_res, data=data, colour="Group")

autoplot(pca_res, data=data, colour="Group", label=TRUE, label.size=2)



input <- read.table("Read_count_boxplot_input.txt", sep="\t", header=TRUE, row.names = 1, check.names = FALSE)
head(input)

#Create a long formatted dataframe 
melted_df <- melt(input) 


head(melted_df)

melted_df$Group <- gsub("\\_[A-Z][0-9]*", "", melted_df$variable)
melted_df$Group
head(melted_df)


#Draw boxplot  
pp5 <- ggplot(melted_df, aes(factor(variable), value)) + geom_boxplot(aes(fill = Group)) 

#Add axis title, legend title and adjust font size 
plot5 <- pp5 + theme(legend.key.size = unit(0.6, "cm"), legend.text = element_text(color= "Black", size= 6), axis.text.x = element_text(color= "Black", size= 6, angle = 90), axis.text.y = element_text(size=7, angle=45)) + xlab("Samples") + ylab("Gene Expression") + labs(fill = "Group") + labs(title= paste(" Boxplot for Read Count Data")) +  
  theme(plot.title = element_text(hjust = 0.5, size=12)) +
  scale_y_continuous(labels = scales::comma)

plot5

