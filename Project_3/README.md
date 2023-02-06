![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Project 3 : Data Cleaning


## Method : Cleaning Plan

### Cleaning column names
- We started first by normalizing the naming of the columns

### Inspection of the dataframe
- Data types
- Cleaning the time_period column to have only 1 format
- One region had a typo so we have corrected it

### Coherence & data conistancy
- some years superior to 2023 so we have changed them to a data that is relevant (using the same data source and region of other countries)


### Replacing missing values
The idea was to preserve as much rows as possible, since the dataset is already short. Depending on the case, we decided to fill the vallues according to different approaches : 
- 1 region was missing, we filled it manually
- Several sub-regions were missing, we decided to fill them with the region 
- 1 data source was missing, we replaced it by 'unkown' as it is not a key information for an analysis
- Some income groups were missing, out of these, only one row had all the data so we decided to fill this income group by comparing the values for other income groups

### Columns
- There were 4 columns with more than 15% of missing values, so we have decided to drop them (it would have been impossible to make analyses with those columns, otherwise we would have had to drop too many rows)

### Outliers
- We have identified 1 outlier on the education index Total, and we supposed that it was an error of unit, so we just converted it by /100 to have it as a %

### Checkint duplicates
- No duplicated found

### Droping missing value rows
The 5 remaining rows with missing values were dropped, as all the numerical data was missing

## SQL Queries
We have exported the clean data as a csv file and imported it into MySQL. 

With our queries, we have created 3 different tables that show :
- The education index by region
- The education index by income group income
- Countries groupes by their income group

## Challenges
This dataset was quite short, so we could not afford to drop too many rows. We had to fill the missing values as much as we could.


## Code

- Check in main.ipynb

## Result
- In the beginning : dataset with 12 columns, 88 rows (29 of them with missing values)
- In the end : dataset with 8 columns, 83 rows (0 of them with missing values)

- Check in main.ipynb