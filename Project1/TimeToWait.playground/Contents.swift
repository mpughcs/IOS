import UIKit


/*:
 # How much tome to wait?
 In this problem, we write a function that takes in 4 integers representing first hour, first minute, second hour, second minute, and return amount of time that spans the 2 times as a string in the form "you should wait /(time3)"
 
 ## Constraints
 * inputs >= 0
 *
 ## Psuedo-code approach
 To calculate the amount of time between the provide hours and minutes, we should
immediately store each time in seperate variables that represents the time in minutes so that we are working within a single unit for the calculation, and we can extract the separate units once we finish the subtraction.
if after we subtract time1 from time2 we get a negative value, we
know we have moved to the next day, and we can add 24 hours to our
difference

 Example function in a java like language.
 # Example #
 
 ```
 String timeToWait(int firstHour, int firstMinute, int secondHour, int secondMinute){
    Int time1 = (firstHour * 60) + firstMin;
    Int time2 = (secondHour * 60) + secondMin;
    Int difference = time2 - time1;
    if(difference < 0 ) {
        difference = difference + ( 24 * 60);
    }
    Int hours = difference / 60;
    Int min = difference % 60
    return ("You should wait " + hours + ":" + min:
 
 }
 
 ```
 */
 // My implimentation in swift!
func waitingTime(firstHour:Int, firstMinute: Int, secondHour:Int, secondMinute:Int) ->String {
    
    let time1:Int = firstHour * 60 + firstMinute
    let time2:Int =  secondHour * 60 + secondMinute
    var difference = time2 - time1
    
    if(difference < 0){
        difference += 24 * 60
    }
    let hours = difference / 60
    let min = difference % 60
 
    return ("You should wait \(hours):\(min)")

}


print(waitingTime(firstHour: 11, firstMinute: 30, secondHour: 13, secondMinute: 15))

print("for inputs 11:30, 13:15, our output is: ", waitingTime(firstHour: 11, firstMinute: 30, secondHour: 13, secondMinute: 15)) // expects to be "You should wait 1:45"
//
print("for inputs 9:00, 10:30, our output is: ", waitingTime(firstHour: 9, firstMinute: 0, secondHour: 10, secondMinute: 30)) // expects to be "You should wait 1:30"
//
print("for inputs 15:45, 16:00, our output is: ", waitingTime(firstHour: 15, firstMinute: 45, secondHour: 16, secondMinute: 0)) // expects to be "You should wait 0:15"
//
print("for inputs 8:00, 20:45, our output is: ", waitingTime(firstHour: 8, firstMinute: 0, secondHour: 20, secondMinute: 45)) // expects to be "You should wait 12:45"

print("for inputs 23:59, 00:01, our output is: ", waitingTime(firstHour: 23, firstMinute: 59, secondHour: 0, secondMinute: 1)) // expects to be "You should wait 0:2"

print("for inputs 00:00, 00:00, our output is: ", waitingTime(firstHour: 0, firstMinute: 0, secondHour: 0, secondMinute: 0)) // expects to be "You should wait 0:0"

print("for inputs 11:20, 9:15, our output is: ", waitingTime(firstHour: 11, firstMinute: 20, secondHour: 9, secondMinute: 15)) // expects to be "You should wait 21:55"
print("for inputs 11:20, 11:19, our output is: ", waitingTime(firstHour: 11, firstMinute: 20, secondHour: 11, secondMinute: 19)) // expects to be "You should wait 23:59"
print("for inputs 24:00, 00:00, our output is: ", waitingTime(firstHour: 24, firstMinute: 00, secondHour: 0, secondMinute: 0)) // expects to be "You should wait 0:0"
