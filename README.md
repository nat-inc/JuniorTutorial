# nat新入エンジニア研修

この研修の目標は2-3ヶ月で現在主流のWebアプリケーション全体的な基本知識を学び、簡単なWebアプリケーションを最初から作成する方法を知り、そして、自分の得意な特定の分野で簡単なコード作成できることです。

## 第〇章　はじめに

現在、私たちの生活には多くのWebアプリケーションがあります。これらは人間の生活に大きな利便性を提供します。あらゆる分野の人々に大きな利便性を提供する多くの専門的なアプリケーションもあります。もちろん、natが現在開発しているScanatもそのうちの1つです。これらのアプリケーションは、多くの賢いエンジニアによって構築されています。

まもなくnatのエンジニアになるため、エンジニアがやることとWebアプリケーションについてどれだけ知っていますか？

今から、あなたがエンジニアとアプリケーションについてどれだけ知っているかを見てみましょう。

ブラウザにURLを入力すると、Webページが表示されます。

あなた自身の知識に基づいて、このプロセスで何が起こったのかを詳しく説明してください。
この質問はインターネットで調べても問題ないです。調査中に理解できることと理解できないことを記録しておきましょう。
ネットワーク、OS、セキュリティ、DBなどの側面から答えてください。入社前に完了できれば良いです。
入社後、あなたの回答に基づいて、URLからアクセスできるシンプルなウェブサイトを作成していただきます。


## 第一章　入門

まず、URLからアクセスできるシンプルなウェブサイトを作成しましゅう。

### 1. ウェブサイトの作成すること

HTML，CSS，JavaScript（jQuery）を学びます。

おすすめの文章：

https://snome.jp/engineer/html1/

https://snome.jp/engineer/css1/

https://snome.jp/programming/jquery1/

[練習](Web/test.md)

### 2. サーバー構築
LinuxでNginx使われてサーバーを構築する。


## 第二章 Swift

### String

#### 1
一つのメソッドを達成する、このメソッドは一つ**Int**形のパラメータである、**String**形のArrayを戻る。

**String**形のArrayの中は**1**から**Int**形のパラメータまでの**String**を置いて。

ただし、

3の倍数の時、**Fizz**に替えて、

5の倍数の時、**Buzz**に替えて、

3と5の倍数の時、**FizzBuzz**に替えて。


Example 1:

```
Input: n = 3
Output: ["1","2","Fizz"]
```
Example 2:
```
Input: n = 5
Output: ["1","2","Fizz","4","Buzz"]
```
Example 3:
```
Input: n = 15
Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
```

#### 2
一つのメソッドを達成する、このメソッドは一つ**String**形のパラメータである、**Int**形の数字を戻る。

**Int**形数字の戻る値は**String**形のパラメータの中で繰り返しないの最初のアルファベットの順番です。
もし、繰り返しないのアルファベットはありませんの場合、**-1**を戻ります。

Example 1:

```
Input: s = "book"
Output: 0
```
Example 2:
```
Input: s = "scanatscan"
Output: 5
```
Example 3:
```
Input: s = "aabb"
Output: -1
```

#### 3
一つのメソッドを達成する、このメソッドは一つ**Int**形の**Array**パラメータである、**Int**形の数字を戻る。

**Int**形の**Array**パラメータの中で**0**と**1**だけである。

**Int**形数字の戻る値は**Array**パラメータの内の連続する**1**の最大数。

Example 1:

```
Input: nums = [1,1,0,1,1,1]
Output: 3
Tips: 最初の2桁または最後の3桁は連続した1です。 連続する1の最大数は3です。
```
Example 2:
```
Input: nums = [1,0,1,1,0,1]
Output: 2
```
Example 3:
```
Input: nums = [1,0,1,1,0,0,0,1,1,1,1]
Output: 4
```

#### 4
一つのメソッドを達成する、このメソッドは一つ**String**形の**Array**パラメータである、**String**形の**Array**を戻る。
**String**形の**Array**を戻る値はパラメータの中で米国のキーボードで同じ行の文字を使用して組み合わせできる単語。

米国のキーボードの中：

最初の行は文字： "qwertyuiop"。
第二行は文字 "asdfghjkl"。
第三行は文字 "zxcvbnm"。

![keyboard](https://user-images.githubusercontent.com/92193175/173963576-4afdb182-fe58-44fb-b5be-5e0534700c9e.png)

Example 1:

```
Input: words = ["Hello","Alaska","Dad","Peace"]
Output: ["Alaska","Dad"]
```
Example 2:
```
Input: words = ["omk"]
Output: []
```
Example 3:
```
Input: words = ["adsdf","sfd"]
Output: ["adsdf","sfd"]
```

#### 5

一つのメソッドを達成する、このメソッドは一つ**String**形のパラメータである、**String**を戻る。
**String**形戻る値はパラメータの内の各単語の文字の順序を逆にする。

Example 1:

```
Input：s = "Let's take LeetCode contest"
Output："s'teL ekat edoCteeL tsetnoc"
```
Example 2:
```
Input: s = "God Ding"
Output: "doG gniD"
```
Example 3:
```
Input: s = "scanat"
Output: "tanacs"
```

#### 6
一つのメソッドを達成する、このメソッドは二つ**Int**形の**Array**パラメータである、**Int**形の**Array**を戻る。
**Int**形の**Array**戻る値は二つパラメータ両方であるの値。

Example 1:
```
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2]
```
Example 2:
```
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [9,4]
```
Example 3:
```
Input: nums1 = [4,9,6], nums2 = [10,11,19]
Output: []
```

#### 7
一つのメソッドを達成する、このメソッドは二つ**String**形パラメータである、**Int**形を戻る。

もし、第一パラメータの中で第二パラメータである、
**Int**形戻る値は第一パラメータで第二パラメータのindex。
もし、第一パラメータの中で第二パラメータでない、
**Int**形戻る値は **-1**

Example 1:
```
Input: para1 = "hello", para2 = "ll"
Output: 2
```
Example 2:
```
Input: para1 = "scanat", para2 = "nat"
Output: 3
```
Example 3:
```
Input: para1 = "aaaaa", para2 = "bba"
Output: -1
```

#### 8
一つのメソッドを達成する、このメソッドは二つ**String**形パラメータである、**Bool**形を戻る。

第一パラメータはパターン、第二パラメータは文字列

パターンと文字列が与えられた場合、trueを戻る、それ以外はfalseを戻る。


Example 1:
```
Input: pattern = "abba", s = "dog cat cat dog"
Output: true
```
Example 2:
```
Input: pattern = "abba", s = "dog cat cat fish"
Output: false
```
Example 3:
```
Input: pattern = "aaaa", s = "dog cat cat dog"
Output: false
```


# Coming Soon
<!-- 
### プログラミング言語の基礎

--

### DB設計


--

ユーザー名、生年月日、性別、メールアドレス、電話番号などの情報を保存されるのユーザーテーブルを設計する。
1.テーブルを作成するのSQLステートメントを書きます。 


### ネットワーク

--

### 統合された知識

--
-->
