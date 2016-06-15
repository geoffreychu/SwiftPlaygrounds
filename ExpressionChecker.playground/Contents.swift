// *********************************
// Geoffrey Chu
// 2016, Compatible with Swift 2.2
// *********************************

import Foundation

struct Stack<Element> {
    var items = [Element]()
    mutating func push (item: Element) {
        items.append (item)
    }
    mutating func pop () -> Element {
        return items.removeLast()
    }
    func isEmpty () -> Bool {
        return items.count == 0 ? true : false
    }
}

extension String {
    var isExpressionCorrect : String {
        get {
            let opening = ["(", "{", "["]
            let chars = Array (self.characters)
            var stack = Stack<Character>()
            for c in chars {
                if opening.contains(String(c)) {
                    stack.push (c)
                } else {
                    if stack.isEmpty() {
                        return "NO"
                    }
                    if c == " " {
                        continue
                    }
                    let previousCharacter = stack.pop()
                    if previousCharacter == "(" && c == ")" {
                        continue
                    } else if previousCharacter == "{" && c == "}" {
                        continue
                    } else if previousCharacter == "[" && c == "]" {
                        continue
                    } else {
                        return "NO"
                    }
                }
                
            }
            if stack.isEmpty() {
                return "YES"
            } else {
                return "NO"
            }
        }
    }
}

print ("[({{[]}})]".isExpressionCorrect)
print ("{}()[]".isExpressionCorrect)
print ("{}()[)".isExpressionCorrect)
print ("[({([]])})]".isExpressionCorrect)
print ("([]([{ }]))".isExpressionCorrect)
print ("()".isExpressionCorrect)