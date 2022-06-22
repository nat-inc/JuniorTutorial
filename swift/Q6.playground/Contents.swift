import UIKit

func dublicate(nums1:[Int], nums2:[Int]) ->[Int]{
let a = Set(nums1)
let b = Set(nums2)

let Output = a.intersection(b).sorted()
    return(Output)
}

print(dublicate(nums1:[1,2,2,1],nums2:[2,2]))
