//
//  main.swift
//  MatrixGraphing
//
//  Created by John Chiaramonte on 2/14/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

extension Matrix {
    //graphs all ones in the matrix, upside down, as if in quadrant 1 of cartesian plane
    func printGraph() {
        
        //printMatrix()
        
        for rowIndex in 0..<rows {
            let rowNum = rows - rowIndex - 1
            var rowString = ""
            
            for entry in rowsArray[rowNum]{
                if entry == 1 {
                    rowString += "*"
                } else if entry == 2{
                    rowString += "X"
                } else {
                    rowString += " "
                }
                
            }
            print("-|\(rowString)")
        }
        var bottomString = ""
        for _ in 0..<columns{
            bottomString += "‾"
        }
        print("  \(bottomString)")
    }

}

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

func linearGraph(slope: Double, shift: Int, graphMatrix: Matrix){

    let maxX = graphMatrix.columns - 1
    
    for xValue in 1..<maxX+1 {
        let yValue = Int(slope * Double(xValue)) + shift
        //print("(\(xValue),\(yValue))")
    
        if graphMatrix.getEntry(row: yValue, column: xValue) == 1 {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 2)
        } else {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 1)
        }
        
    }
    
    
    //graphMatrix.printMatrix()
    print("\(slope)x + \(shift)")
    graphMatrix.printGraph()
}

//linearGraph(slope: 1/10, shift: 1, maxX: 50)

func expGraph(coefficient: Double, power: Int, horizShift: Int, vertShift: Int, graphMatrix: Matrix){

    let maxX = graphMatrix.columns - 1
    
    
    for xValue in 1..<maxX+1 {
        let yValue = Int(coefficient*Double((xValue-horizShift).pow(power: power))) + vertShift
        //print("(\(xValue),\(yValue))")
        
        if graphMatrix.getEntry(row: yValue, column: xValue) == 1 {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 2)
        } else {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 1)
        }
        
    }
    
    print("\(coefficient)(x - \(horizShift))^\(power) + \(vertShift)")
    graphMatrix.printGraph()
}

func sinGraph(amplitude: Double, horizStretch: Double,horizShift: Int, vertShift: Int, graphMatrix: Matrix){
    
    let maxX = graphMatrix.columns-1
    
    for xValue in 1..<maxX+1 {
        
        let yValue = Int(amplitude*sin(horizStretch*(Double(xValue)) - Double(horizShift))) + vertShift
        
        if graphMatrix.getEntry(row: yValue, column: xValue) == 1 {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 2)
        } else {
            graphMatrix.setEntry(row: yValue, column: xValue, value: 1)
        }
        
        
    }
    
    print("\(amplitude)sin(\(horizStretch)x - \(horizShift)) + \(vertShift)")
    graphMatrix.printGraph()
}




