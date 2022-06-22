import UIKit

func dublicate(nums1:[Int],nums2:[Int]) ->[Int]{
let all = nums1 + nums2
var temp = [Int]()
var Output = [Int]()

for num in all{
    if !temp.contains(num){
        temp.append(num)
    }else if temp.contains(num){
        if !Output.contains(num){
            Output.append(num)
        }
    }
}
return(Output)
}

print(dublicate(nums1:[4,9,5], nums2:[9,4,9,8,4]))
