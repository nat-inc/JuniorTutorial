
func bubblesort(input:[Int]) -> [Int]{
    var arr = input
    let n = arr.count
    for i in 0..<n-1{
        for j in 0..<n-i-1{
            if arr[j] > arr[j+1]{
                let temp = arr[j]
                arr[j] = arr[j+1]
                arr[j+1] = temp
            }
        }
    }
    return arr
}

print(bubblesort(input:[2,4,1,5,3]))
