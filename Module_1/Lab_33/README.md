![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Encoding


## Method : Cleaning Plan

#headings of the colums
- start with this first

#cleaning after inspecting the dataframe : 
- profession : normalize to lowercase, change 'etudient' to 'student'
- missing values : birth year and profession (check the clientid to fill the values)
- need to change birth year type to int
- check for outlier
- check risk corellation

#coherence & data conistancy
- driver that is born in 2017 need to be changed

#replacing missing values
- check for clientid 
- last resort : replace by the mode or mean 

#low variance columns (can look at the number of unique values for categorical data columns)
- can remove low variance column when there are a lot (not the case here)

#outliers
- identifying them then see what we do with them

#check duplicates
- delete them


## Library 

- Pandas
- Scikit-Learn (for the encoding)

## Code

- Check in main.ipynb

## Result

- Check in main.ipynb