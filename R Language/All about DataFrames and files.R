#  Data Frame is the columns in R 
# Create Custom Data Frame 
data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))

# Extracting Particular Subset from a dataframe it accepts rowNum and colNum
z <- data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))
z[3,1]

# Use the file.create() function to create a blank file. Place the name and the type 
# of the file in the parentheses of 
# the function. Your file types will usually be something like .txt, .docx, or .csv.

file.create("new_text_file.txt") 
file.create("new_word_file.docx") 
file.create("new_csv_file.csv") 



# Copy a file
# Copy a file with the file.copy() function. In the parentheses, add the name of 
# the file to be copied. Then, enter
# a comma, and add the name of the destination folder that you want to copy the file to. 
file.copy("new_text_file.txt", "destination_folder")



# You can delete R files with the unlink() 
#function. Enter the file’s name in the parentheses of the function.

unlink("new_csv_file.csv")

