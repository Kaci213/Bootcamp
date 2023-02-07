![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)
# Lab | My first queries

Please, download the file applestore.csv.
Install MySQL/Postgresql on your computer.
Create a database
Upload the file as a new table of your database

Use the *data* table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**

Game, productivity, Weather, Shopping , Reference, Finance etc 

**2. Which is the genre with the most apps rated?**

Social networking

**3. Which is the genre with most apps?**

Games

**4. Which is the one with least?**

Medical

**5. Find the top 10 apps most rated.**

Facebook, Pandora, Pinterest, Bible, Angry Birds, Fruit Ninja Classic, Solitaire, Pac Man, Calories Counter, The Weather Channel

**6. Find the top 10 apps best rated by users.**

Plants vs zombie, Dominos Pizza, Plants vs Zombie HD, TurboScan pro, Sworkit, Fieldrunners 2, Headspace, :) Sudoku +, Drangon Island Blue, Sudoku+

**7. Take a look at the data you retrieved in question 5. Give some insights.**

Out of the 10 most rated apps, 9 of them are free, and only one is 1.99$ (Fruit Ninja)

**8. Take a look at the data you retrieved in question 6. Give some insights.**

Out of the 10 best user-rated apps, 7 of them are paying (from 0.99$ to 4.99$) and only 3 are free

**9. Now compare the data from questions 5 and 6. What do you see?**

Free apps are used by more people, but paying apps are best rated by their users

**10. How could you take the top 3 regarding both user ratings and number of votes?**    

Plants vs Zombies, Domino's Pizza USA, Plants VS Zombies HD

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

If we take the top 5 most rated apps, that are paying, we notice that they are all games. 
If we do the same with the top 5 rated free apps, we see that there is much more diversity of genre, with 2 Social Networking apps, 1 Music app, 1 Reference app and 1 game. 

We can also notice that the top 5 free apps are much more rated than the paying ones, indicating that more people use those free apps than the paying ones (considering that all users aren't necessarily raters). 

We can thus conclude that people do care about the price of an app, and it tends to vary between genres of apps. People are more likely to spend on games

## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
