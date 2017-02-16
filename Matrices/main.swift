//
//  main.swift
//  Matrices
//
//  Created by John Chiaramonte on 1/4/17.
//  Copyright © 2017 John Chiaramonte. All rights reserved.
//

import Foundation

let testMatrix = Matrix(rows: 30, columns: 100)
sinGraph(amplitude: 5, horizStretch: 1/10, horizShift: -Int(M_PI/2), vertShift: 10, graphMatrix: testMatrix)
expGraph(coefficient: 1/175, power: 3, horizShift: 40, vertShift: 10, graphMatrix: testMatrix)
linearGraph(slope: -1/8, shift: 5, graphMatrix: testMatrix)
