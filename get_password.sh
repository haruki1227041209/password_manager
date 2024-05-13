
#!/bin/sh

echo "サービス名を入力してください："
read input_service_name
cat service_data.sh | grep "サービス名:$input_service_name" | awk '{ for(i=1; i<=NF; i++) print $i }'


