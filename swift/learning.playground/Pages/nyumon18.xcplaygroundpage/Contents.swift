//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Swift超入門#18 構造体〜メソッド編

struct Student{
    var name:String
    var age:Int
    var points:[Int] //[国,数,英]
    //メンバーワイズイニシャライザ
    
    //平均点を計算するメソッド
    func ave() -> Float{
        var sum = 0
        for i in 0 ... 2{
            sum = sum + points[i]
        }
        return Float(sum) / 3 //Float(sum)でsumをFloat型として扱っている
    }
    
    func printInfo() -> Void{
        let ave = self.ave()
        let phrase = "氏名は\(name)です。\n試験の平均点は\(ave)です。"
        print(phrase)
    }
}

var s = Student(name:"小室", age:29, points:[70,79,85])
s.printInfo()

//確認問題
//1
struct Algebra{
    var a:Float
    var b:Float
    init(a:Float, b:Float){
        self.a = a
        self.b = b
    }
    
    func sum() -> Float{
        return a + b
    }
    
    func diff() -> Float{
        return a - b
    }
    
    func times() -> Float{
        return a * b
    }
    
    func div() -> Float{
        return a / b
    }
}

//2
var al = Algebra(a:2.5, b:2.0)

//3
print(al.a)

//4
print(al.b)

//5
print(al.sum())

//6
print(al.diff())

//7
print(al.times())

//8
print(al.div())


