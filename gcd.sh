#!/bin/bash

# 正しく引数が指定されているかのチェック
# 1)引数の数
if [ $# -ne 2 ]; then
  echo "引数エラー(引数の数)：2つの自然数を引数に指定してください。"
  exit 1
fi

# 2)引数が整数かどうか
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] || ! [[ $2 =~ $re ]]; then
  echo "引数エラー(整数以外の値)：2つの自然数を引数に指定してください。"
  exit 1
fi

# 3)引数が自然数かどうか
if [ $1 -le 0 ] || [ $2 -le 0 ]; then
  echo "引数エラー(自然数以外の値)：2つの自然数を引数に指定してください。"
  exit 1
fi

# 引数を変数に格納
num1=$1
num2=$2

# num1とnum2の最大公約数を計算する関数
gcd() {
  local a=$1
  local b=$2
  while [ $b -ne 0 ]; do
   local temp=$(( $a % $b ))
   a=$b
   b=$temp
  done
  echo $a
}

result=$(gcd $num1 $num2)
#echo "$num1 と $num2 の最大公約数: $result"
echo $result
