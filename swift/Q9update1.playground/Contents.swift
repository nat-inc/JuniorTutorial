import UIKit

func checkRange(Input:[[Int]]) -> Bool{
var arr = Input
let n = arr.count
    
for i in 0..<n-1{
    for j in 0..<n-1-i{
        if arr[j][0] > arr[j + 1][0]{
            let temp = arr[j]
            arr[j] = arr[j + 1]
            arr[j + 1] = temp
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

print(checkRange(Input:[[7,10],[2,4]]))






//Inputのままだとlet定義のようになり変更不可なので、funcの中でarrに置き換えて変更させる
