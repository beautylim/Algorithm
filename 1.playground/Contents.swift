//: Playground - noun: a place where people can play

import Foundation

var testArray = [61,12,78,24,33,69,30,47,56]


//for i in 0..<10 {
//    let data = Int(arc4random() % 100)
//    testArray.append(data)
//}
//从大到小
//冒泡排序

//先循环一次从0到n-2,相邻之间的元素相互比较，如果前面的比后面的大就调换位置，这样就通过一次次的比较找出最小的元素放到最后。接下来循环0到n-3，找出最小的，放在倒数第二位，以此类推。

func bubble_sort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for _ in 0..<n-1 {
        let j:Int = 0
        for j in 0..<n-j-1 {
            if myArray[j] < myArray[j+1] {
                (myArray[j],myArray[j+1]) = (myArray[j+1],myArray[j])
            }
        }
    }
    return myArray;
}

//var date1 = NSDate.init();
//bubble_sort(array: testArray)
//print("冒泡排序：",-date1.timeIntervalSinceNow)

//选择排序
//选择排序不是跟相邻之间的比较。它是当i=0开始第i个元素要与剩下的i+1到n-1个元素相比较，谁比较大谁就互换位置，这样一层层比较会留下最大的值在i的位置上，就形成了排序。
func select_sort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for i in 0..<n-1{
        for j in i..<n-1 {
            if myArray[j] > myArray[i] {
                (myArray[j],myArray[i]) = (myArray[i],myArray[j])
            }
        }
    }
    return myArray
}
//var date2 = NSDate.init()
//select_sort(array: testArray)
//print("选择排序：",-date2.timeIntervalSinceNow)


//插入排序 
//直接插入排序
//直接插入排序是指前面已经形成了一个有序区间，下一个元素i必须插进前面0至i-1这个区间，只要找到比它小的元素k插在k的后面，剩下的元素向后移。
//从小到大
func direct_insert_sort(array:[Int])->[Int]{
    var myArray = array
    let n = myArray.count
    for i in 1..<n {
        if myArray[i]<myArray[i-1]{
            let temp = myArray[i]
            var j=i-1
            while(j>=0&&myArray[j]>temp){
                myArray[j+1]=myArray[j]
                j=j-1
            }
            myArray[j+1] = temp
        }
    }
    return myArray
}

//var date3 = NSDate.init()
//direct_insert_sort(array: testArray)
//print("直接插入排序：",-date3.timeIntervalSinceNow)

//折半查找 从小到大
func Binary_Sort(array:[Int])->[Int]{
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

//希尔排序
//先将序列按照n/2的大小划分成不同的序列，每个序列直接插入排序, O(nlogn)
func shell_sort(array:[Int])->[Int]{
    print(array)
    var myArray = array
    let n = array.count
    var gap = n/2
    while gap>0 {
        print(gap)
        for i in 0..<gap {
            var j=i+gap
            while j < n {
                if myArray[j] < myArray[j-gap] {
                    let temp = myArray[j]
                    var k = j-gap
                    while k>=0&&myArray[k]>temp {
                        myArray[k+gap] = myArray[k]
                        k = k-gap
                    }
                    myArray[k+gap] = temp
                }
                j = j+gap
            }
            print(myArray)
        }
        gap = gap/2
    }
    return myArray
}

//var date4 = NSDate.init()
//shell_sort(array: testArray)
//print("希尔排序：",-date4.timeIntervalSinceNow)


//归并排序
//递归划分序列，合并排序 O（nlogn）
func merge_sort(low:Int,high:Int){
    if low >= high {
        return
    }
    let middle = (low + high)/2
    merge_sort(low: low, high: middle)
    merge_sort(low: middle+1, high: high)
    merge_array(start1: low, end1: middle, start2: middle+1, end2: high)
}

func merge_array(start1:Int,end1:Int,start2:Int,end2:Int){
    var tempArray = [Int]()
    var s1 = start1
    let s = start1
    var s2 = start2
    var i=0
    while s1 <= end1 && s2 <= end2  {
        if testArray[s1] < testArray[s2] {
            tempArray.insert(testArray[s1], at: i)
            s1 = s1+1
            i = i+1
            continue
        }
        
        if testArray[s2] < testArray[s1] {
            tempArray.insert(testArray[s2], at: i)
            s2 = s2+1
            i = i+1
            continue
        }
    }
    while s1<=end1 {
        tempArray.insert(testArray[s1], at: i)
        s1 = s1+1
        i = i+1
    }
    
    while s2 <= end2 {
        tempArray.insert(testArray[s2], at: i)
        s2 = s2+1
        i = i+1
    }
    
    for i in 0..<tempArray.count {
        testArray[s+i] = tempArray[i]
    }
    print(testArray)
}

//var date5 = NSDate.init()
//merge_sort(low: 0, high: testArray.count-1)
//print("归并排序：",-date5.timeIntervalSinceNow)
