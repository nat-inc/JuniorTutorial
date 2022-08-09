//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Swift入門下#1 extension

/*extenxion...型の拡張
 既に定義されている型に対して、ネストされた型、コンピューテッドプロパティ、メソッド、イニシャライザなどを新たにを追加できる
 
 ---書式---
 extension 型名{
   追加内容
 }
 
 */

//例　ユーザー管理を想定したもの
class ID{
    private static var _value:UInt = 0
    static var value:UInt{
        _value += 1
        return _value
    }
}  //private（アクセス修飾子）は自身の型の中からしか使えるもの。外からはアクセスできない。

struct User{
    var name:String
    var id:UInt
}

extension User{
    init(name:String){
        self.name = name
        self.id = ID.value
    }
    
    var userInfo:String{
        "ID:\(id) name:\(name)"
    }
    
    func printUserInfo(){
        print("User Information\n\(userInfo)")
    }
}

let a = User(name: "satoh")
a.printUserInfo()

let b = User(name: "suzuki")
b.printUserInfo()

//ちょっと数学的な例
struct Vector2D{
    var x:Double
    var y:Double
}

/*ベクトル...矢印、数字を並べたもの
 
 */

