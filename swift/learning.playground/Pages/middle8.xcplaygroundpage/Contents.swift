//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
// Swift入門中#8 失敗可能イニシャライザ --14:00



// デフォルトイニシャライザ
struct Apple{
    var area = "青森"
    var price = 200
    var name:String?
}
/*プロパティの型がオプショナルの時はイニシャライザで指定しなくてもいい
指定しない場合はデフォルトでnilが代入.もちろん初期値を入れてもいい*/
var a = Apple()
a.area
a.price
a.name

// メンバーワイズイニシャライザ　デフォルトで用意されているイニシャライザ
struct Banana{
    var area: String
    var price: Int
    var name: String?
}

var b = Banana(area:"青森", price:200)
/*initを使わなくても、プロパティ名だけでアクセスできるイニシャライザを内部に用意してくれる。*/

// カスタムイニシャライザ
struct Orange{
    var area: String
    var price: Int
    var name: String?
    init(sanchi:String, nedan:Int){
        self.area = sanchi
        self.price = nedan
    }
}

var o = (sanchi:"青森", nedan:200)

// 失敗可能イニシャライザ
/*文字通り失敗が可能なイニシャライザ
 処理が失敗したらnilになる。*/
struct User{
    var name:String
    init?(name:String?){
        guard let n = name else{
            return nil
        }
        self.name = n
    }
}
