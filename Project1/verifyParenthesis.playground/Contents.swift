import UIKit


/*:
 # Verify parenthesis
 In this problem, we write a function that takes in a string of text that consists of parenthesis such as "()(())" and should return a boolean value that represents wether the parenthis properly match and terminate. that is, each open parenthesis should have a unique coorisponding ending parenthesis.
 
 ## Constraints
 * 
 *
 ## Psuedo-code approach
 To impliment this function we should first convert our input string to an array of chars. we can then intitialize and empty array to function as a stack datastructure. We will use this structure like so ,
    while looping over the array of chars, if we encounter a '(' we add an
    opening parenthesis to our stack. else if we encounter a ')', we check to
    see that our stack isn't empty. this is because an empty stack would mean there was no opening parenthesis present before the closing parenthesis. if our stack isn't empty, remove the last element from our stack.
    this is a common algorithm that i've practiced for coding interviews which is why I opted to use something we haven't seen in class.

 Example function in a java like language.
 # Example #
 
 ```
 Boolean verifyParenthesis(String expression){
    char[] chars = expression.toCharArray();
    Stack<Character> stack = new Stack<>();
    for (char c : chars){
        if(c.equals('('){
            stack.push('(')
        } else if (c.equals(')'){
            if(stack.isEmpty(){
                return false;
            }
            stack.removeLast();
    }
    return stack.length==0
 
 }
 
 ```
 */
func verifyParenthesis(expression: String) -> Bool {
    var expressionChars = Array(expression)
    var stack = [Character]()
    for char in expressionChars {
        if char == "(" {
            stack.append(char)
        } else if char == ")" {
            if stack.isEmpty {
                return false
            }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty
}
        

print("for expression '()' - Expected: true, Actual:", verifyParenthesis(expression: "()"))
print("for expression '(())' - Expected: true, Actual:", verifyParenthesis(expression: "(())"))
print("for expression '())' - Expected: false, Actual:", verifyParenthesis(expression: "())"))
print("for expression '(())(' - Expected: false, Actual:", verifyParenthesis(expression: "(())("))
print("for expression ')(()' - Expected: false, Actual:", verifyParenthesis(expression: ")(()"))
print("for expression '()' - Expected: true, Actual:", verifyParenthesis(expression: "()"))
