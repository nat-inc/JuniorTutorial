import UIKit

//--------------------Q1(8min)---------------------
func FizzBuzz(n:Int) ->[String]{
var Output = [String]()
for i in 1...n{
    if i%15 == 0{
        Output.append("FizzBuzz")
    }else if i%3 == 0{
        Output.append("Fizz")
    }else if i%5 == 0{
        Output.append("Buzz")
    }else{
        Output.append(String(i))
    }
}
return(Output)
}
print(FizzBuzz(n:15))

//--------------------Q2(1回目:(参照しながら)30min)-----
func getUniqIndex(str:String) -> Int{
var integerOfAlpha:[Character:Int] = [:]
for char in str{
    if integerOfAlpha[char] == nil{
        integerOfAlpha[char] = 1
    }else{
        integerOfAlpha[char] = integerOfAlpha[char]!+1
    }
}

for (index,char) in str.enumerated(){
    if integerOfAlpha[char] == 1{
        return index
    }
}
return -1
}

print(getUniqIndex(str:"aabb"))

//--------------------Q3(7min)---------------------
func getConsectiveOnes(nums:[Int]) -> Int{
var globalInt = (Int)()
var localInt = (Int)()

for num in nums{
    if num == 1{
        localInt += 1
        globalInt = max(globalInt,localInt)
    }else{
        localInt = 0
    }
}
return globalInt
}

print(getConsectiveOnes(nums:[1,0,1,1,0,0,0,1,1,1,1]))

//--------------------Q4(16min)--------------------
func checkRow(words:[String]) -> [String]{
var Output = [String]()
    let row1 = "qwertyuiop"
    let row2 = "asdfghjkl"
    let row3 = "zxcvbnm"
    
for word in words{
    var contains1 = 0
    var contains2 = 0
    var contains3 = 0
    for char in word{
        if row1.contains(char){
            contains1 = 1
        }else if row2.contains(char){
            contains2 = 1
        }else if row3.contains(char){
            contains3 = 1
        }
    }
    if contains1 + contains2 + contains3 == 1{
        Output.append(word)
    }
}
return(Output)
}

print(checkRow(words:["omk"]))

//--------------------Q5(1回目:(参照しながら)16min)----

func turnString(s:String) -> String{
    let Output = String(s.reversed()).split(separator:" ")
        .reversed().joined(separator:" ")
return Output
}

print(turnString(s:"scanat abc"))


//--------------------Q6(8min)----------------------
func dublicate(nums1:[Int],nums2:[Int]) -> [Int]{
let set1 = Set(nums1)
let set2 = Set(nums2)

let Output = set1.intersection(set2).sorted()
    return(Output)
}

print(dublicate(nums1:[4,9,5],nums2:[9,4,9,8,4]))

//--------------------Q7(1回目:(参照しながら)22min)----
var para1 = "hello"
var para2 = "ll"
func getIndexOfContains(para1:String,para2:String) ->Int{
let n1 = para1.count
let n2 = para2.count
var Output = (Int)()
    if para1.contains(para2){
        for idx in 0..<n1-n2+1{
            let start = para1.index(para1.startIndex, offsetBy:idx)
            let end = para1.index(para1.startIndex, offsetBy:idx+n2-1)
            let str = para1[start...end]
            if str == para2{
                Output = idx
            }
        }
    return Output
}
    return -1
}
print(getIndexOfContains(para1:"scanat",para2:"nat"))

//--------------------Q8(1回目:(22min)----
func checkPattern(pattern:String, s:String) -> Bool{
let p1 = Array(pattern)
let s1 = s.split(separator:" ")
let n = p1.count
let n1 = s1.count
var checkDictionary:[Character:String] = [:]
    if !(n == n1){
        return false
    }
    
    for i in 0..<n{
        if !checkDictionary.keys.contains(p1[i]){
        checkDictionary[p1[i]] = "\(s1[i])"
            
        }else{
        if !(checkDictionary[p1[i]] == "\(s1[i])"){
            return false
        }
    }
}
return true
}

print(checkPattern(pattern:"mnnm", s:"iOS Android Android iOS"))

//--------------------Q9(?min)----------------------
var Input = [[7,10],[2,4]]
var n = Input.count

