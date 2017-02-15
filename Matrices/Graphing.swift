//
//  main.swift
//  MatrixGraphing
//
//  Created by John Chiaramonte on 2/14/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

extension Int{
    func pow(power: Int) -> Int{
        if power > 0{
            var int = self
            for _ in 1..<power{
                int *= self
            }
            return int
        } else {
            return self
        }
        
    }
}

func linearGraph(slope: Double, shift: Int, maxX: Int,maxY: Int){
    //mutable maxes for graph sizing
    var maxYMut: Int
    var maxXMut: Int
    
    if maxY <= 0 {
        maxYMut = 10
    } else {
        maxYMut = maxY
    }
    
    if maxX <= 0 {
        maxXMut = 10
    } else {
        maxXMut = maxX
    }
    
    let graphMatrix = Matrix(rows: maxYMut, columns: maxXMut)
    
    for xValue in 1..<maxX+1 {
        let yValue = Int(slope * Double(xValue)) + shift
        //print("(\(xValue),\(yValue))")
    
        graphMatrix.setEntry(row: yValue, column: xValue, value: 1)
        
    }
    
    
    //graphMatrix.printMatrix()
    graphMatrix.printGraph()
}

//linearGraph(slope: 1/10, shift: 1, maxX: 50)

func expGraph(coefficient: Double, power: Int, horizShift: Int, vertShift: Int, maxX: Int, maxY: Int){

    //mutable maxes for graph sizing
    var maxYMut: Int
    var maxXMut: Int
    
    if maxY <= 0 {
        maxYMut = 10
    } else {
        maxYMut = maxY
    }
    
    if maxX <= 0 {
        maxXMut = 10
    } else {
        maxXMut = maxX
    }
    
    let graphMatrix = Matrix(rows: maxYMut, columns: maxXMut)
    
    //print(graphMatrix.dimensions())
    
    for xValue in 1..<maxX+1 {
        let yValue = Int(coefficient*Double((xValue-horizShift).pow(power: power))) + vertShift
        //print("(\(xValue),\(yValue))")
        
        graphMatrix.setEntry(row: yValue, column: xValue, value: 1)
        
    }
    
    print("\(coefficient)(x - \(horizShift))^\(power) + \(vertShift)")
    graphMatrix.printGraph()
}

/*
linearGraph(slope: -1/4, shift: 4, maxX: 26, maxY: 10)
expGraph(coefficient: -1/30, power: 2, horizShift: 30, vertShift: 30, maxX: 60, maxY: 30)
*/




