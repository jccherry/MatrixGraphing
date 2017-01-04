//
//  Matrix.swift
//  Matrices
//
//  Created by John Chiaramonte on 1/3/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

class Matrix {
    
    var rows: Int
    var columns: Int
    var rowsArray: [[Double]] = []
    
    
    init(rows: Int, columns: Int){
        
        if rows <= 0 {
            self.rows = 1
        } else {
            self.rows = rows
        }
            
        if columns <= 0 {
            self.columns = 1
        } else {
            self.columns = columns
        }
        
        for rowIndex in 0..<rows {
            rowsArray.append([])
            for _ in 0..<columns{
                rowsArray[rowIndex].append(0)
            }
        }
        
    }
    
    func printMatrix() {
        print()
        for row in rowsArray{
            print(row)
        }
        print()
    }
    
    func populateMatrix(){
        for rowIndex in 0..<rowsArray.count{
            print("Input Row \(rowIndex):")
            for columnIndex in 0..<rowsArray[rowIndex].count{
                rowsArray[rowIndex][columnIndex] = Double(readLine()!)!
            }
            
        }
    }
    
    func swapRows(firstRowIndex: Int, secondRowIndex: Int){
        
        //temp array so no memory gets overridden
        var tempArray: [Double]
        
        //check if selected indeces are valid
        if 0 <= firstRowIndex && firstRowIndex < rowsArray.count && 0 <= secondRowIndex && secondRowIndex < rowsArray.count {
            tempArray = rowsArray[firstRowIndex]
            rowsArray[firstRowIndex] = rowsArray[secondRowIndex]
            rowsArray[secondRowIndex] = tempArray
        } else {
            print("Indeces invalid")
        }
    }
    
    func multiplyArrayByConstant(array: [Double], constant: Double) -> [Double]{
        
        var returnArray = array
        for i in 0..<array.count {
            returnArray[i] = array[i]*constant
        }
        return returnArray
    }
    
    func addDoubleArrays(firstArray: [Double], secondArray: [Double]) -> [Double]{
        var returnArray: [Double] = []
        if firstArray.count == secondArray.count {
            for i in 0..<firstArray.count {
                returnArray.append(firstArray[i]+secondArray[i])
            }
        } else {
            print("Cannot add arrays with different sizes")
        }
        return returnArray
    }
    
    
    func ref(){
        
        if rows == columns-1 {
            //last row swapped
            var lastRowPlaced = 0
            for i in 0..<rowsArray.count{
                if rowsArray[i][0] == 1 {
                    swapRows(firstRowIndex: i, secondRowIndex: lastRowPlaced)
                    lastRowPlaced+=1
                }
            }
        } else {
            print("cannot perform REF without a square matrix augmented to a solution matrix")
        }
        
    }
    
}

