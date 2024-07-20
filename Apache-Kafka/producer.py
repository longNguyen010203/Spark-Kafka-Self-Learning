import json
from kafka import KafkaProducer


producer = KafkaProducer(bootstrap_servers=['localhost:9092'])
with open('data/consumer_test.txt') as file: lines = file.readlines()

for line in lines:
    print("Printing", line)
    producer.send('quickstart-events', json.dumps({"Content": line}).encode('utf-8'))