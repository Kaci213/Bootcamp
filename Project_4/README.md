# Project | Project 4: Data visualization


## Our dataset

This dataset contains information from 3,395 high resolution electric vehicle charging sessions. The data contains sessions from 85 EV drivers with repeat usage at 105 stations across 25 sites at a workplace charging program. 
This dataset contains 3400 rows and 24 columns. 8 columns correspond to others columns encoded.  


## Project Goal

We have to create 12 charts using Matplotlib and 12 charts using Seaborn. Each set should have the distinct chart types including linear, bar, scatter, boxplot, pie, radar, multiple series chart and 3D charts..


## Working plan

We first planned our work on Trello listing all the tasks. The first step was to explorate the data, then clean it if necessary, and then define what would be useful charts. Finally, we divided and created the charts.  


## Data exploration

The column sessionId seems to be the primary key : there are no missing values in this column. 

- Duplicates 

There are no duplicates in the data set. 

- missing values 

Distance column contains more than 1000 missing values. This is the only column with missing values. The missing values in this column counts more than 30% of the column so we decided to drop the column. 

- outliers

We have found more than 600 rows containing outliers (excluding the encoded columns)

dollars          379
kwhTotal         261
chargeTimeHrs     59
endTime           21
startTime          6

Our understanding is that there is a correlation between the 3 top columns (in terms of outliers). The more time you charge your vehicle, the more you will have to pay and the more kwh you consume.

We understand that the column “ChargeTimers” is affecting the other columns as the time of charging increases the price or the kwh consuming. 
We think that it is useful to drop the outliers in this category, to be able to analyse more precisely the correlation without cases where the charge time is around 55 hours. These outliers can easily appear as usecase problems. 

## Data analysis and list of charts

- Correlation	(Clémence): 

-- correlation heatmap  SNS

-- correlation scatterplot between chargeTime and dollars SNS

-- correlation regplot between chargeTime and kwh (color points according to the manager status vehicle) PLT

-- charge time, dollar, kilowht 3D scatterplot PLT

- Analysis of the charge time  (Kaci)

--Distribution of this variable (box plot or histogram) PLT

--average time of charge per day in the week  histogram ( periodicity of charges in a week) PLT

--rush hours of charging per day in the week  multiple series lines ( periodicity of charges in a week) PLT


- Analysis of the amount paid (Clémence)

--line plot : amount paid & kwh SNS

--line plot : amount paid & charge time SNS


- Analysis of the effect of the managerial status on chargings (Kaci)

-- number of charging sessions per user grouping by manager status : stacked bar chart PLT

-- average time of charge according the manager status bar chart SNS

-- average kwhTotal between managerVehicle and non managerVehicle bar chart SNS

-- number of daily average charges, grouped by manager status radar chart PLT


- Analysis of stations (Clémence)

-- number of stations per location Treemap PLT

-- Top 10 : number of sessions per station bar chart SNS

-- top 10 : average daily sessions per station stacked bar chart PLT


- Analysis of the location ID (Kaci)

-- nb of charging sessions per location Treemap PLT

-- average charge time per location bar chart SNS

-- (for those that not = to 0) sum of paying ?  bar chart SNS

-- for top 10 nb of charge : distribution of managerial status per location stacked bar chart PLT

-- number of different locations per user


- Others (Clémence)

-- number of users using android or ios (pie chart) SNS

-- number of users per facility type (pie chart) SNS

-- number of chargings per facility type (pie chart) SNS

