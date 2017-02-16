//
//  Matrix.swift
//  Matrices
//
//  Created by John Chiaramonte on 1/3/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

extension _ArrayProtocol where Iterator.Element == Double{
    func multiplyConstant(constant: Double) -> [Double] {
        var array: [Double] = self as! [Double]
        for i in 0..<array.count {
            array[i] = array[i]*constant
        }
        return array
    }
    
    func addArray(array: [Double]) -> [Double]{
        var returnArray: [Double] = self as! [Double]
        
        if array.count == returnArray.count {
            for i in 0..<returnArray.count {
                returnArray[i] = returnArray[i] + array[i]
            }
        }
        
        return returnArray
    }
}

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
            
            print("Swap R\(firstRowIndex+1) & R\(secondRowIndex+1)")
            printMatrix()
        } else {
            print("Indeces invalid")
        }
    }
    
    func doesColumnContain(column: Int, double: Double, startingRow: Int) -> (Bool,Int) {
        
        var (doesContain, rowIndex) = (false, startingRow)
        
        if 0 <= column && column < columns {
            var rowIndexIterator = startingRow
            
            //while no one has been detected and the iterator has stayed within bounds of the rowsArray
            while doesContain == false && rowIndexIterator < rows {
                if rowsArray[rowIndexIterator][column]==double{
                    doesContain = true
                    rowIndex = rowIndexIterator
                }
                rowIndexIterator+=1
            }
        }
        return (doesContain,rowIndex)
    }
    
    
    func ref(){
        
        printMatrix()
        
        if rows == columns-1 {
            
            
            var startingRowIndex: Int = 0
            
            for currentColumn in 0..<columns{
                
                if startingRowIndex < rows{
                    //print("Working on Column \(currentColumn+1)")
                    
                    //first, find out if the column contains a 1
                    let (doesContainOne, foundRowIndex) = doesColumnContain(column: currentColumn, double: 1, startingRow: startingRowIndex)
                    
                    //if it does, put the row in the top left position of the major diagonal for that column
                    //else multiply the row at the startingRowIndex by the first entry's reciprocal to make the row have a 1 in the major diagonal if != 0
                    if doesContainOne{
                        swapRows(firstRowIndex: foundRowIndex, secondRowIndex: startingRowIndex)
                    } else if rowsArray[startingRowIndex][currentColumn] != 0{
                        print("1/\(rowsArray[startingRowIndex][currentColumn])R\(startingRowIndex+1) -> R\(startingRowIndex+1)")
                        rowsArray[startingRowIndex] = rowsArray[startingRowIndex].multiplyConstant(constant: 1/rowsArray[startingRowIndex][currentColumn])
                        printMatrix()
                    } else {
                        //print("Error: First Entry in column = 0, fix it")

                        for nonZeroRowIndex in startingRowIndex..<rows-1{
                            if rowsArray[nonZeroRowIndex][currentColumn] != 0 {
                                swapRows(firstRowIndex: startingRowIndex, secondRowIndex: nonZeroRowIndex)
                                
                                print("\(1/rowsArray[startingRowIndex][currentColumn])R\(startingRowIndex) -> R\(startingRowIndex)")
                                rowsArray[startingRowIndex] = rowsArray[startingRowIndex].multiplyConstant(constant: 1/rowsArray[startingRowIndex][currentColumn])
                                printMatrix()
                            }
                        }
                    }
                    
                    //reduce remaining rows by subtracting by a multiple of the starting row, which now has a 1 in the entry at the starting column
                    for rowIndex in startingRowIndex+1..<rowsArray.count{
                        print("R\(rowIndex+1) - \(rowsArray[rowIndex][currentColumn])R\(startingRowIndex+1) -> R\(rowIndex+1)")
                        rowsArray[rowIndex] = rowsArray[rowIndex].addArray(array: rowsArray[startingRowIndex].multiplyConstant(constant: -1*rowsArray[rowIndex][currentColumn]))
                        printMatrix()
                    }
                    
                    //add one to startingRowIndex as the matrix moves down major diag
                    startingRowIndex+=1
                }
                
            }
            

            
        } else {
            print("cannot perform REF without a square matrix augmented to a solution matrix")
        }
        
        //print("REF+++++++++++++++++++++++++")
        
    }
    
    func rref(){
        ref()
        
        var currentColumnIndex: Int = columns - 2
        var rowIndex:Int = rows-2
        
        //loop through every column besides 1 and the solution matrix
        for _ in 0..<columns-2{
            
            var currentRowIndex: Int = rowIndex
            
            for _ in 0..<rowIndex+1 {
                print("R\(currentRowIndex+1) - \(rowsArray[currentRowIndex][currentColumnIndex])R\(rowIndex+2) -> R\(currentRowIndex+1)")
                rowsArray[currentRowIndex] = rowsArray[currentRowIndex].addArray(array: rowsArray[rowIndex+1].multiplyConstant(constant: -1*rowsArray[currentRowIndex][currentColumnIndex]))
                printMatrix()
                currentRowIndex-=1
            }
            
            currentColumnIndex-=1
            rowIndex-=1

            
        }
        
        
    }
    
        
    func clearMatrix(){
        for rowIndex in 0..<rows{
            for columnIndex in 0..<columns{
                rowsArray[rowIndex][columnIndex] = 0
            }
        }
    }
    
    func getEntry(row: Int, column: Int) -> Double{
        if row > 0 && column > 0 && row <= rows && column <= columns {
            return rowsArray[row-1][column-1]
        } else {
            //print("Entry out of bounds")
            return 0
        }
    }
    
    func setEntry(row: Int, column: Int, value: Double){
        if row > 0 && column > 0 && row <= rows && column <= columns {
            rowsArray[row-1][column-1] = value
        } else {
            //print("Entry out of bounds")
        }
        
    }
    
    func dimensions() -> String{
        return "\(rows)x\(columns)"
    }
    
}

