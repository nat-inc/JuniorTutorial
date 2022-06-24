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


































