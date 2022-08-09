//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//構造体は型としての機能を持つ

/*スタティック（タイプ）プロパティ

static let プロパティ名 = 値
基本的にはletを使う

*/

struct Prop{
    static let sProperty = "スタティックプロパティ"
    let iProperty = "インスタンスプロパティ"
}

print(Prop.sProperty) //型名.プロパティ名
print(Prop().iProperty)
//インスタンス名.プロパティ名

//実践的な例
struct Human{
    var name:String
    var age:Int
}

var h = Human(name:"Tom", age:23)
print(h)
print(type(of: h))

var i:Human

var arr = [10,20,30,40]
print(arr.count)

var ave = 0
for i in 0 ..< arr.count{
    ave = ave + arr[i]
}

ave = ave / arr.count
print(ave)

struct ClassRoom{
    var name:String //クラス名
    var num:Int //生徒数
    var teacher:Human //先生
    var students:[Human] //生徒
    
    init(name:String, teacher:Human, students:[Human]){
        self.name = name
        self.teacher = teacher
        self.students = students
        self.num = students.count
    }
    
    func getStudentName(){
        for i in 0 ..< self.students.count{
            print(self.students[i].name)
        }
    }
}

var t = Human(name:"Tom", age:40) //先生
var s1 = Human(name:"Alice", age:15) //生徒
var s2 = Human(name:"Bob", age:15)
var s3 = Human(name:"Charly", age:16)

var sArr = [s1, s2, s3]
print(sArr)

var cr:ClassRoom = ClassRoom(name:"3-A", teacher:t, students:sArr)

print(cr.teacher.name)
print(cr.num)

cr.getStudentName()


//スタティックプロパティorタイププロパティ：型に紐づくプロパティ
//例　Int型のmin/maxプロパティ
print(Int.min)
print(Int.max)
