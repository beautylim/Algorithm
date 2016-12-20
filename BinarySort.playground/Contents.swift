//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var testArray = [61,12,78,24,33,69,30,47,56]

func binarySort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for i in 1..<n {
        var low = 1
        if i==1 && myArray[0]>myArray[1] {
            let temp = myArray[1]
            myArray[1] = myArray[0]
            myArray[0] = temp
        }else{
            var high = i-1
            let temp = myArray[i]
            while low <= high {
                let middle = (low + high)/2
                if myArray[middle] < temp{
                    low = middle + 1
                }else{
                    high = middle-1
                }
            }
            for j in (high+1..<i).reversed(){
                myArray[j+1] = myArray[j]
            }
            myArray[high+1] = temp
        }
    }
    return myArray
}

var date1 = NSDate.init();
binarySort(array: testArray)
print("折半查找：",-date1.timeIntervalSinceNow)
//假设每一次读取序列的值，前面的序列都是有序的，你需要使用折半查找的方法将当前的值插入到前面的序列中，这跟直接插入排序很像，
