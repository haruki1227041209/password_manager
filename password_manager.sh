#!/bin/sh

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください(Add Password/Get Password/Exit)："
read options

if [ "$options" = "Add Password" ]; then
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
fi
