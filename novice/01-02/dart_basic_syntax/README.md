# DART BASIC AlGORITHMS

This project gives solutions to some of the basic algorithm problems as shown in [Algorithms: Basic Exercises – Part 1] (https://devinpractice.com/2017/10/22/algorithms-basic-exercises-part-1/) using DART programming language as an introduction to the basic syntax in DART.

There are two files written, namely ```main.dart``` and ```dart_basic_syntax.dart```. All the algorithms that are explained here are written as functions in lib/dart_basic_syntax.dart.

Here we have an array of 10 integers in an unordered sequence:

```
var num_array = [3,9,1,0,5,4,12,2,9,8];
```

## 1. Finding a minimum and a maximum in a sequence of numbers

We would like to find the min and max value in ```num_array```.

```
List<int> findMinMax (var array) {
	int min = array[0];
	int max = array[0];

	print('Current min value: $min');
	print('Current max value: $max');

	for (int i = 1; i < array.length; i++){
		if (array[i] < min) {
			print('Found a number less than $min-> ${array[i]}');
			min = array[i];
			print('Current min value: $min');
		}
		if (array[i] > max) {
			print('Found a number greater than $max-> ${array[i]}');
			max = array[i];
			print('Current max value: $max');
		}
	}
	print ('Minimum value is $min');
	print ('Maximum value is $max');

	return [min, max];
}
```

First, we initialize two integer variables ```min``` and ```max```. The operation undergoes indefinitely, starting from index 1 until 9 (i.e. ```array.length - 1```). In each iteration step, we check if the current array value is less or greater than the value of either ```min``` or ```max```. If so, then we change the values for ```min``` and ```max``` accordingly. In the last step, we will obtain the correct minimum and maximum values.

The ```findMinMax``` function returns a list of integers that contain the minimum and maximum value which we can use further as an input for another function. Now the DART programming language do not provide multiple return values, and so we return one list containing two values instead.

Output:
```bash
Current min value: 3
Current max value: 3
Found a number greater than 3-> 9
Current max value: 9
Found a number less than 3-> 1
Current min value: 1
Found a number less than 1-> 0
Current min value: 0
Found a number greater than 9-> 12
Current max value: 12
Minimum value is 0
Maximum value is 12
```

## 2. Insertion Sort
Insertion sort is one of the basic sorting algorithms. The code for sorting in an ascending order is as follows.

```
List<int> insertionSort(var array){
	for (int i = 1; i < array.length; i++){
		print('Step: $i');
		int key = array[i];
		print('key = $key');
		int j = i;
		while (j > 0 && array[j-1] > key){
			print('Found a number bigger than $key: ${array[j-1]}');
			array[j] = array [j-1];
			print('Inserting ${array[j]}...');
			print (array);
			j = j-1;
		}
		array [j] = key;
		print (array);
	}
	return array;
}
```

 In the above insertion sort algorithm, we are sorting the numbers from the left hand side. First, we initialize a value called ```key``` with the value of our second index array (```i = 1```). This key is going to be the benchmark between the left hand side and the right hand side. After we obtain our key, we look for the value in the previous array index and see if it's greater than our key. If so, then we copy that value into the current array index and repeat searching for a greater number again until our key is in the right location. If otherwise, then we can move on to the next iteration.

 The ```insertionSort``` function returns a list of the sorted numbers which we can use further as an input for another function.

Output:
```bash
Step: 1
key = 9
[3, 9, 1, 0, 5, 4, 12, 2, 9, 8]

Step: 2
key = 1
Found a number bigger than 1: 9
Inserting 9...
[3, 9, 9, 0, 5, 4, 12, 2, 9, 8]
Found a number bigger than 1: 3
Inserting 3...
[3, 3, 9, 0, 5, 4, 12, 2, 9, 8]
[1, 3, 9, 0, 5, 4, 12, 2, 9, 8]

Step: 3
key = 0
Found a number bigger than 0: 9
Inserting 9...
[1, 3, 9, 9, 5, 4, 12, 2, 9, 8]
Found a number bigger than 0: 3
Inserting 3...
[1, 3, 3, 9, 5, 4, 12, 2, 9, 8]
Found a number bigger than 0: 1
Inserting 1...
[1, 1, 3, 9, 5, 4, 12, 2, 9, 8]
[0, 1, 3, 9, 5, 4, 12, 2, 9, 8]

...

Step: 9
key = 8
Found a number bigger than 8: 12
Inserting 12...
[0, 1, 2, 3, 4, 5, 9, 9, 12, 12]
Found a number bigger than 8: 9
Inserting 9...
[0, 1, 2, 3, 4, 5, 9, 9, 9, 12]
Found a number bigger than 8: 9
Inserting 9...
[0, 1, 2, 3, 4, 5, 9, 9, 9, 12]
[0, 1, 2, 3, 4, 5, 8, 9, 9, 12]
```

As seen from our output, in the first step, there is no insertion being done since we did not encounter a value that is less than our key (i.e. 3 is less than 9).

## 3. Selection Sort
Selection sort is another sorting algorithm popular in the computer science field. The difference with insertion sort, rather than shuffling each element to the previous one for every lesser value found, the selection sort algorithm swaps the least value found in the right hand side of the unordered sub-list with the current array index element.

```
List<int> selectionSort(var array){
	print(array);
	for (int i = 0; i < array.length-1; i++){
		print('Step: ${i+1}');
		int indexMin = i;
		print('Current minimum value: ${array[indexMin]}');

		print('Searching for the least value in the right hand side sublist...');
		for (int j = i+1; j < array.length; j++){
			if (array[j] < array[indexMin]){
				print ('Found a lesser value: ${array[j]}');
				indexMin = j;
			}
		}
		if (indexMin != i){
			print('Swapping values...');
			int temp = array[i];
			array[i] = array[indexMin];
			array[indexMin] = temp;
			print(array);
		}
	}
	print(array);

	return array;
}
```

As seen in the above code, there are two ```for``` loops, one being inside another ```for``` loop. The outer ```for``` loop works for "dividing" our list into two sublists, the ordered left hand side sublist and the unordered right hand side sublist. So in the first iteration (i.e. ```i = 0```) we will have:

Ordered sublist: []
Unordered sublist: [3, 9, 1, 0, 5, 4, 12, 2, 9, 8]

The inner ```for``` loop works for getting the minimum value in the unordered sublist. Once we obtained the minimum value, we will swap the element in index 0 (```i = 0```) with the element of the minimum value's index (in this case, ```i = 3```). Note that if we did not find a lesser value in the unordered sublist than our current minimum, no swapping is done (hence the conditional ```if``` after the inner ```for``` loop). Afterwards, we will have:

Ordered sublist: [0]
Unordered sublist: [9, 1, 3, 5, 4, 12, 2, 9, 8]

Output:
```bash
[3, 9, 1, 0, 5, 4, 12, 2, 9, 8]
Step: 1
Current minimum value: 3
Searching for the least value in the right hand side sublist...
Found a lesser value: 1
Found a lesser value: 0
Swapping values...
[0, 9, 1, 3, 5, 4, 12, 2, 9, 8]
Step: 2
Current minimum value: 9
Searching for the least value in the right hand side sublist...
Found a lesser value: 1
Swapping values...
[0, 1, 9, 3, 5, 4, 12, 2, 9, 8]
Step: 3
Current minimum value: 9
Searching for the least value in the right hand side sublist...
Found a lesser value: 3
Found a lesser value: 2
Swapping values...
[0, 1, 2, 3, 5, 4, 12, 9, 9, 8]

...

Step: 9
Current minimum value: 9
Searching for the least value in the right hand side sublist...
[0, 1, 2, 3, 4, 5, 8, 9, 9, 12]
```

## 4. Finding the maximum difference in a list

In order to find the maximum difference of values within a list, we obviously have to find the maximum and the minimum values. Fortunately, we already have a function that can do so. So in the following code, we will recycle our ```findMinMax``` function into our ```findMaxDifference``` function.

```
int findMaxDifference(var array){
	var min_max = findMinMax(array);

	int difference = min_max[1] - min_max[0];

	print ('Difference result: $difference');

	return difference;
}
```

Now our ```findMinMax``` function return a list of two elements, the minimum and maximum value of the array, respectively, which we save in our list variable in ```findMaxDifference``` function called ```min_max```. So in order to get the difference, we just simply subtract the minimum value (```min_max[0]```) to the maximum value (```min_max[1]```).

## 5. Finding the minimum difference in a list

In order to find the minimum difference of values in an unordered list, we must first sort the list in an ascending order. However, we do not need to sort the entire list, instead we just have to sort the first two values in the list. 

Recall that we already have two sorting algorithms in our project, insertion sort and selection sort, and one would think that we could recycle these functions into our ```findMinDifference``` function, just like what we did in the previous ```findMaxDifference``` function. But let's say, rather than having 10 elements in our array, we have 1000. There will be at least a thousand more operations being done than what is actually needed. One can still recycle the functions of course, but obviously some modifications are necessary.

The following is the implementation of the function using selection sort algorithm.

```
int findMinDifference(var array){
	var sortedArray = selectionSort(array, 2);

	int difference = sortedArray[1] - sortedArray[0];

	print('Difference result: $difference');

	return difference;
}
```

In our ```selectionSort``` method, we simply add a second parameter called ```lastIndex``` for the function, and alter the range of our outer ```for``` loop.

```
List<int> selectionSort(var array, int lastIndex){
	print(array);
	for (int i = 0; i < lastIndex; i++){

	...

}
```

And the rest of the code stays the same.

Output:
```bash
[3, 9, 1, 0, 5, 4, 12, 2, 9, 8]
Step: 1
Current minimum value: 3
Searching for the least value in the right hand side sublist...
Found a lesser value: 1
Found a lesser value: 0
Swapping values...
[0, 9, 1, 3, 5, 4, 12, 2, 9, 8]
Step: 2
Current minimum value: 9
Searching for the least value in the right hand side sublist...
Found a lesser value: 1
Swapping values...
[0, 1, 9, 3, 5, 4, 12, 2, 9, 8]
[0, 1, 9, 3, 5, 4, 12, 2, 9, 8]
Difference result: 1
```

Arnes R. Putri
August 2019.
