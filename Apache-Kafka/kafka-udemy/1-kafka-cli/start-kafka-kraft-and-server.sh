######################
###   KAFKA KRAFT  ###
######################

# Tạo một Cluster ID
KAFKA_CLUSTER_ID="$(bin/kafka-storage.sh random-uuid)"

# Định dạng thư mục log
bin/kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c config/kraft/server.properties

# Start kafka server
bin/kafka-server-start.sh config/kraft/server.properties