# Basic Dart Constructs

## Printing
Prints are only allowed inside a ```main()``` function.
To display a string of "Hello World":

```
void main(List<String> arguments) {
	print ('Hello World');
}
 ```

```bash
>>Hello World
 ```

## Variables
Variables are 'named-space memory' which we can store values in. They must be declared before being used, i.e. before any operation in the ```main()``` uses them.

### ```var```
When any variable is declared as ```var```, Dart automatically sees the value contained in the variable and treat it accordingly. In a sense, it saves us from trouble to declaring our variables. 

```
	var name = 'Voyager I';
	var year = 1977;
	var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
```

The variable ```name``` is of type ```String```, ```year``` is of type ```int```, and ```flybyObjects``` is of type ```List```.


A variable initially declared as ```int``` can not be treated as any other variable type in the future. For example:

```
	var name = 'Voyager I';
	var name = 1977;
```

```bash
>>Error: A value of type 'int' can't be assigned to a variable of type 'String'.
>>Try changing the type of the left hand side, or casting the right hand side to 'String'.
	name = 1977;
	       ^
```

### Lists
A List stores an array of variable. It can also contain another List. When calling a value in a list, we are using index where the index starts at 0. If an empty list is being called, it will return ```null```.

```
	List<List<int>> lists = [[1],[2]];
	var galaxies = [['Milky Way', 'Andromeda'], ['Messier 81', 'Whirlpool']];

	void main(){
		print (lists[0]);
		print (galaxies[1][0]);
	}
```

```bash
>>[0]
>>Messier 81
```

### Maps
Maps are basically the same as Lists, where they can contain multiple values. However, a value in a Map can be associated with a certain key string, instead of just an index as in a List.

```
	Map space_objects = {
		"Planet" : ['Mercury', 'Venus'],
		"Star" : 'Sun'
	};

	void main(){
		print (space_objects['Planet'][0]);
	}
```

```bash
>>Mercury
```

## Control Flow Statements
Conditional flow in Dart makes use of ```if```, ```else```, or ```else if```, and the operation that is executed is the one that fulfills the given condition.

```
	var year = 1977;

	void main(){
		if (year >= 2001) {
			print('21st century');
		}
		else if (year >= 1901) {
			print('20th century');
		}
	}
```

```bash
>>20th century
```

### Loops
Loops or iteration, is a term where a repetition of a certain operation is necessary. Loops can be either definite or indefinite (not determined in prior). Definite loops uses ```for``` whereas indefinite uses ```while```.

```
	for (var object in flybyObjects) {
  		print(object);
	}

	while (year < 2016) {
  		year += 5;
  		print (year);
	}
```

```bash
>>Jupiter
>>Saturn
>>Uranus
>>Neptune
>>1982
>>1987
>>1992
>>1997
>>2002
>>2007
>>2012
>>2017
```
The first ```for``` loop prints all of the values in the String List ```flybyObjects```. The ```while``` loops checks whether the value of ```year``` is less than 2016. If it is less, then the value is added by 5 every time until it is greater than 2016.

Both ```for``` and ```while``` loops can run infinitely if the give conditions do not properly determine the end of its execution.


## Importing
Files, as well as libraries outside the ```main.dart``` file can be imported so that the methods, functions, or classes inside it can be used in ```main.dart```. To import a file, simply define the path location according to the package path.

For example, we have a project in another directory called ```project.dart``` and we can simply import it as:

```
import 'package:project/project.dart' as project;
```

## Functions
In the ```project.dart``` file that we have imported before, there are functions that we can call.

project.dart:
```
int multiply(int a, int b) {
  return a * b;
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;

  return fibonacci(n - 1) + fibonacci(n - 2);
}
```

main.dart:
```
import 'package:project/project.dart' as project;

void main(){
	print('${project.multiply(10, 2)}');
	print ('${project.fibonacci(20)}');
}
```

```bash
>>20
>>6765
```

## Classes
Like any other object-oriented language, Dart also has classes, interfaces, and other OOP features. A class is a blueprint for objects, which can further be inherited in another class. It has constructors, getters and setters, and methods.

Suppose we have a class called ```SpaceCraft```:
```
class Spacecraft {
	String name;
	DateTime launchDate;

	//Default constructor
	Spacecraft(this.name, this.launchDate) {
	}

	// Named constructor that forwards to the default one.
	Spacecraft.unlaunched(String name) : this(name, null);

	int get launchYear => launchDate?.year; // read-only non-final property

    // Method.
    void describe() {
    	print('Spacecraft: $name');
      	if (launchDate != null) {
      		int years = DateTime.now().difference(launchDate).inDays ~/365;
      		print('Launched: $launchYear ($years years ago)');
      	}
      	else {
      		print('Unlaunched');
      	}
    }
}
```

The class ```SpaceCraft``` has two constructors and one method. The first constructor is an empty constructor that takes two inputs, String ```name``` and ```DateTime launchDate```.

The method ```describe()``` has a conditional operation that outputs a label whether a space craft has been launched or not by looking at its ```launchDate```. If the space craft does not have a ```launchDate``` (i.e. ```.unlaunched```), then it will output a text saying 'Unlaunched'.

To use the ```SpaceCraft``` class, we declare our objects in ```main()``` as follows:

```
	var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
	voyager.describe();

	var voyager3 = Spacecraft.unlaunched('Voyager III');
	voyager3.describe();
```

The above lines basically means we are making two ```SpaceCraft``` objects called ```voyager``` and ```voyager3```. The first object, ```voyager``` is declared using the first (default) constructor from the ```SpaceCraft``` class, which has a ```name``` and a ```launchDate```, so we know that ```voyager``` is already being launched.

```bash
>>Spacecraft: Voyager I
>>Launched: 1977 (41 years ago)
```

The second object, ```voyager3``` is declared using the second constructor from the ```SpaceCraft``` class, which only has a ```name```, so we know that ```voyager``` is not being launched already.

```bash
>>Spacecraft: Voyager III
>>Unlaunched
```

## Inheritance
When we inherit a class from another class, the child class has all the properties and methods that the parent class have, but excluding the constructor. To inherit a class, the keyword ```extends``` is used. Below is an example class ```Orbiter``` that extends from our previous ```Spacecraft``` class.

```
class Orbiter extends Spacecraft {
	num altitude;

	Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);
}
```

The variable ```num altitude``` means that we can assign the value of ```altitude``` to be either an integer or a decimal and it will still be accepted (recall that ```var``` variables are not allowed to do so). For example:

```
	altitude = 100
	altitude = 100.0
```

In our ```main()``` we can simply make an instance of ```Orbiter``` by:

```
	var orbiter = Orbiter('Mars Orbiter', DateTime(2013, 11, 5), 421.7);
	orbiter.describe();
```

```bash
>>Spacecraft: Mars Orbiter
>>Launched: 2013 (5 years ago)
```
