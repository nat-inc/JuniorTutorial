//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Swift超入門#16 構造体〜プロパティ編

/*
 プロパティ　構造体の中で宣言された変数や定数
 イニシャライザ　構造体のプロパティを初期化する特別なメソッド
 メソッド　構造体の中で定義された関数
 */

struct Sample{
    let a = "こんにちは"
    var b:Int = 10
    var c = 3.14
}

//インスタンス化
var s = Sample()
print(s.a, s.b, s.c)
s.c = 2.718
print(s.c)

//確認問題
//1,2
struct Apple{
    let kind = "ふじ"
    var size = "L"
}

//3
var a = Apple()

//4
print(a.kind)

//5
print(a.size)

//6
a.size = "S"

//7
print(a.size)
