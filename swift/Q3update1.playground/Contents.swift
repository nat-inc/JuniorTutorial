//var appendToCount = "A"を使わない方法
func countOfRepeat1(box:[Int]) -> Int{
var countA = 0
var countB = [Int]()
for num in box{
    if num == 1{
        countA += 1
    }else{
        countB.append(countA)
        countA = 0
        }
    }
    if countA > 0{
        countB.append(countA)
    }
    
//    var min = numArray[0]
//    var max = numArray[0]
//    if item
    return countB.max() ?? 0
}


print(countOfRepeat1(box:[1,0,1,1,1,1,1,1,0,1,1,1]))
