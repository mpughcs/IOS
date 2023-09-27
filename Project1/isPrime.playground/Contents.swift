var greeting = "Hello, playground"
/*:
 # isPrime logic
 In this problem, a prime number is defined as a natural number *greater than 1* that is not a product of two smaller natural numbers.
 ## Constraints
 * input must be a positive, natural number
 ## Psuedo-code approach
 To determine if an input is prime, we can create a loop that checks whether our input is divisible by integers in range 2 ..> input / 2. We start at 2 because we know that our input will be greater than 1.
 
 The reason we only need to check the numbers in range up to our input / 2 is because no Integer x > input / 2 will exist such that input % x == 0. In otherwords, the remainder of any number greater than half of our input will not divide evenly thus we shouldn't need to check it.
 
 We also must check the following edge cases
 * numbers < 2 should return false
 * if input == 2 || 3, input / 2 < starting bound, causes error, must check this condition before entering our loop
 Example function in a java like language.
 # Example #
 ```
 isPrime(Integer input) {
    for(int i = 2; i <= input / 2; i++){
        if (input % i == 0) {
            return false;
        }
    }
  return true;
 }
 
 
 ```
 */
 // My implimentation in swift!
 
func isPrime(input:Int) -> Bool{
    if (input <= 1){
        return false
    }
    if(input == 2 || input == 3){
        return true
    }
    for num in 2 ... (input / 2) {
        if ((input % num) == 0){
            return false
        }
    }
    return true
}

print("test cases!")

print("for isPrime(input: 0), our output is: ", isPrime(input: 0)) // expects to be false
print("for isPrime(input: 3), our output is: ", isPrime(input: 3)) // expected to be true
print("for isPrime(input: 7), our output is: ", isPrime(input: 7)) // expected to be true
print("for isPrime(input: 33), our output is: ", isPrime(input: 33)) // expected to be false
print("for isPrime(input: 97), our output is: ", isPrime(input: 97)) // expected to be true
print("for isPrime(input: 4091), our output is: ", isPrime(input: 4091)) // expected to be true



