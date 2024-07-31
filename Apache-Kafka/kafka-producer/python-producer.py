import json
import time
import logging
import schedule
import pandas as pd
from faker import Faker
from time import sleep
from json import dumps

from kafka import KafkaProducer



KAFKA_NODES = "kafka:9092"
MY_TOPIC = "sentence"

def kafka_generate_data() -> None:
    
    fakeDataTestingObject = Faker()
    # Connect kafka and create kafka producer object
    producer = KafkaProducer(bootstrap_servers=[KAFKA_NODES], 
        value_serializer=lambda m: json.dumps(m).encode("utf-8")
    )
    my_FakeData = {"sentence": fakeDataTestingObject.sentence()}
    logging.info(f"Data fake using in proj: {my_FakeData}")
    producer.send(topic=MY_TOPIC, value=my_FakeData)
    producer.flush()
    

# producer = KafkaProducer(topic='sentences', bootstrap_servers=['kafka:9092'],
#     value_serializer=lambda m: dumps(m).encode('utf-8'))
# producer.send(topic='sentences', value={'surnasdasdame': 'parasdasdmar'})

# dataframe = pd.read_csv(filepath_or_buffer='data/indexProcessed.csv')


if __name__ == '__main__':
    time.sleep(5)
    kafka_generate_data()