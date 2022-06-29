import UIKit

func addNums (nums:[Int],target:Int) -> [Int]{
let n = nums.count
var Output = [Int]()
    
for i in 0..<n-1{
    for j in i+1..<n{
        if nums[i] + nums[j] == target{
            Output.append(i)
            Output.append(j)
        }
    }
}
    return(Output)
}

print(addNums(nums:[2,7,11,15],target:9))



//memo-----------------------------------
//for i in 0..<n-1{
//    for j in i+1..<n{
//        temp.append(nums[i] + nums[j])
//        }
//    }
//    print(temp)


//[9,13,17,18,22,26]
