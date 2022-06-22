func getConsectiveOnes(nums:[Int]) -> Int{
var localMax = 0
var globalMax = 0
for num in nums{
    if num == 1{
        localMax += 1
        globalMax = max(localMax,globalMax)
    }else{
        if globalMax < localMax{
            globalMax = localMax
            localMax = 0
        }else{
            localMax = 0
        }
    }
}
    return(globalMax)
}

print(getConsectiveOnes(nums:[1,1,0,1,1,1,0,0,1,1,1,1,1]))
