//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let op = args[args.count - 1]
        switch op {
        case "avg":
            var total: Int = 0
            for (index, num) in args.enumerated() {
                if index != args.count - 1 {
                    total += Int(num)!
                }
            }
            return total / (args.count - 1)
        case "count":
            return args.count - 1
        case "fact":
            var index: Int = Int(args[0])!
            var total: Int = 1
            while index > 0 {
                total *= index
                index -= 1
            }
            return total
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "%":
            let min = Int(args[0])! / Int(args[2])!
            return Int(args[0])! - (min * Int(args[2])!)
        default:
            return 1
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

// Check if last item is a word or a number... count, avg, fact, or just math operation

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
//let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, second]))

