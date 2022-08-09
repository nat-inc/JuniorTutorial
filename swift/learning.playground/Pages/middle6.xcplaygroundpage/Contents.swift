import UIKit

var greeting = "Hello, playground"

//ユーザークラス
class User{
    let ID:Int
    var name:String
    var age:Int
    var type:UserType
    
    init(ID:Int,name:String,age:Int){
        self.ID = ID
        self.name = name
        self.age = age
        self.type = UserType()
    }
    
    func selfIntroduction(){
        var str = "初めましてこんにちは\n"
        str += "私は\(self.name)と申します。\n"
        str += "以後ご承知おきください。\n"
        print(str)
    }
    
    func userData(){
        var str = "ID:\(ID)\n名前:\(name)\n"
        str += "年齢:\(age)\nユーザータイプ:\(type)"
        print(str)
    }
}

//ユーザータイプ列挙型
enum UserType{
    case guest
    case host
    case owner
    
    static let guide = "これはユーザーのタイプを扱う型です。"
    
    init(){
        self = .guest
    }
    
    func printGuide(){
        print(UserType.guide)
    }
}

let user = User(ID: 10032, name:"竹村", age:30)
print(user.name)
user.selfIntroduction()
user.userData()

import Foundation
class Sphere{
    static let info = "球体を便利に扱うクラスです。"
    var radius:Double //ストアドインスタンスプロパティ　半径
    
    // イニシャライザ
    init(r:Double){
        radius = r
    }
    
    // コンピューテッドインスタンスプロパティ
    //球の表面積
    var area:Double{
        get{
            return 4 * Double.pi * radius * radius
        }
        set(p){
            radius = sqrt(p/(4*Double.pi))
        }
    }
    
    // コンピューテッドインスタンスプロパティ
    // 球の体積
    var volume:Double{
        get{
            return 4 / 3 * Double.pi * radius * radius * radius
        }
        set(p){
            radius = pow(3*p/(4*Double.pi),1/3)
        }
    }
    
    //　コンピューテッドタイププロパティ
    static var unit:Sphere{
        get{
            return Sphere(r:1.0)
        }
    }
    
    // 実は
    // ゲッタのみの時get省略可能  ←実用上重要
    // 処理が単行の時returnが省略可能　←実用上重要
    
    static var zero:Sphere{
        Sphere(r:1.0)
    }
    
}

let s = Sphere(r:10)

var value = s.area
print("表面積は\(value)")

print("変更前：\(s.radius)")
s.area = 100 //(p)に100が代入される
print("変更後：\(s.radius)")

let t = Sphere.unit
t.area
t.volume

//型が決まっていると型名の省略ができる
let u:Sphere = .zero

// 例
func printInfo(s:Sphere){
    var str = "球の情報を出力します\n"
    str += "半径：\(s.radius)\n"
    str += "表面積：\(s.area)\n"
    str += "体積：\(s.volume)\n"
}

printInfo(s: .unit)
printInfo(s: s)

//練習問題
class Tri{
    var width:Double
    var height:Double

    init(w:Double, h:Double){
        self.width = w
        self.height = h
    }
    
    var area:Double{
        get{
           return width * height / 2
        }
        set(p){
            let l = sqrt(2*p)
            width = l
            height = l
        }
    }
    
    static var unit:Tri{
        Tri(w:1, h:1)
    }
}
