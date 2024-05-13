
#!/bin/sh

echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read service_name
echo "ユーザー名を入力してください："
read user_name
echo "パスワードを入力してください："
read password

echo "サービス名:$service_nameユーザー名:$user_nameパスワード:$password" >> service_data.sh

echo "サービス名：$service_name"
echo "ユーザー名：$user_name"
echo "パスワード：$password"
echo "Thank you!"
