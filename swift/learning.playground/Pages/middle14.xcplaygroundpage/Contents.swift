//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Swift入門中#14 classと参照、他

//クラス...参照型、継承可

class A{
    var value = 10
    func info(){
        print("value:\(self.value)")
    }
}

class B:A{
    var message = "Hello"
    func greeting(){
        print(self.message)
        self.info()
    }
}

/*オーバーライド
 サブクラスでスーパークラスのプロパティ、メソッドを上書きしたい時に使う
 staticはoverrideできない。 */

//オーバーライドの例
class C{
    var value = 10
    func show(){
        print(value)
    }
}

class D:C{
    override func show(){
        print("値は\(value)です")
    }
}

/* クラスプロパティ...コンピューテッド
 クラスに紐づく
 
 クラスメソッド...クラスに紐づく
 
 */

class T{
    class var value:String{
        "Hello"
    } //クラスプロパティ。getのみで、読み取り専用で書く
    
    class func show(){
        print(self.value)
    } //クラスメソッド
}

/*
 クラスとは型を定義するための仕組みの一つ。
 構造体とよく似ているが、構造体は値型であるのに対し、クラスは参照型。
 また、クラスは他の型である構造体や列挙型と異なり継承が可能。
 継承とは既に定義されているクラスを引き継いで新たなクラスを定義する仕組み。
 */

//例

class Human{
    //ストアドインスタンスプロパティ
    var name:String
    var age:Int
    var habit:String?
    
    //initはオプショナル以外のプロパティに対し必須
    init(name:String, age:Int){
        self.name = name
        self.age = age
    }
    
    //インスタンスメソッド
    func greeting(){
        print("こんにちは、私の名前は\(name)です。")
    }
    
    //コンピューテッドタイププロパティ
    static var anonymous: Human{
        Human(name: "", age: 0)
    }
    
    //コンピューテッドインスタンスプロパティ
    var message: String{
        get{
            if let s = habit{
                return s //habitがnilでない場合の処理
            }else{
                return "えーっと"  //habitがnilの場合の処理
            }
        }
        set{
            habit = newValue
        }
    }
}

var h = Human(name:"竹村", age: 31)
h.greeting()
print(h.message)
h.message = "プログラミング大好き"
print(h.message)

//クラスは参照型
var i = h
i.message = "園芸大好き"
print(h.message)

/*
 クラスの継承とは新たなクラスを定義するときに、既に定義されているクラスのプロパティ、メソッドを引き継ぎたい場合に使用する仕組み。オブジェクト指向言語において継承はとても重要。引き継ぎ元の定義を再利用できるため、引き継ぎ元のクラスを継承した新たなクラスの実装労力を小さくする事ができるから。
 
 　　　スーパークラス
 　　　　　　↑
 　　　　サブクラス
 継承でできること
 1.サブクラスはスーパークラスのプロパティ、メソッドを引き継ぐ（定義せず使用できる）
 2.サブクラスではプロパティ、イニシャライザ、メソッドを新たに定義できる
 3.サブクラスにおいてスーパークラスにアクセスするときはsuper.を使用する
 4.サブクラスではコンピューテッドプロパティ、イニシャライザ、メソッドのオーバーライドができる
 
 class サブクラス名：スーパークラス名{
 　　プロパティ定義
 　　イニシャライザ定義
 　　メソッド定義
 */

//RPGを意識して継承を行う
class NPC:Human{
    var item:String?
    
    init(name:String,age:Int,item:String?){
        self.item = item
        super.init(name:name, age:age) //スーパークラスは既にイニシャライザを持っているのでそれを最後に実行。NPCの自身のプロパティたちを先に初期化することが必要。ここを上下するとエラーになる。
    }
    
    //貰えるもの
    var gift:String?{
        item
    }
}

class Player:Human{
    var job:String
    var weapon:String?
    var armor:String?
    var bag = [String]()
    
    init(name:String,age:Int,job:String){
        
        //追加したプロパティを先に初期化
        self.job = job
        //最後にスーパークラスのイニシャライザを実行
        super.init(name:name, age:age)
    }
    
    func action2NPC(char:NPC){
        print("\n\(name):こんにちは")
        print("\(char.name):こんにちは")
        if let gift = char.gift{
            print("\(char.name):これ、いらないのであげます")
            print("\(name)は\(gift)をもらった")
            bag.append(gift)
        }
    }
    
    func showBag(){
        print(bag)
    }
}

let n1 = NPC(name:"山田", age:20, item: "ポーション")
let n2 = NPC(name:"佐藤", age:30, item: nil)
let n3 = NPC(name:"鈴木", age:25, item: "魔剣")

let p = Player(name:"田中", age:20, job:"一般人")

p.showBag()
p.action2NPC(char: n1)
p.action2NPC(char: n2)
p.action2NPC(char: n3)

p.greeting()
print(p.message)

/*
 オーバーライドとは上書きのこと。
 継承の場面によってはサブクラスでスーパークラスと同じ名前のメソッドにしたいが、処理は変えたい場面がある。
 その場合、サブクラスでスーパークラスのメソッドを上書きするオーバーライドという仕組みが用意されている。
 オーバーライドをするにはイニシャライザ定義やメソッド定義の先頭にoverrideキーワードを付与する。
 */

class Hero:Player{
    init(name:String,age:Int){
        super.init(name: name, age: age, job: "勇者" )
    }
        override func greeting(){
            print("こんにちは、私の名前は\(name)です")
            print("勇者やってます、よろしく！")
        }
        
        //コンピューテッドインスタンスプロパティ
        override var message:String{
            get{
                if let s = habit{
                    return s
                }else{
                    return "僕は勇者勇者勇者勇者勇者勇者勇者勇者勇者勇者"
                }
            }set{
                habit = newValue
            }
        }
    }

class Wizard:Player{
    init(name:String,age:Int){
        super.init(name: name, age: age, job: "魔法使い" )
    }
        override func greeting(){
            print("こんにちは、私の名前は\(name)です")
            print("魔法使いです。")
        }
        
        //コンピューテッドインスタンスプロパティ
        override var message:String{
            get{
                if let s = habit{
                    return s
                }else{
                    return "あの薬草とこの鉱石を。。。"
                }
            }set{
                habit = newValue
            }
        }
}

var hero = Hero(name:"安藤", age:18)
var wiz = Wizard(name:"木下", age:20)

hero.greeting()
print(hero.message)
wiz.greeting()
print(wiz.message)

hero.action2NPC(char: n1)
hero.action2NPC(char: n3)
hero.showBag()

class Sample{
    class var value:String{
        "こんにちは"
    }
    class var amount:Int{
        10
    }
    class func showAmount(){
        print("amount:\(self.amount)")
    }
}

var str = Sample.value
print(str)


class Test:Sample{
    override class var value:String{
        "Hello, swift world!"
    }
    
    override class func showAmount(){
        print("amount:\(self.amount) pieces")
    }
    
    override class var amount:Int{
        20
    }
}
