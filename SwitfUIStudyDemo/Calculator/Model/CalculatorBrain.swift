//
//  CalculatorBrain.swift
//  SwitfUIStudyDemo
//
//  Created by peko on 2021/3/26.
//

import Foundation


enum CalculatorBrain {
    case left(String)
    case leftOp(left: String, op: CalculatorButtonItem.Operation)
    case leftOpRight(left: String, op: CalculatorButtonItem.Operation, right:String)
    case error
}
