import UIKit



/*:
 # Partial Sum
 In this problem, we write a function that takes in an array of integers, and an array of integer tuples of length 2, in the form partialSum([1,4,5,2,5],[(2,4),(1,2),(0,3)]). It should return the sum of the numbers between the positions a and b in the array.
 
 ## Constraints
 * Array2.length >= 1
 *
 ## Psuedo-code approach
To calculate the partial sum of the 2 arrays. We should initialize a toReturn Integer array with length equal to the length of or Array2. This is because Array2 tells us how many partitions of the array we are calculating the sum of. We then maintain an outer loop that loops over each tuple in Array2 and stores it's index, inside this loop we initialize a local sum variable that we will give the value of 0. This is so that after we compute a local sum of a partition, the value will revert back to zero for the next iteration of the outer loop. We then initialize an inner array that will loop over the bounds declared by constants leftbound = array[i].0 and rightbound = array[i].1. These are the bounds specified by each entry in Array2. From there we add the sum of each entry from array[1] over the range of our inner loop and add the local sum to the outer-indexed position in our return array.
 Example function in a java like language.
 # Example #
 
 ```
 Array partialSum(Int[] arr1, Int[][] arr2){
    var toReturn = new Int[](arr2.length());
    for( int i = 0; i < array2.length; i++){
        Int localSum = 0;
        int leftBound = arr2[i][0];
        int rightBound = arr2[i][1];
        for(int j = leftBound; j < rightBound; j++){
            localSum += arr1[j];
    
        }
        toReturn[i] = localSum;
    }
    return (toReturn)
 }
 
 ```
 */


func partialSum( Array1: [Int], Array2: [(Int,Int)]) -> ([Int]) {
    var toReturn = [Int](repeating: 0, count: Array2.count)
    for i in 0..<Array2.count{
        var localSum = 0
        let leftBound = Array2[i].0
        let rightBound = Array2[i].1
        
        for j in leftBound...rightBound{
            localSum+=Array1[j]
        }
        toReturn[i]=localSum
    }
    return(toReturn)
    
}

print("Array1: [3, 6, 4, 15, 30], Array2: [(1, 3), (0, 4)]")
print("Expected: [25,58], Actual:", partialSum(Array1: [3, 6, 4, 15, 30], Array2: [(1, 3), (0, 4)]))

print("Array1: [1, 2, 3, 4, 5], Array2: [(0, 2), (1, 4), (2, 3)]")
print("Expected: [6, 14, 7], Actual:", partialSum(Array1: [1, 2, 3, 4, 5], Array2: [(0, 2), (1, 4), (2, 3)]))

print("Array1: [10, 20, 30, 40, 50], Array2: [(0, 0), (2, 2), (3, 4)]")
print("Expected: [10, 30, 90], Actual:", partialSum(Array1: [10, 20, 30, 40, 50], Array2: [(0, 0), (2, 2), (3, 4)]))

print("Array1: [5, 10, 15, 20], Array2: [(0, 1), (0, 3)]")
print("Expected: [15, 50], Actual:", partialSum(Array1: [5, 10, 15, 20], Array2: [(0, 1), (0, 3)]))
