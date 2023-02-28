![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Individual Project | Spotify Song Recommender

Using Spotipy (library to use the Spotify API) we can fetch songs and their accoustic features to compare them and group them in clusters. 
The idea of this project is to make song recommendations depending on a song's accoustic features.

## How does it work ?

Using a database of songs with their accoustic features (pulled with Spotipy), we create clusters of songs.

When the user inputs a song he wants to have recommendations based on, we analyse its accoustic features and match them to one of the clusters. We then generate a random song from the cluster (the recommended song).

**Important**: To be able to use Spotipy and connect to the API (and ultimately run this code) you have to create a Spotify developper account and copie the credentials in a python config file with these two lines:
client_id='******'  
client_secret='*****'

## Database

The database is composed of 8056 songs, that come from 4 different playlists (2 playlists of songs in English, 1 of songs in Spanish and 1 of songs in French). 

## Data treatment
To create clusters, we need first to standardise the data using standardscaler and save the scaler (using Pickle) for future use for the new user input song.

## Clustering
Using the Elbow Method and Silhouette Method, we can chose the number of clusters (8 in this case).

We then use the Kmeans model from the Scikit-Learn library to create the clusters. We must save the model (with Pickle) to match the input song with one of the 8 clusters.

## User interface 

To build this interface, we use Streamlit, which supports the embedded Spotify music player. 

## Files

1. Code in the Spotify.py file
2. Database in csv format
3. Scaler and Cluster model in pickle files
4. Screenshots of the streamlit interface
5. Readme

Note: no need of slides as you can use story instead.

Data: https://drive.google.com/drive/u/2/folders/1k5eP_8YuJDbnQ72uX37n53Oq_22NnY9G
