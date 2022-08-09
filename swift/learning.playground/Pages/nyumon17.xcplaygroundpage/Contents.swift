//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Swift超入門#17 構造体〜イニシャライザ編

//「self.プロパティ名 = 値」でプロパティを初期化する（self.プロパティ名でプロパティにアクセスする）


struct Box{
    var width:Float
    var length:Float
    var height:Float
    var volume:Float
    init(w:Float, l:Float, h:Float){
        self.width = w
        self.length = l
        self.height = h
        self.volume = w * l * h
    }
}

//メンバーワイズイニシャライザ
struct Cube{
    var l : Float
}

var c = Cube(l: 3.0)


print(c.l)

//練習問題
//1,2,3
struct Sphere {
    var radius:Float
    var volume:Float
    var surface:Float
    init(r:Float){
        radius = r
        volume = 4/3 * 3.141592 * r * r * r
        surface = 4 * 3.141592 * r * r
    }
}

//4
var s = Sphere(r:5)

//5
print(s.radius, s.volume, s.surface)


