import UIKit

func checkRange(Input:[[Int]]) -> Bool{
let n = Input.count
for i in 0..<n{
    let main = Input[i]
    let range = main[0]...main[1]
    for j in i+1..<n{
        let arr = Input[j]
        let range2 = arr[0]...arr[1]
        for num in range2{
            if range.contains(num){
                return false
            }
        }
    }
}
    return true
}

print(checkRange(Input:[[1,4],[5,10],[15,20]]))




//---------------------------------------memo
//let arr0 = Input[0]
//let arr1 = Input[1]
//let range0 = arr0[0]...arr0[1]
//
//print(range0)
//range0.contains(arr1[0])
//range0.contains(arr1[1])

//
//for i in 0..<n{
//    let arr1 = Input[i] //それぞれのarray[i]
//
//    print(arr1)

//func checkRange(Input:[[Int]]) -> Bool{
//var set1 = Set<Int>()
//var set2 = Set<Int>()
//
//let arr1 = Input[0]
//let arr2 = Input[1]
//
//    for i in arr1[0]...arr1[1]{
//    set1.insert(i)
//    }
//
//    for i in arr2[0]...arr2[1]{
//    set2.insert(i)
//    }
//if set1.intersection(set2).sorted() == []{
//    return true
//}
//
//
// return false
//}
//
//print(checkRange(Input:[[7,10],[2,4]]))
