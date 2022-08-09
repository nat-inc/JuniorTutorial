import UIKit

var greeting = "Hello, playground"

@propertyWrapper
struct SmallNumber {
    var number = 0
    var projectedValue = false
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)
//
//struct Taiyaki {
//    var nakami = "あんこ"
//    func sayNakami(){
//        print("中身は" + nakami + "です。")
//    }
//}
//
//var taiyaki = Taiyaki()
//taiyaki.sayNakami()
//taiyaki.nakami = "クリーム"
//taiyaki.sayNakami()

struct Taiyaki {
    var nakami = "あんこ"
    func sayNakami(){
        print(nakami)
    }
}

var taiyakiA = Taiyaki()
var taiyakiB = taiyakiA
taiyakiB.nakami = "クリーム"
taiyakiA.sayNakami()
taiyakiB.sayNakami()

class Taiyaki2 {
    var nakami = "あんこ"
    func sayNakami(){
        print(nakami)
    }
}


var taiyakiA2 = Taiyaki2()
var taiyakiB2 = taiyakiA2
taiyakiB2.nakami = "クリーム"
taiyakiA2.sayNakami()
taiyakiB2.sayNakami()


struct Square {
    var sideLength = 3
    var area:Int {
        sideLength * sideLength
    }
}

let square = Square()
print(square.area)

struct Iphone {
    var language:String
    var passcode:String
    init(language:String,passcode:String){
        self.language = language
        self.passcode = passcode
    }
}

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
}
func makeNoise() {
    
}

let someVehicle = Vehicle()

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle:\(bicycle.description)")

class Tandem:Bicycle{
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Car: Vehicle {
    var gear = 1
    override var description:String {
        return super.description + " in gear \(gear)"
        
    }
}

let car = Car()

car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int (currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar:\(automatic.description)")

struct Apple{
    let kind = "ふじ"
    var size = "L"
}

var a = Apple()
print(a.kind)
print(a.size)
a.size = "S"
print(a.size)

//struct Sphere{
//    var radius:Float
//    var volume:Float
//    var surface:Float
//    init(r:Float){
//        self.radius = r
//        self.volume = 4/3*3.141592*r*r*r
//        self.surface = 4*3.141592*r*r
//    }
//}
//
//var s = Sphere(r:5)
//print(s.radius, s.volume, s.surface)

struct Algebra{
    var a:Float
    var b:Float
    init(a:Float,b:Float){
        self.a = a
        self.b = b
    }
    func sum() -> Float{
        return (a + b)
    }
    
    func diff() -> Float{
        if a >= b{
            return (a - b)
        }else {
            return (b - a)
        }
    }
    
    func times() -> Float{
        return (a * b)
    }
    
    func div () -> Float{
        if a >= b{
            return (a / b)
        }else {
            return (b / a)
        }
    }
}
let al = Algebra(a:2.5, b:2.0)
print(al.a)
print(al.b)
print(al.sum())
print(al.diff())
print(al.times())
print(al.div())

struct Human{
    var name:String
    var age:Int
}

var h = Human(name:"Tom", age:23)
print(h)
print(type(of:h))

struct Sphere{
    static let info = "これは球を扱うための構造体です。"
    var r:Double
    
    init(radius:Double){
        self.r = radius
    }
    
    func getVolume() -> Double{
        let v = (4/3) * Double.pi * r * r * r
        return v
    }
    
    func getSurface() -> Double{
        let s = 4 * Double.pi * r * r
        return s
    }
}

var s = Sphere(radius:10.0)
s.getVolume()
s.getSurface()

var s1 = Sphere(radius:0.1)
var s2 = Sphere(radius:0.5)
var s3 = Sphere(radius:1.0)
var s4 = Sphere(radius:2.0)
var s5 = Sphere(radius:3.0)
var arr = [s1,s2,s3,s4,s5]
var surfaceOfAll:Double = 0
for i in 0..<arr.count{
    surfaceOfAll = surfaceOfAll + arr[i].getSurface()
}
print(surfaceOfAll)

var aveV:Double = 0
let n:Double = Double(arr.count)
for i in 0..<arr.count{
    aveV = aveV + arr[i].getVolume()
}
aveV = aveV / n
print(aveV)

var num = 0
var ratio = arr[0].getSurface() / arr[0].getVolume()
for i in 1..<arr.count{
    let sample = arr[i].getSurface() / arr[i].getVolume()
    if ratio < sample{
        ratio = sample
        num = i
    }
}

print("比が最大のものは半径が\(arr[num].r)のものです。")

//タプル
var greeting5 = (hello:"Hello",
                nice:"Nice to meet you.",
                have:"Have a nice day.")
print(greeting5.hello)
print(greeting5.nice)
print(type(of:greeting5))

let const:(pi:Double, e:Double)
print(type(of:const))
const = (3.141592653, 2.718281828)

func vRect(aa:Double, bb:Double, cc:Double) -> Double{
    return aa * bb * cc
}

print("関数の型↓")
print(type(of: vRect))

func divide(value:Double,m:Double,n:Double) -> (m:Double,n:Double){
    let mValue = value * m / (m + n)
    let nValue = value * n / (m + n)
    return (m:mValue,n:nValue)
}

print(divide(value:10, m:2,n:3))
var div = divide(value:10, m:2,n:3)
print(div.m)

//オプショナル
let name5:String = "Kuruma Torajirou"
let birthday5:String
var mobilePhone: String? = nil
var address: String? = nil

//オプショナル型は宣言のみだとnilが代入される
var optValue:Bool?
print(optValue)


//nilが自動で代入されているため、イニシャライザされなくてもエラーにならない↓
struct User{
    var name:String
    var address:String?
    
    init(name:String){
        self.name = name
    }
    
    init(name:String, address:String){
        self.name = name
        self.address = address
    }
}

var user = User(name:"車寅次郎")
print(user)


//クラス
class Human5{
    //ストアドインスタンスプロパティ
    var name:String
    var age:Int
    var habit:String?
    
    //initはオプショナル以外のプロパティに対し必須
    init(name:String,age:Int){
        self.name = name
        self.age = age
    }
    
    //インスタンスメソッド
    func greeting5(){
        print("こんにちは、私の名前は\(name)です。")
    }
    
    //コンピューテッドタイププロパティ
    static var anonymous: Human5{
        Human5(name: "", age: 0)
    }
    
    //コンピューテッドインスタンスプロパティ
    var message: String{
        get{
            if let s = habit{
                return s
            }else{
                return "えーっと"
            }
        }
        set{
            habit = newValue
        }
    }
    
}

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
        var str = "初めましてこんにちは"
        str += "私は\(self.name)と申します。\n"
        str += "以後ご承知おきください。\()"
        print(str)
    }
}
//
////ユーザータイプ列挙型
//enum UserType{
//    case guest
//    case host
//    case owner
//
//    static let guide = "これはユーザーのタイプを扱う型です。"
//
//    init(){
//        self = .guest
//    }
//
//    func printGuide(){
//        print(UserType.guide)
//    }
//}
//
//let user = User(ID: 10032, name:"竹村", age:30)
//print(user.name)
//user.selfIntroduction()
//user.UserType()
