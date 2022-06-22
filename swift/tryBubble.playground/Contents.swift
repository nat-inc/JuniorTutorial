import UIKit

var greeting = "Hello, playground"

var arr = [2,5,1,4,3]
var n = arr.count

for i in 0..<n-1{
    for j in 0..<n-1-i{
        if arr[j] < arr[j+1]{
            let temp = arr[j+1]
            arr[j+1] = arr[j]
            arr[j] = temp
        }
    }
}

print(arr)
