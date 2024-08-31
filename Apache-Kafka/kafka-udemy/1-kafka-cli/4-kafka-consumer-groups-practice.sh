
##################################
#####     CONSUMER GROUPS    #####
##################################


# documentation for the cammand
bin/kafka-consumer-groups.sh

# list consumer groups
bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

# describe one specific group
bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
                             --describe \
                             --group my-first-application

# describe another group
bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 \
                             --describe \
                             --group my-second-application

# start a consumer
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
                              --topic first_topic \
                              --group my-first-application

