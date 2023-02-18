import streamlit as st
import pandas as pd
import numpy as np
import sklearn
from sklearn import datasets
import matplotlib as plt
import seaborn as sns

breast_cancer = datasets.load_breast_cancer(as_frame=True)
breast_cancer_df = pd.concat((breast_cancer["data"], breast_cancer["target"]), axis=1)
breast_cancer_df["target"] = [breast_cancer.target_names[val] for val in breast_cancer_df["target"]]

st.set_page_config(layout="wide")
st.markdown('Breast Cancer Stats')

##################### Layout Application ##################

container1 = st.container()
col1, col2 = st.columns(2)

with container1:

    with col1:
        # Select box for x and y axis
        st.sidebar.markdown('Scatter Plot :')
        selectbox_x = st.sidebar.selectbox( "Select a value for x:", breast_cancer_df.columns.tolist() )
        selectbox_y = st.sidebar.selectbox( "Select a value for y:", breast_cancer_df.columns.tolist() )
        ####### Scatter Plot
        st.markdown('Scatter Plot')
        scatter_fig=sns.relplot(x=selectbox_x,y=selectbox_y, data=breast_cancer_df)
        st.pyplot()
        st.set_option('deprecation.showPyplotGlobalUse', False)

    with col2:
        ####### Select multiset elements
        st.sidebar.markdown('Bar Chart')
        bar_axis = st.sidebar.multiselect(label="Average Measures per Tumor Type Bar Chart", options=breast_cancer_df.columns.tolist(),default=["mean radius","mean texture", "mean perimeter", "area error"], key=1)
        ####### Bar Chart
        st.markdown('Bar Chart')
        dfplot = breast_cancer_df[bar_axis].mean()
        st.bar_chart(data=dfplot)

container2 = st.container()
col3, col4 = st.columns(2)

with container2:
    
    with col3:
        ####### Multi-Select and Radio Buttons for Histogram
        st.sidebar.markdown('Histogram')
        bar_axis2 = st.sidebar.multiselect(label="Average Measures per Tumor Type Bar Chart", options=breast_cancer_df.columns.tolist(),default=["mean radius","mean texture", "mean perimeter", "area error"], key=2)
        beans=st.sidebar.radio("Select the bin size for your histogram",(5, 10, 20))
        ####### Histogram
        st.markdown('Histogram')
        hist_fig=sns.histplot(breast_cancer_df[bar_axis2].melt(), x='value', hue='variable', multiple='dodge', shrink=.75, bins=beans)
        st.pyplot()

    with col4:
        ####### Hexbin chart for density exploration
        st.sidebar.markdown('Density exploration hexbin chart')
        selectbox_1 = st.sidebar.selectbox( "Select value 1:", breast_cancer_df.columns.tolist() )
        selectbox_2 = st.sidebar.selectbox( "Select value 2:", breast_cancer_df.columns.tolist() )
        
        st.markdown('Hexbin Chart')
        hexbin_fig=breast_cancer_df.plot.hexbin(x=selectbox_1, y=selectbox_2,
                                    reduce_C_function=np.mean,
                                    gridsize=25,
                                    cmap="Greens",
                                    );
        st.pyplot()