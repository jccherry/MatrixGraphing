//
//  main.swift
//  Matrices
//
//  Created by John Chiaramonte on 1/4/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

let matrixArray: [[Double]] = [

    [2,4,2,-1],
    [2,5,1,6],
    [1,2,0,1]

]

let refArray: [[Double]] = [

    [1.0, 2.0, 0.0, 1.0],
    [0.0, 1.0, 1.0, 4.0],
    [0.0, 0.0, 1.0, -1.5]

]

/*
 3x -5y +2z +9w +2v = -7
 x  +4y -z  +3w -v  = 10
 6x +7y -z  -4w +5v = -18
 5x +9y +3z +6w -v  = -5
 2x -y  +5z -w  +8v = 12
 */

let fiveBySix: [[Double]] = [

    [3,-5,2,9,2,-7],
    [1,4,-1,3,-1,10],
    [6,7,-1,-4,5,-18],
    [5,9,3,6,-1,-5],
    [2,-1,5,-1,8,12]

]

print("Welcome to the Matrix RREF calculator. \n Enter how many rows in a n x (n+1) matrix to solve the system.")

let rowNum = Int(readLine()!)


let matrix = Matrix(rows: rowNum!, columns: rowNum!+1)
matrix.populateMatrix()


matrix.printMatrix()
matrix.rref()
//matrix.printMatrix()

linearGraph(slope: -1/4, shift: 4, maxX: 26, maxY: 10)
expGraph(coefficient: -1/30, power: 2, horizShift: 30, vertShift: 30, maxX: 60, maxY: 30)


