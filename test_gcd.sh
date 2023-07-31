#!/bin/bash

# 結果比較関数
DIFF_CHECK(){
  difference=$(diff "/tmp/$$-ans" "/tmp/$$-result")
    if [ -z "$difference" ]; then
      cat "/tmp/$$-result"
    else
      echo "ERROR: $testname" >> /tmp/$$-error.log
      ERROR_EXIT
    fi
}

# エラー用関数
ERROR_EXIT(){
if [ -f /tmp/$$-error.log ];then
  cat /tmp/$$-error.log 1>&2
  rm -f /tmp/$$-*
  exit 1
fi
#  echo $1 1>&2
#  rm -f /tmp/$$-*
#  exit 1
}

# エラー用関数
ERROR_EXIT(){
  echo $1 1>&2
  rm -f /tmp/$$-*
  exit 1
}

# test1 引数なし
./gcd.sh
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test1）"
fi

# test2 引数が一つ(5)
num1=5
./gcd.sh $num1
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test2）"
fi

# test3 引数が三つ(18, 72, 63)
num1=18
num2=72
num3=63
./gcd.sh $num1 $num2 $num3
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test3）"
fi

# test4 引数に文字(aY, Bz)
num1=aY
num2=Bz
./gcd.sh $num1 $num2
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test4）"
fi

# test5 引数に自然数以外の数(0.4, 6.6)
num1=0.4
num2=6.6
./gcd.sh $num1 $num2
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test5）"
fi

# test6 引数に負の数(-8, -12)
num1=-8
num2=-12
./gcd.sh $num1 $num2
if [ $? -eq 0 ]; then
  echo "想定外のエラー発生（test6）"
fi

# test7-01 正常動作確認（4, 12 -> 4）
testname="test7-01"
# 正答設定（想定する結果を$$-ansに）
echo "4" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 4 12 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-02 正常動作確認（1000, 25 -> 25）
testname="test7-02"
# 正答設定（想定する結果を$$-ansに）
echo "25" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 1000 25 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-03 正常動作確認（825, 762 -> 3）
testname="test7-03"
# 正答設定（想定する結果を$$-ansに）
echo "3" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 825 762 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-04 正常動作確認（654, 636 -> 6）
testname="test7-04"
# 正答設定（想定する結果を$$-ansに）
echo "6" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 654 636 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-05 正常動作確認（748, 516 -> 4）
testname="test7-05"
# 正答設定（想定する結果を$$-ansに）
echo "4" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 748 516 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-06 正常動作確認（799, 918 -> 17）
testname="test7-06"
# 正答設定（想定する結果を$$-ansに）
echo "17" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 799 918 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-07 正常動作確認（396, 451 -> 11）
testname="test7-07"
# 正答設定（想定する結果を$$-ansに）
echo "11" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 396 451 > /tmp/$$-result
# 結果を比較
DIFF_CHECK

# test7-08 正常動作確認（21679, 18183 -> 19）
testname="test7-08"
# 正答設定（想定する結果を$$-ansに）
echo "19" > /tmp/$$-ans
# テスト実行（実行結果を$$-resultに）
./gcd.sh 21679 18183 > /tmp/$$-result
# 結果を比較
DIFF_CHECK
