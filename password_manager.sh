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

elif [ "$options" = "Get Password" ]; then
    echo "サービス名を入力してください："
	read input_service_name
	result_service=`grep "サービス名:$input_service_name" service_data.sh`
	result_service_name=`echo "$result_service" | awk '{print $1}'` 
	result_user_name=`echo "$result_service" | awk '{print $2}'`
	result_password=`echo "$result_service" | awk '{print $3}'`
	if [ "サービス名:$input_service_name" = "$result_service_name" ]; then
 		echo "サービス名：$result_service_name"
		echo "ユーザー名：$result_user_name"
		echo "パスワード：$result_password"
	else
		echo "そのサービスは登録されていません。"
	fi
fi
