//Exercises on basic algorithmic problems

// 1. Finding the Minimum and Maximum Values in an Array

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

//2. Sorting a sequence of numbers using insertion sort algorithm

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

// List<int> selectionSort(var array){
// 	print(array);
// 	for (int i = 0; i < array.length-1; i++){
// 		print('Step: ${i+1}');
// 		int indexMin = i;
// 		print('Current minimum value: ${array[indexMin]}');

// 		print('Searching for the least value in the right hand side sublist...');
// 		for (int j = i+1; j < array.length; j++){
// 			if (array[j] < array[indexMin]){
// 				print ('Found a lesser value: ${array[j]}');
// 				indexMin = j;
// 			}
// 		}
// 		if (indexMin != i){
// 			print('Swapping values...');
// 			int temp = array[i];
// 			array[i] = array[indexMin];
// 			array[indexMin] = temp;
// 			print(array);
// 		}
// 	}
// 	print(array);

// 	return array;
// }

//The modified selectionSort function with additional parameter
List<int> selectionSort(var array, int lastIndex){
	print(array);
	for (int i = 0; i < lastIndex; i++){
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

int findMaxDifference(var array){
	var min_max = findMinMax(array);

	int difference = min_max[1] - min_max[0];

	print ('Difference result: $difference');

	return difference;
}

int findMinDifference(var array){
	var sortedArray = selectionSort(array, 2);

	int difference = sortedArray[1] - sortedArray[0];

	print('Difference result: $difference');

	return difference;
}