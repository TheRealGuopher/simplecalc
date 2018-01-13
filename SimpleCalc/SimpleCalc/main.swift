//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculateThree(args: [String], operation: String) -> Double {
//        if operation == "+" {
//            return Int(args[0])! + Int(args[2])!
//        } else if operation == "-" {
//            return Int(args[0])! - Int(args[2])!
//        } else if operation == "*" {
//            return Int(args[0])! * Int(args[2])!
//        } else if operation == "/" {
//            return Int(args[0])! / Int(args[2])!
//        } else if operation == "%" {
//            let min = Int(args[0])! / Int(args[2])!
//            return Int(args[0])! - (min * Int(args[2])!)
//        } else {
//            return -1
//        }
        let first = Double(args[0])!
        let second = Double(args[2])!
        switch args[1] {
        case "+":
            return first + second
        case "-":
            return first - second
        case "*":
            return first * second
        case "/":
            return first / second
        case "%":
            let min = first / second
            return first - (min * second)
        default:
            return 1
        }
    }

    public func calculate(_ args: [String]) -> Double {
        var expressions = [String]()
        for value in args {
            expressions.append(value)
        }
        if expressions.count == 3 {
            let operation = args[1]
            return calculateThree(args: expressions, operation: operation)
        }
        let op = args[args.count - 1]
        switch op {
        case "avg":
            if args.count == 1 {
                return 0
            }
            var total: Double = 0
            for (index, num) in args.enumerated() {
                if index != args.count - 1 {
                    total += Double(num)!
                }
            }
            return total / Double(args.count - 1)
        case "count":
            return Double(args.count - 1)
        case "fact":
            if args.count == 1 {
                return 0
            }
            var index = Double(args[0])!
            var total: Double = 1
            while index > 0 {
                total *= index
                index -= 1
            }
            return total
        default:
            return 0
        }
    }

    public func calculate(_ arg: String) -> Double {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

// Check if last item is a word or a number... count, avg, fact, or just math operation

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

