import os
import json
import nltk
import logging
import psycopg2
from time import sleep
from json import dumps, loads

from kafka import KafkaConsumer
from nltk.sentiment.vader import SentimentIntensityAnalyzer




nltk.download("vader_lexicon")
analyzer = SentimentIntensityAnalyzer()

# Connect to postgres
conn = psycopg2.connect(
    dbname=os.getenv("POSTGRES_DB"), 
    user=os.getenv("POSTGRES_USERNAME"),
    password=os.getenv("POSTGRES_PASSWORD"), 
    host=os.getenv("POSTGRES_HOST"), 
    port=os.getenv("POSTGRES_PORT")
)
cursor = conn.cursor()

# Connect kafka and create kafka consumer object
consumer = KafkaConsumer(topic="sentence", bootstrap_servers=['kafka:9092'],
    value_deserializer=lambda m: json.loads(m.decode("utf-8")))

# Consumer messages from the topic
for message in consumer:
    data = message.value 
    logging.info(f"Data: {data}")
    scores = analyzer.polarity_scores(data["sentence"])
    logging.info(scores["compound"])
    
    # Insert data into PostgreSQL
    cursor.execute(
        query="INSERT INTO sentences (sentence, sentiment) VALUES (%S, %S)",
        vars=(data["sentence"], scores["compound"])
    )
    conn.commit()



# Connect kafka and create kafka consumer object
# consumer = KafkaConsumer(topic='quickstart-events',bootstrap_servers=['kafka:9092'], 
#     value_deserializer=lambda m: json.loads(m.decode('utf-8')), auto_offset_reset='earliest')
# consumer.subscribe(['quickstart-events'])

# for event in consumer: print("Got event: ", event.value)