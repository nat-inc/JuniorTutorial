import UIKit

var letters = Set<String>()

letters.insert("a")
letters.insert("b")

var fruits = Set<String>()

print(letters)

var genres:Set = ["Tennis","Soccer","Swim","Basket"]
var genres2:Set = ["Tennis","Swim","Judo","Baseball"]
var genres3:Set = ["Tennis","Basket"]
var genres4:Set = ["Soccer","Swim"]

var allGenres = genres.union(genres2).sorted()
print(allGenres)
//両方に含まれる全ての要素を合わせた新しいセット

var dublicate = genres.intersection(genres2).sorted()
print(dublicate)
//二つのセットの共通要素を含めた新しいセット

var sub = genres.subtracting(genres2).sorted()
print(sub)
//特定のセット（genres2）には含まれていない要素を含めた新しいセット

var symmetric = genres.symmetricDifference(genres2).sorted()
print(symmetric)
//どちらかだけにあって両方には含まれていない要素を含めた新しいセット

genres3.isSubset(of:genres)

genres3.isDisjoint(with:genres4)


let greeting = "Guten Tag!"
let start = greeting.index(greeting.startIndex, offsetBy:6)
let end = greeting.index(greeting.startIndex, offsetBy:8)
let range = greeting[start...end]
//String.indexを使った範囲の取り方

let start2 = greeting.index(greeting.endIndex, offsetBy:-4)
let end2 = greeting.index(greeting.endIndex, offsetBy:-8)
let range2 = greeting[end2...start2]

print(range)
print(range2)

var fruits1 = ["apple","orange","banana","melon"]
print(fruits1.firstIndex(of: "banana" ))
//(of: value)valueのindexを取得
print(fruits1.firstIndex(where: { $0.contains("app")}))
//(where:{条件式})で最初にtrueを返したindexを取得

var numbers = [1,2,3,4,5]
print(numbers.firstIndex(where : { $0 > 3 }))
//(where:{条件式})で最初にtrueを返したindexを取得

var str = "Hello World"
var reverse1 = String(str.reversed())
print(reverse1)
var split1 = reverse1.split(separator: " ")
var reverse2 = Array(split1.reversed())
var join1 = reverse2.joined(separator:" ")
print(join1)

var nums1 = [1,2,2,1]
var nums2 = [2,2]

let a = Set(nums1)
let b = Set(nums2)

var c:Set<Int> = [2,2]

var Output1 = b.intersection(c).sorted()


//import UIKit
//
//func indexOfContains(para1:String, para2:String) ->Int{
//    if para1.contains(para2){
//        for index1 in 0..<para1.count-para2.count + 1{
//            let start = para1.index(para1.startIndex, offsetBy: index1)
//            let end = para1.index(para1.startIndex, offsetBy: index1 + para2.count - 1)
//            let str = para1[start...end]
//            if str == para2{
//                return index1
//            }
//        }
//    }
//    return -1
//}
//
//print(indexOfContains(para1:"scnanat",para2:"nat"))
//
//
struct Resolution{
    var width = 0
    var height = 0
}

class VideoMode{
    var resolution = Resolution()
    var interlaced = false
    var flameRate = 0.0
    var name:String?
}

let SomeResolution = Resolution()
let SomeVideoMode = VideoMode()

print("The width of SomeResolution is \(SomeResolution.width)")
SomeVideoMode.resolution.width = 1280
print("The width of SomeVideoMode is now \(SomeVideoMode.resolution.width)")

struct Person{
    
    var name = "Conan"{
        willSet {
            print("I'm \(self.name). I'll be \(newValue)")
        }
        didSet{
            print("I became \(self.name)")
        }
        
    }
    func greet(){
        print("I'm \(self.name)")
    }
}

var person = Person()

person.greet()
person.name = "Shinichi"
person.greet()
person.name = "Saori"
person.greet()

struct Person1 {
    var firstName = "Conan"
    var lastName: String {
        get{
            if firstName == "Conan"{
                return "Edogawa"
            }else{
                return "Kudo"
            }
        }
        set{
            if newValue == "Edogawa"{
                firstName = "Conan"
            }else{
                firstName = "Shinichi"
            }
        }
    }
    func greet(){
        print("I'm \(self.firstName) \(self.lastName)")
    }
}

var person1 = Person1()
person1.greet()
person1.firstName = "Shinichi"
person1.greet()
person1.lastName = "Edogawa"
person1.greet()

@propertyWrapper
struct TwelveOrLess{
    private var number = 0
    var wrappedValue: Int {
        get {return number}
        set {number = min(newValue, 12)}
    }
}


struct SmallRectangle{
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

struct SmallRectangle1 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get{return _height.wrappedValue}
        set{_height.wrappedValue = newValue}
        }
    var width: Int {
        get{return _width.wrappedValue}
        set{_width.wrappedValue = newValue}
    }
}

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()
counter.increment(by: 5)
print(counter.count)
counter.reset()
print(counter.count)

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(za: Double) -> Bool {
        return self.x > za
    }
}
let somePoint = Point(x: 6.0, y: 5.0)
if somePoint.isToTheRightOf(za: 5.0) {
    print("This point is to the right of the line where x == 1.0")
}

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
//0,1,2の整数範囲を表す
rangeOfThreeItems.firstValue = 6
//6,7,8の整数範囲を表す

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 3)
//0,1,2の整数範囲を表す
//letの場合、上記のように変数のfirstValueの値も変更はできない、エラーになる。

class DataImporter {
    var filename = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
print(manager.data)

print(manager.importer.filename)

struct point {
    var x = 0.0, y = 0.0
}
struct size {
    var width = 0.0, height = 0.0
}
struct rect {
    var origin = point()
    var sizex = size()
    var center : point {
        get {
            let centerX = origin.x + (sizex.width / 2)
            let centerY = origin.y + (sizex.height / 2)
            return point(x:centerX, y:centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (sizex.width / 2)
            origin.y = newCenter.y - (sizex.width / 2)
        }
    }
}

var square = rect(origin: point(x:0.0, y:0.0),
                  sizex: size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = point(x:20.0, y:20.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
     }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 500

@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

//var smallnumber = SmallNumber()
//print(smallnumber.wrappedValue)

struct zeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle1 = zeroRectangle()
print(zeroRectangle1.height)

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}
 var unitRectangle = UnitRectangle()
print(unitRectangle.height)

struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
mixedRectangle.width = 10

mixedRectangle.height = 20
print(mixedRectangle.height)

struct point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        x += deltaX
        y += deltaY
    }
}
var somePoint1 = point1(x:1.0,y:1.0)
somePoint1.moveBy(x:2.0,y:3.0)
print("The point is now at (\(somePoint1.x), \(somePoint1.y))")

struct point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double){
        self = point2(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint2 = point2(x:2.0,y:3.0)
print(somePoint2.x)

enum TriStateSwitch {
    case off,low,high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.off
ovenLight.next()

struct Fehrenheit {
    var temperature = 24.0
}

var f = Fehrenheit()
print("The Default temperature is \(f.temperature) Fehrenheit")

extension Int {
    mutating func square(){
        self = self * self
    }
}

var someInt = 3
someInt.square()


extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        print(decimalBase)
        return (self / decimalBase) % 10
    }
}
746381295[0]
// 5 を返します
746381295[1]
// 9 を返します
746381295[2]
// 2 を返します
746381295[8]
// 7 を返します

print(746381295 / 100)

var decimalBase = 1
for _ in 0..<2 {
    decimalBase *= 10
    print(decimalBase)
}
