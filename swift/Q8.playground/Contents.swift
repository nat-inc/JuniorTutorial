import UIKit

func checkPattern(pattern: String, s: String) -> Bool{
var alphabetOfPattern = [Character:String]()
let str1 = Array(pattern)
let split1 = s.split(separator:" ")
let n = pattern.count
var result = Int()

for c in 0..<n{
    if !alphabetOfPattern.keys.contains(str1[c]){
        alphabetOfPattern[str1[c]] = "\(split1[c])"
    }else{
        if alphabetOfPattern[str1[c]] == "\(split1[c])"{
            result = 1
        }else{
            return false
        }
    }
}
    if result == 1{
        return true
    }
    return false
}

print(checkPattern(pattern:"vxvv", s: "scan nat scan bird"))


//----------------------------------------memo------------
//for char in pattern {
//    let i = alphabetOfPattern.count
//    if alphabetOfPattern.keys.contains(char){
//        print(i)
//        if alphabetOfPattern[(char)] == "\(split1[i])"{
//            print(true)
//        }else{
//            print(false)
//        }
//    }else{
//        alphabetOfPattern[(char)] = "\(split1[0 + i])"
//    }
//}
//patternから[]へkeyとしてどうにかして持ってくる、同様にsからvalueとして定義する
//for roopをm分。初めてのalphaは紐付けからやって、二週目は紐付けが正しいか確認。間違っている時点でfalse。


//func patternOfAnimals(pattern: String, s:String) -> Bool{
//    var arr = [String]()
//    for char in pattern{
//        if char == "a"{
//            arr.append("dog")
//        }else if char == "b"{
//            arr.append("cat")
//        }else if char == "c"{
//            arr.append("fish")
//        }else if char == "d"{
//            arr.append("bird")
//        }
//    }
//    let result = arr.joined(separator:" ")
//    if result == s{
//    return true
//    }else{
//        return false
//    }
//}
//print(patternOfAnimals(pattern:"abba", s:"dog cat cat dog"))
