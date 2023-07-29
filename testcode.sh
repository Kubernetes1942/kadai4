#!/bin/bash

# 最大公約数シェルスクリプトのパス
GCD_SCRIPT="./GCDJIMMORI.sh"

# テスト1-1: 英字が少なくとも一方の引数に入力されていると、エラーになる
result=$($GCD_SCRIPT cat 4)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト1-1: 成功"
else
    echo "テスト1-1: 失敗"
    exit 1
fi

# テスト1-2: 和文が少なくとも一方の引数に入力されていると、エラーになる
result=$($GCD_SCRIPT 日本 4)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト1-2: 成功"
else
    echo "テスト1-2: 失敗"
    exit 1
fi

# テスト1-3: 引数を逆転させて一方を文字にしても、エラーになる。
result=$($GCD_SCRIPT 4 日本)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト1-3: 成功"
else
    echo "テスト1-3: 失敗"
    exit 1
fi


# テスト2: 引数が1つしかないと、エラーになる
result=$($GCD_SCRIPT 3)
if [[ "$result" == *"引数は二つ指定してください。"* ]]; then
    echo "テスト2: 成功"
else
    echo "テスト2: 失敗"
    exit 1
fi

# テスト3：引数が2つのときは、正常に結果が出力される
# テスト3-1: 7と91を入力し、7が出力されるか確認
result=$($GCD_SCRIPT 7 91)
if [[ "$result" == "選んだ二数の最大公約数は7です。"* ]]; then
    echo "テスト3-1: 成功"
else
    echo "テスト3-1: 失敗"
    exit 1
fi

# テスト3-2　91と7を入力し、7が出力されるか確認(逆にしても成立する)
result=$($GCD_SCRIPT 91 7)
if [[ "$result" == "選んだ二数の最大公約数は7です。"* ]]; then
    echo "テスト3-2: 成功"
else
    echo "テスト3-2: 失敗"
    exit 1
fi

# テスト3-3　747と18を入力し、9が出力されるか確認
result=$($GCD_SCRIPT 747 18)
if [[ "$result" == "選んだ二数の最大公約数は9です。"* ]]; then
    echo "テスト3-3: 成功"
else
    echo "テスト3-3: 失敗"
    exit 1
fi


# テスト4：引数が3つ以上でも、エラーになる。
result=$($GCD_SCRIPT 2 4 8)
if [[ "$result" == *"引数は二つ指定してください。"* ]]; then
    echo "テスト4: 成功"
else
    echo "テスト4: 失敗"
    exit 1
fi

# テスト5-1: 引数に負の数があると、エラーになる
result=$($GCD_SCRIPT -5 10)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト5-1: 成功"
else
    echo "テスト5-1: 失敗"
    exit 1
fi

# テスト5-2: 引数に負の数があると、エラーになる(引数逆転)
result=$($GCD_SCRIPT 10 -5)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト5-2: 成功"
else
    echo "テスト5-2: 失敗"
    exit 1
fi

# テスト6: 引数が両方ともゼロの場合、エラーになる
result=$($GCD_SCRIPT 0 0)
if [[ "$result" == *"両方がゼロのとき、最大公約数はありません。"* ]]; then
    echo "テスト6: 成功"
else
    echo "テスト6: 失敗"
    exit 1
fi

# テスト7-1: 引数の一方が小数だと、エラーになる(両方とも小数や、両方とも分数のケースも含む)
result=$($GCD_SCRIPT 0.5 10)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト7-1: 成功"
else
    echo "テスト7-1: 失敗"
    exit 1
fi

# テスト7-2: 引数の一方が小数だと、エラーになる(引数を逆にしても同じ)
result=$($GCD_SCRIPT 10 0.5)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト7-1: 成功"
else
    echo "テスト7-1: 失敗"
    exit 1
fi


# テスト7-3: 引数の双方が小数だと、割り切れる場合でもエラーになる
result=$($GCD_SCRIPT 0.7 1.4)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト7-3: 成功"
else
    echo "テスト7-3: 失敗"
    exit 1
fi

# テスト8-1: 引数の一方が分数だと、エラーになる
result=$($GCD_SCRIPT 1/2 10)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト8-1: 成功"
else
    echo "テスト8-1: 失敗"
    exit 1
fi

# テスト8-2: 引数の一方が分数だと、エラーになる(引数逆転)
result=$($GCD_SCRIPT 10 1/2)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト8-2: 成功"
else
    echo "テスト8-2: 失敗"
    exit 1
fi


# テスト8-3：引数双方が分数だと、エラーになる
result=$($GCD_SCRIPT 1/2 1/4)
if [[ "$result" == *"不正な入力です。ゼロ以上の整数を入力してください。"* ]]; then
    echo "テスト8-3：成功"
else
    echo "テスト8-3：失敗"
    exit 1
fi


# テスト9-1：引数の一方がゼロの場合、もう一方の引数が最大公約数となる
result=$($GCD_SCRIPT 0 39)
if [ "$result" == "選んだ二数の最大公約数は39です。" ]; then
    echo "テスト9-1: 成功"
else
    echo "テスト9-1: 失敗"
    exit 1
fi

# テスト9-2：引数の一方がゼロの場合、もう一方の引数が最大公約数となる(引数逆転)
result=$($GCD_SCRIPT 39 0)
if [ "$result" == "選んだ二数の最大公約数は39です。" ]; then
    echo "テスト9-2: 成功"
else
    echo "テスト9-2: 失敗"
    exit 1
fi


# テスト10-1：ワイルドカードは引数として使えない
result=$($GCD_SCRIPT * 39)
if [[ "$result" == *"引数は二つ指定してください。"* ]]; then
    echo "テスト10-1: 成功"
else
    echo "テスト10-1: 失敗"
    exit 1
fi


# テスト10-2：ワイルドカードは引数として使えない
result=$($GCD_SCRIPT 39 *)
if [[ "$result" == *"引数は二つ指定してください。"* ]]; then
    echo "テスト10-2: 成功"
else
    echo "テスト10-2: 失敗"
    exit 1
fi

# テスト11：大きな数(27000001の素因数分解)
result=$($GCD_SCRIPT 27000001 89701)
if [[ "$result" == "選んだ二数の最大公約数は89701です。"* ]]; then
    echo "テスト11: 成功"
else
    echo "テスト11: 失敗"
    exit 1
fi



echo "全てのテストに成功しました。"

