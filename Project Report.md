# ETL-Project

### Extract:
* Original Data Source: https://www.kaggle.com/datasnaek/youtube-new
* Downloaded 2017-11-14 to 2018-06-14 record of 200 daily Videos of Youtube trending video as CAVideos.zip(Canada) and USVideos.zip(USA)
* Downloaded Youtube category_id matching category_name file as csv.
* The downloaded csv containing zip files were loaded in to python and read as csv files.

### Transform: Data Clean up
* Missing Values(NaN) for loaded data were found and filled with appropriate values.
* 'Trending_date' was casted as datetime from string object to have it filtered from 2018-06-01 to 2018-06-30 as the most recent data.
* 'comments_disabled','ratings_disabled','video_error_or_removed' columns were dropped since most values were 'False' and did not show any significant value to trending videos.

### Load: Database Normalization
* Entity Relation Diagram were drawn and used to breakdown and normalization the combine_df data.
* Combine_df was divided into 7 smaller tables (Video_basic,Video_stat,Category,Country,Trend,Publish,Channel) and saved as csv files so that each table set would contain unique values.
* Used pgAdmin4 to create tables in the database and imported above listed csv files.
* PostgreSQL was preferred over mongoDB since there were various unique values repeating over whole data set which means having schema would organize the more neatly and effectively.