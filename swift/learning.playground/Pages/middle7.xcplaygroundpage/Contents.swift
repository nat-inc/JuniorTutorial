//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
//　Swift入門中#7 プロパティオブザーバ
//ストアドプロパティの変更監視
//変更の前後で異なる処理を実装できる
//他のプロパティとの連携可

class ID{
    var id:Int = 0
    func getID() -> Int{
        id += 1
        return id
    }
}

class User{
    let id:Int
    var name:String{
        willSet{
            print("info:氏名が変更されようとしています。\(name)")
        }
        didSet{
            print("info:氏名が変更されました。\(name)")
            count += 1
        }
    }
    var count:Int
    init(id:ID,name:String){
        self.id = id.getID()
        self.name = name
        self.count = 0
    }
    
    func info(){
        var str = "ID:\(self.id)\n"
        str += "氏名:\(self.name)\n"
        str += "変更回数:\(self.count)"
        print(str)
    }
}

let id = ID()
var user = User(id:id,name:"Yamada")
user.info()
user.name = "Suzuki"
user.info()

/*
 willSetの中には新しく代入された値であるnewValue
 didSetの中には変更前の値であるoldValue
 という定数が暗黙に用意されている
 */

class Product{
    var name:String
    init(name:String){
        self.name = name
    }
    var stockNum:Int = 100{
        willSet{
            print("在庫数が変更されようとしています。")
            print("変更内容:\(stockNum) -> \(newValue)")
        }
        didSet{
            print("在庫数が変更されました。")
            print("変更内容:\(oldValue) -> \(stockNum)")
        }
    }
}

var apple = Product(name:"Macbook Pro")

apple.stockNum = 200
