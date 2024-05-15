#!/bin/sh

until [ "$options" = "Exit" ]; do
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
		gpg service_data.sh.gpg
		echo "サービス名:$service_name ユーザー名:$user_name パスワード:$password" >> service_data.sh
		gpg -c service_data.sh
		rm service_data.sh
		echo "Thank you!"

	elif [ "$options" = "Get Password" ]; then
		echo "サービス名を入力してください："
		read input_service_name
		result_service=`gpg -d service_data.sh.gpg | grep "サービス名:$input_service_name"`
		result_service_name=`echo "$result_service" | awk '{print $1}'` 
		result_user_name=`echo "$result_service" | awk '{print $2}'`
		result_password=`echo "$result_service" | awk '{print $3}'`
		if [ "サービス名:$input_service_name" = "$result_service_name" ]; then
	 		echo "$result_service_name"
			echo "$result_user_name"
			echo "$result_password"
		else
			echo "そのサービスは登録されていません。"
		fi
	elif [ "$options" = "Exit" ]; then
		echo "Thank you!"
	else
		echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
	fi
done
