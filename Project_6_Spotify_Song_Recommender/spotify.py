import streamlit as st


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

import pickle
from sklearn import datasets 
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from matplotlib import pyplot
from sklearn.metrics import silhouette_score


import config
import spotipy
import json
from spotipy.oauth2 import SpotifyClientCredentials

#Initialize SpotiPy with user credentias in a config file
sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id= config.client_id,
                                                           client_secret= config.client_secret))


from IPython.display import display, IFrame, clear_output


import streamlit.components.v1 as components
from IPython.display import IFrame
from PIL import Image

#Importing the song database
df=pd.read_csv('playlist_f.csv')
audio_features=df[['danceability', 'energy', 'loudness', 'speechiness', 'acousticness','instrumentalness', 'liveness', 'valence', 'tempo']]

#Standardizing the values
scaler = StandardScaler()
scaler.fit(audio_features)
audio_features_scaled = scaler.transform(audio_features)

#Clustering
kmeans = KMeans(n_clusters=8, random_state=42)
kmeans.fit(audio_features_scaled)
# assign a cluster to each example
labels = kmeans.predict(audio_features_scaled)
# retrieve unique clusters
clusters = np.unique(labels)
df['cluster'] = labels


def song_features():

    user_audio_feature=sp.audio_features(final_song)

    user_audio_f=pd.DataFrame(user_audio_feature) 

    user_audio_f=user_audio_f[["danceability","energy","loudness","speechiness","acousticness","instrumentalness","liveness","valence","tempo"]]
    return(user_audio_f)

def song_standarizer():

    with open('scaler2.pickle', 'rb') as pickle_file:
        saved_scaler = pickle.load(pickle_file)

    scaled_user_input_song=saved_scaler.transform(user_audio_f)
    return(scaled_user_input_song)

def song_recommender(scaled_user_input_song):
    with open('kmeans_8_2.pickle', 'rb') as pickle_file2:
        saved_model = pickle.load(pickle_file2)

    closest_cluster_label=saved_model.predict(scaled_user_input_song)
    random_song_id=df[df['cluster']==int(closest_cluster_label)].sample()['id']
    random_song_id=random_song_id.values[0]
    
    st.write('---------------------------------------------------------------------------------------')

    st.write('Your recommended song ') 
    return(components.iframe("https://open.spotify.com/embed/track/"+random_song_id+"?utm_source=generator"))



#Layout

logo = Image.open('spotify_logo.png')
st.sidebar.image(logo, width=200)
st.sidebar.title('Spotify song recommender')

tab1, tab2, tab3 = st.tabs(["First Result", "Second Result", "Third Result"])

#Main code with the song search feature that calls the other functions

try:
    song_input = str(st.sidebar.text_input("Enter your song : "))
    results = sp.search(q=song_input,limit=9)
    final_song=''

    with tab1:
        st.write('Your spotify song') 
        track_id = results['tracks']['items'][0]['id']
        components.iframe("https://open.spotify.com/embed/track/"+track_id+"?utm_source=generator")
        final_song=track_id
        user_audio_f=song_features()
        scaled_user_input_song=song_standarizer()
        song_recommender(scaled_user_input_song)

    with tab2:
        st.write("Your spotify song")
        track_id = results['tracks']['items'][1]['id']
        components.iframe("https://open.spotify.com/embed/track/"+track_id+"?utm_source=generator")
        final_song=track_id
        user_audio_f=song_features()
        scaled_user_input_song=song_standarizer()
        song_recommender(scaled_user_input_song)

    with tab3:
        st.write("Your spotify song")
        track_id = results['tracks']['items'][2]['id']
        components.iframe("https://open.spotify.com/embed/track/"+track_id+"?utm_source=generator")
        final_song=track_id
        user_audio_f=song_features()
        scaled_user_input_song=song_standarizer()
        song_recommender(scaled_user_input_song)
except:
  # Prevent the error message that appears at the beggining when the song search is empty
    pass



# try:
#     user_song()
# # #   user_audio_f=song_features()
# # #   scaled_user_input_song=song_standarizer()
# # #   song_recommender(scaled_user_input_song)
# except:
#   # Prevent the error from propagating into your Streamlit app.
#     pass

