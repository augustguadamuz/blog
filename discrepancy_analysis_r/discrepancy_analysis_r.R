# Comparing lists (for discrepancies) using R

# Let's start with a clean environment
rm(list = ls())

# repmis package is needed to pull data from dropbox
# plyr package is needed to rename columns
require("repmis")
require("plyr")

# load the CSV data directly from dropbox

list_1 <- source_DropboxData("list_1.csv", key="tv93kl0awjsj12l", sep=",", header=TRUE)
list_2 <- source_DropboxData("list_2.csv", key="3e1uo51ynm8i3ow", sep=",", header=TRUE)

# review the data

list_1
list_2

# column names appear to get changed when pulling from Dropbox; rename columns
list_1 <- rename(list_1, c("Product ID" = "Product.ID", "Wholesale Price" = "Wholesale.Price", stringsAsFactors = FALSE))
list_2 <- rename(list_2, c("Product ID" = "Product.ID", "Wholesale Price" = "Wholesale.Price", stringsAsFactors = FALSE))

# create a new data frame by merging list_1 and list_2 but keeping all columns 
x <- merge(list_1, list_2, by="Product.ID")

# let's look at the new data frame
x

# Print out the columns with those that have a mismatch in price or description:

x[x$Description.x != x$Description.y | x$Wholesale.Price.x != x$Wholesale.Price.y, ]



# Three main questions to answer
# Is the product ID in the other list?
# If the product ID is on the other list, does the description match?
# If the product ID is on the other list, do the wholesale prices match?


# See if the product ID sets are equal
setequal(list_1$Product.ID, list_2$Product.ID)

# Which product IDs exist in both lists
intersect(list_1$Product.ID, list_2$Product.ID)

# See which items are in list_1 but not in list_2
setdiff(list_1$Product.ID, list_2$Product.ID)

# See which items are in list_2 but not in list_1
setdiff(list_2$Product.ID, list_1$Product.ID)

# we can use the merge function to see the
# Product IDs that exist in both lists and have matching
# Description and Wholesale price

merge(list_1, list_2)

# functions to lookup
?intersect
?union
?match
?merge