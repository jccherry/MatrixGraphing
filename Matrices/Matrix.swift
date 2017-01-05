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
        } else {
            print("Indeces invalid")
        }
    }
    
    func doesColumnContain(column: Int, double: Double, startingRow: Int) -> (Bool,Int) {
        var doesContain: Bool = false
        var rowIndex:Int = startingRow
        
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
        
        if rows == columns-1 {
            /*
            //last row swapped
            var lastRowPlaced = 0
            //orders all 1s in the first column to the top left
            for i in 0..<rows{
                if rowsArray[i][0] == 1 {
                    swapRows(firstRowIndex: i, secondRowIndex: lastRowPlaced)
                    lastRowPlaced+=1
                }
            }
            
            printMatrix()
            
            
            var activeRow:Int
            var startingRow: Int = 1
            
            for activeColumn in 0..<columns{
                
                print("column \(activeColumn)")
                activeRow = startingRow
                for i in activeRow..<rows{
                    rowsArray[i] = rowsArray[i].addArray(array: rowsArray[activeRow-1].multiplyConstant(constant: (-1*rowsArray[i][activeColumn])))
                    printMatrix()
                    startingRow+=1
                }

            
            }
            */
            
            var startingRowIndex: Int = 0
            for currentColumn in 0..<columns{
                
                //loops for every row left that hasn't been reduced
                for row in startingRowIndex..<rowsArray.count{
                    var (doesContainOne, foundRowIndex) = doesColumnContain(column: currentColumn, double: 1, startingRow: startingRowIndex)
                    
                    //swap any row with a 1 to the top position
                    if doesContainOne{
                        swapRows(firstRowIndex: startingRowIndex, secondRowIndex: foundRowIndex)
                    } else if rowsArray[startingRowIndex][currentColumn] != 0{
                        rowsArray[startingRowIndex] = rowsArray[startingRowIndex].multiplyConstant(constant: 1/rowsArray[startingRowIndex][currentColumn])
                    }
                    
                    
                }
                startingRowIndex+=1
            }
            
        } else {
            print("cannot perform REF without a square matrix augmented to a solution matrix")
        }
        
    }
    
}

