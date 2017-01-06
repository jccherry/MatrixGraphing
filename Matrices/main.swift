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

let matrix = Matrix(rows: 3, columns: 4)
matrix.rowsArray = matrixArray

matrix.printMatrix()
matrix.rref()
//matrix.printMatrix()


