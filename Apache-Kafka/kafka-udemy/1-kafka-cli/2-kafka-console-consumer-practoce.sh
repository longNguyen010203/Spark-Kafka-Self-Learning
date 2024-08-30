

#################################
#####     KAFKA CONSUMER    #####
#################################


# consuming
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic second_topic

# producing in other terminal
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
    --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner \
    --topic second_topic

#  consuming from beginning
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                              --topic second_topic \
                              --from-beginning


bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                          --topic second_topic \
                          --formatter kafka.tools.DefaultMessageFormatter \
                          --property print.timestamp=true \
                          --property print.key=true \
                          --property print.value=true \
                          --property print.partition=true \
                          --from-beginning