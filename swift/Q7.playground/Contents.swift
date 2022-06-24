import UIKit

func indexOfContains(para1:String, para2:String) ->Int{
    if para1.contains(para2){
        for index1 in 0..<para1.count-para2.count + 1{
            let start = para1.index(para1.startIndex, offsetBy: index1)
            let end = para1.index(para1.startIndex, offsetBy: index1 + para2.count - 1)
            let str = para1[start...end]
            if str == para2{
                return index1
            }
        }
    }
    return -1
}

print(indexOfContains(para1:"scnanat",para2:"nat"))

