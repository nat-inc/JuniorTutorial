//var appendToCount = "A"を使わない方法

func countOfRepeat1(box:[Int]) -> Int{
var countA = 0
var countB = 0
for num in box{
    if num == 1{
        countA += 1
    }else{
        if countB < countA{
            countB = countA
        }
        countA = 0
    }
    if countB < countA{
        countB = countA
    }
    
}
    return countB
}
print(countOfRepeat1(box:[0,0,1,1]))


