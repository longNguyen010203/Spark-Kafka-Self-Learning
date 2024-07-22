import json
import pandas as pd
from time import sleep
from json import dumps, loads

from kafka import KafkaProducer



producer = KafkaProducer(
    bootstrap_servers=[':9092'],
    value_serializer=lambda x: dumps(x).encode('utf-8'))
producer.send(topic='quickstart-events', value={'surnasdasdame': 'parasdasdmar'})

dataframe = pd.read_csv(filepath_or_buffer='data/indexProcessed.csv')