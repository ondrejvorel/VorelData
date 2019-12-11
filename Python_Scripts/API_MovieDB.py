# Import package
import requests
import json
import psycopg2, psycopg2.extras
from datetime import date

# Define list of extracted countries
countries = ["US","GB","CA","GR"]

# Define today variable
current_date=str(date.today())

# Set the connection to postgres running on localhost and pointing to "moviedb"
conn = psycopg2.connect(host="localhost",
                        database="moviedb",
                        port = "5432",
                        user="postgres",
                        password="123456")

# Define DELETE query - deleting all data which were already loaded in the current_date
# Define INSERT query - loading all movies which being currently played in theatre into "in_theatre" table
sql_truncate = """DELETE FROM public.in_theater WHERE "Date" =%s;"""
sql_insert = """INSERT INTO in_theater("Movie_ID","Title","Language","Country","Date") VALUES (%s,%s,%s,%s,%s);"""

# Create cursor variable
cur = conn.cursor()

# Execute DELETE query using the current_date variable
cur.execute(sql_truncate,[current_date])

#Go through all countries defined in the list and bring their data into DB
for country in countries:

    # Set up the parameters we want to pass to the API
    parameters = {  'api_key': '*****',
                    'Content-Type': 'application/json',
                    'region': country
                    }

    # Make a get request with the parameters.
    response = requests.get("https://api.themoviedb.org/3/movie/now_playing", params=parameters)


    # Print the content of the response into "json" file format
    data = json.loads(response.content.decode('utf-8'))

    # Go through all values gathered in data variable and extract (movie_id,title,language)
    for item in data['results']:
        movie_id = item['id']
        title = item['title']
        language = item['original_language']

        # Insert all defined values from above + country + current_date
        result = [movie_id,title,language,country,current_date]
        cur.executemany(sql_insert,[result])

# Commit the connection commands
conn.commit()

#close the connection
cur.close()	

