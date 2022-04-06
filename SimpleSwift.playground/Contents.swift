import Foundation

print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    if args[0] == "count" || args[0] == "avg" || args[0] == "fact" {
        return 0
    }
    let operation = args[1]
    var method = ""
    switch operation {
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "%":
            return Int(args[0])! % Int(args[2])!
        default:
            method = args[args.count - 1]
    }
    switch method {
    case "count":
        return args.count - 1
    case "avg":
        var sum = 0
        let numOfInts = args.count - 1
        for i in 0...(numOfInts - 1) {
            sum += Int(args[i])!
        }
        return Int(sum / numOfInts)
    case "fact":
        if args[0] == "0" || args[0] == "1" {
            return 1
        }
        else {
            var factNum = Int(args[0])!
            var result = 1
            while factNum >= 1 {
                result *= factNum
                factNum -= 1
            }
            return result
        }
    default:
        return -1
    }
}

func calculate(_ arg: String) -> Int {
    let args = arg.components(separatedBy: " ")
    return calculate(args)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values

func calculate(_ args: [String]) -> Double {
    let operation = args[1]
    switch operation {
        case "+":
            return Double(args[0])! + Double(args[2])!
        case "-":
            return Double(args[0])! - Double(args[2])!
        case "*":
            return Double(args[0])! * Double(args[2])!
        case "/":
            return Double(args[0])! / Double(args[2])!
        case "%":
        return Double(args[0])!.truncatingRemainder(dividingBy: Double(args[2])!)
        default:
            return -1.0
    }
}
func calculate(_ arg: String) -> Double {
    return -1.0
}
calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5

