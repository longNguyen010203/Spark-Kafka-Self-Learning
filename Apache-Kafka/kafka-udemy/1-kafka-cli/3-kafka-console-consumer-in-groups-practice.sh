
################################
####   CONSUMER IN GROUPS   ####
################################


# consumer with groups
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                            --topic second_topic \
                            --group my-first-application
# -- group <ten-nhom> ==> chỉ định một consumer groups
# consumer - thành viên đầu tiên của my-first-application group


bin/kafka-console-producer.sh --bootstrap-server localhost:9092 \
  --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner \
  --topic second_topic

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                            --topic second_topic \
                            --group my-first-application
# consumer - thành viên thứ hai của my-first-application group

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                            --topic second_topic \
                            --group my-first-application
# consumer - thành viên thứ ba của my-first-application group


bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                    --topic second_topic \
                    --group my-second-application \
                    --from-beginning