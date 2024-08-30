

#########################
####    LOCALHOST    ####
#########################

bin/kafka-topics.sh

# Liệt kê danh sách Topics
bin/kafka-topics.sh --bootstrap-server localhost:9092 --list

# Tạo một topic có tên "first_topic"
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic first_topic \
                    --create

# Mô tả topic "first_topic"
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic first_topic \
                    --describe \

# Tạo một topic kết hợp chỉ định số lượng phân vùng
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic second_topic \
                    --create \
                    --partitions 3

# Tạo một topic kết hợp chỉ định số lượng phân vùng và hệ số sao chép
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic third_topic \
                    --create \
                    --partitions 3 \
                    --replication-factor 2
#   ==> Không thể chạy vì hệ số sao chép lớn hơn sốlượng broker

# Xóa một topic
bin/kafka-topics.sh --bootstrap-server localhost:9092 \
                    --topic first_topic \
                    --delete

# Mô tả một topic
bin/kafka-topics.sh --bootstrap-server localhost:9092 --topic first_topic --describe