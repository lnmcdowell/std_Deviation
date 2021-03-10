//
//  main.swift
//  std_Deviation
//
//  Created by Larry Mcdowell on 3/10/21.
//

import Foundation

print("Hello, World!")

func mean(dat:[Double])->Double{
    guard !dat.isEmpty else { return 0.0}
    let sum = dat.reduce(0.0){
        return $0 + $1
    }
    return sum / Double(dat.count)
}
func std_Deviation(data:[Double]){
    let mu = mean(dat:data)
    
    var tmpDiff = [Double]()
    data.forEach{num in
        let tmp = num - mu
        let tmp2 = tmp * tmp
        tmpDiff.append(tmp2)
    }
    let squaredStdDeviation = tmpDiff.reduce(0.0){
        return $0 + $1/Double(tmpDiff.count - 1)
    }
    
    let stdDev = squaredStdDeviation.squareRoot()
    print("\(stdDev)")
    var outliers = [Double]()
    var outliers2 = [Double]()
    data.forEach{num in
        if pow(num - mu,2) > (squaredStdDeviation * 2) {
            outliers2.append(num)
        }else if pow(num - mu,2) > squaredStdDeviation {
            outliers.append(num)
        }
        
    }
    print("outliers of 1 std dev are \(outliers)")
    print("outliers of 2 std dev are \(outliers2)")
}

let numbers:[Double] = [9,2,5,4,12,7]
std_Deviation(data: numbers)
