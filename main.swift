import Darwin

// Lesson22
print("Добро пожаловать в программу кулькулятор.")
var history: [String] = []

while true {
    
    let operation = getDataFromUser(description: "Введите операцию: +, -, *, /. Для завершения программы введите exit.Для просмотра истории введите h.")
    if operation == "exit" {
        exit(0)
    } else  if operation == "h" {
        for example in history {
            print(example)
        }
        continue

        
    }
    let firstNumber = getDataFromUser(description: "Введите целое число" )
    let secondNumber  = getDataFromUser(description: "Введите второе число")
    
    let example = "\(firstNumber) \(operation) \(secondNumber)"
    
    print("Идет вычисление \(example)")
    
    if let firstNumber = Double(firstNumber) {
        if let secondNumber = Double(secondNumber) {
            let result = calculate(operation: operation, firstNumber: firstNumber, secondNumber: secondNumber)
            if let result = result {
                showResult(result)
                history.append(example + " = " + String(result))
                
            } else {
                print("Вы ввели неверное второе число ")
            }
        } else {
            print("Вы ввели неверное первое число")
        }
        print("")
        print("------------------------------------")
        print("")
    }
    
    
    func getDataFromUser(description: String) -> String {
        print(description)
        return readLine() ?? ""
    }
    
    func showResult(_ result: Double) {
        print("Результат: \(String(result))")
    }
    
    func calculate(operation: String, firstNumber: Double, secondNumber: Double) -> Double?  {
        switch operation {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "*":
            return firstNumber * secondNumber
        case "/":
            if secondNumber == 0 {
                print("На ноль делить нельзя")
                return nil
            } else {
                return firstNumber / secondNumber
            }
        default:
            print("Неизвестная операция")
        }
        return nil
    }
}

