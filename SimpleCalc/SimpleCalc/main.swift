//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculateThree(args: [String], operation: String) -> Float {
        let first = Float(args[0])!
        let second = Float(args[2])!
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
            let intFirst = Int(first)
            let intSecond = Int(second)
            let min = intFirst / intSecond
            return Float(intFirst - (min * intSecond))
        default:
            return 1
        }
    }

    public func calculate(_ args: [String]) -> Float {
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
            var total: Float = 0
            for (index, num) in args.enumerated() {
                if index != args.count - 1 {
                    total += Float(num)!
                }
            }
            return total / Float(args.count - 1)
        case "count":
            return Float(args.count - 1)
        case "fact":
            if args.count == 1 {
                return 0
            }
            var index = Float(args[0])!
            var total: Float = 1
            while index > 0 {
                total *= index
                index -= 1
            }
            return total
        default:
            return 0
        }
    }

    public func calculate(_ arg: String) -> Float {
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
