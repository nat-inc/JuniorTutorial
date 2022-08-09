import UIKit

//Q6---------------------------------------------------
func dublicate(nums1:[Int],nums2:[Int]) -> [Int]{
let a = Set(nums1)
let b = Set(nums2)

let Output = a.intersection(b).sorted()
    return(Output)
}

print(dublicate(nums1:[4,9,5],nums2:[9,4,9,8,4]))


//Q7---------------------------------------------------
func getIndex(para1:String, para2:String) -> Int{

for index1 in 0..<para1.count - para2.count + 1{
    let start = para1.index(para1.startIndex, offsetBy: index1)
    let end = para1.index(para1.startIndex, offsetBy:index1 + para2.count - 1)
    let range = para1[start...end]
    
    if range == para2{
        return(index1)
    }
}
    return -1
}

print(getIndex(para1:"hello",para2:"ll" ))


//Q8---------------------------------------------------
func checkPattern(pattern:String, s:String) -> Bool{
let s2 = s.split(separator:" ")
let p2 = Array(pattern)
let n = s2.count
let n2 = p2.count
var dicOfPattern = [Character:String]()

    if !(n == n2){
        return false
    }
    
for c in 0..<n{
    if !dicOfPattern.keys.contains(p2[c]){
        dicOfPattern[(p2[c])] = "\(s2[c])"
    }else{
        if dicOfPattern[(p2[c])] == "\(s2[c])"{
            return true
        }
    }
}
    return false
}

print(checkPattern(pattern:"vxvv", s:"scan nat scan scan"))


//Q9---------------------------------------------------
func checkRange(Input:[[Int]]) -> Bool{
var n = Input.count
var arr = Input
    
for i in 0..<n-1{
    for j in 0..<n-1-i{
        if arr[j][0] > arr[j+1][0]{
            let temp = arr[j]
            arr[j] = arr[j+1]
            arr[j+1] = temp
        }
    }
}

for i in 0..<n-1{
    if arr[i][1] > arr[i+1][0]{
        return false
    }
}
    return true
}

print(checkRange(Input:[[1,4],[5,10],[15,20]]))

//Q10---------------------------------------------------
func checkSum (nums:[Int],target:Int) -> [Int]{
var output = [Int]()
let n = nums.count

for i in 0..<n-1{
    for j in i+1..<n{
        if nums[i] + nums[j] == target{
            output.append(i)
            output.append(j)
        }
    }
}
return(output)
}

print(checkSum(nums:[3,3], target:6))
