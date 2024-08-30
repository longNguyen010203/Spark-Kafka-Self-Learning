

#################################
#####     KAFKA PRODUCER    #####
#################################

# Đầu tiên ta cần tạo một topic
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic first_topic \
                    --create \
                    --partitions 3 

# producer
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
                              --topic first_topic

bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
                              --topic first_topic \
                              --producer-property acks=all

# Producer với 1 topic không tồn tại
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
                              --topic new_topic

bin/kafka-topics.sh --bootstrap-server localhost:9092 --list

# producer with keys
bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
                              --topic first_topic \
                              --property parse.key=true \
                              --property key.separator=: