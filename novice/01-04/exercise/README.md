# Data Structure, Collections, and Generics

## List
Directory: bin/lists.dart

### Declaring a list

List containing specified values:
```
var planets = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];
```

List containing zero value:
```
var star = new List();
```

### Initializing a list

Populating a certain index with a given value:
```
planets[0] = 'Mercury';
```

### Adding a value to a list

```
void main(){
	star.add('Sun');
}
```

### Basic list properties

#### .length
Returns the size of the list.
```
	print('There are ${planets.length} planets in our galaxy.');
```

Output:
```bash
There are 8 planets in our galaxy.
```

#### .first and .last
Returns the first element of a list.
```
	print('The first planet is ${planets.first}.');
	print('The last planet is ${planets.last}.');
```

Output:
```bash
The first planet is Mercury.
The last planet is Neptune.
```

#### .reversed
Returns the elements of the list in a reversed order.
```
	print(planets.reversed);
```

Output:
```bash
(Neptune, Uranus, Saturn, Jupiter, Mars, Earth, Venus, Mercury)
```

#### .isEmpty and .isNotEmpty
Returns a boolean (true/false) if the collection has any or no elements.
```
	if (planets.isEmpty){
		print('Planets has no elements.');
	}

	else if (planets.isNotEmpty){
		print('Planets has elements.');
	}
```

Output:
```bash
Planets has elements.
```

### .single
Checks if the list has only one element and returns it.
```
	print(star.single);
```

Output:
```bash
Sun
```

NOTE: if .single method is called for a list that has more than one element, it will return an exception!
```
	print(planets.single);
```

Output:
```bash
Unhandled exception:
Bad state: Too many elements
#0      List.single (dart:core-patch/growable_array.dart:227:5)
#1      main (file:///Users/arnes/Praxis/novice/01-04/exercise/bin/main.dart:36:16)
#2      _startIsolate.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:299:32)
#3      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:172:12)
```

#### .forEach()
Runs a function on each element in the list.
```
	planets.forEach((planet) => print(planet));
```

Output:
```bash
Mercury
Venus
Earth
Mars
Jupiter
Saturn
Uranus
Neptune
```

#### .map()
Transforms each element in a given list and produces a new list accordingly.
```
	var mappedPlanets = planets.map((planet) => '$planet is in our solar system').toList();

	print(mappedPlanets);
```

Output:
```bash
[Mercury is in our solar system, Venus is in our solar system, Earth is in our solar system, Mars is in our solar system, Jupiter is in our solar system, Saturn is in our solar system, Uranus is in our solar system, Neptune is in our solar system]
```

#### .contains
Checks to confirm that a given element is in the list.
```
	print(planets.contains('Pluto'));
```

Output:
```bash
false
```

#### .sort()
Order the elements in the list based on the provided ordering function.
```
	var numbers = [2, 9, 10, 8, 3, 7];

	numbers.sort((num1, num2) => num1 - num2);
	print (numbers);
```

Output:
```bash
[2, 3, 7, 8, 9, 10]
```

#### .where()
Returns a collection of elements that satisfies a given condition.
```
	planets.where((planet) => planet.contains('a')).forEach(print);
```

Output:
```bash
Earth
Mars
Saturn
Uranus
```


## Maps
Directory: bin/maps.dart

### Declaring a map
Using a Map literals:
```
Map space_objects = {
	"Planet" : ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'],
	"Star" : 'Sun'
};
```

Using a Map constructor:
```
var space_objects = new Map();

space_objects['Planets'] = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];
```

### Adding values
A map value can be any object, including NULL.
```
	space_objects['No of stars'] = 1000000000;
	space_objects['Blackholes'] = null;

	print(space_objects);
```

Output:
```bash
{Planet: [Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune], Star: Sun, No of stars: 1000000000, Blackholes: null}
```

### Map properties

#### .keys and .values
Returns an iterable object representing keys and values.
```
	print(space_objects.keys);
	print(space_objects.values);
```

Output:
```bash
(Planet, Star, No of stars, Blackholes)

([Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune], Sun, 1000000000, null
```

#### .length
Returns the size of the map.
```
	print(space_objects.length);
	
```

Output:
```bash
4
```

#### .isEmpty and .isNotEmpty
.isEmpty returns true if the Map is an empty Map, and .isNotEmpty returns true if the Map is not an empty Map.
```
	print(space_objects.isEmpty);
	print(space_objects.isNotEmpty);
```

Output:
```bash
false
true
```

## Collection Sets
Directory: bin/sets.dart

### HashMap
A HashMap is a hash table based implementation of Map. When you iterate through a HashMap's keys or values, you cannot expect a certain order.

```
var students = new HashMap();

void main(){
	students['dept']='Computer Science'; 
	students['name']='Arnes'; 		students['email']='arnes@abc.com';

	print('Map after adding  entries :${students}'); 
}
```

Output:
```bash
Map after adding  entries :{email: arnes@abc.com, dept: Computer Science, name: Arnes}
```

#### Adding multiple entries:
```
	students.addAll({'dept': 'Computer Science', 'email' : 'arnes@abc.com'});
	print('Map after adding  entries :${students}'); 
```

Output:
```bash
Map after adding  entries :{email: arnes@abc.com, dept: Computer Science}
```

#### Removing values from the HashMap


```
	students.remove('dept');
	print('Map after removing one entry :${students}'); 
	
	students.clear();
	print('Map after removing all entries :${students}'); 
```

Output:
```bash
Map after removing one entry :{email: arnes@abc.com, name: Arnes}
Map after removing all entries :{}
```

### HashSet
A HashSet is an unordered hash-table based Set implementation.

Declaration:
```
var courses = new HashSet();
```

#### Adding values
When populating a HashSet, it can be done with add() for single value or addAll() for multiple values.
```
	courses.add('Calculus');
	courses.add('Programming');
	courses.add('Database');

	courses.addAll(['Calculus', 'Programming', 'Database']);
```

Both ways should give the same output:
```bash
{Calculus, Programming, Database}
```

#### Removing values
The methods for removing single or multiple values are the same as in a HashMap.
```
	courses.remove('Calculus');
	print('Set after removing one entry : $courses');
	courses.clear();
	print('Set after removing all entry : $courses');
```

Output:
```bash
Set after removing one entry : {Programming, Database}
Set after removing all entry : {}
```

### Generics

Directory: bin/generics.dart

The use of Generics enforces a restriction on the data type of the values that can be contained by the collection. Such collections are termed as type-safe collections.

#### Generic List
```
	List <String> logTypes = new List <String>(); 
   
   logTypes.add("ERROR"); 
   logTypes.add("INFO"); 
  
   //iterating across list 
   for (String type in logTypes) { 
      print(type); 
   }
```

Output:
```bash
ERROR
INFO
```

When we try to add a value that is not of type String, it will result in an error:

```
   logTypes.add(1);
```

Output:
```bash
Error: The argument type 'int' can't be assigned to the parameter type 'String'.
Try changing the type of the parameter, or casting the argument to 'String'.
   logTypes.add(1); 
                ^
```

#### Generic Set
```
	Set <int>numberSet = new  Set<int>(); 
	numberSet.add(60);
	numberSet.add(70); 
	numberSet.add(100); 
	numberSet.add(20); 
	numberSet.add(5); 
	numberSet.add(60);
	// numberSet.add('70');

	print(numberSet);
```

#### Generic Queue
```
	import 'dart:collection'; 

	void main(){
		Queue<int> queue = new Queue<int>(); 
		print("Default implementation ${queue.runtimeType}");  
		queue.addLast(10); 
		queue.addLast(20); 
		queue.addLast(30); 
		queue.addLast(40); 
		queue.removeFirst();  
   
		for(int no in queue){ 
			print(no); 
		}
	}
```

Output:
```bash
Default implementation ListQueue<int>
20
30
40
```

#### Generic Map
```
	import 'dart:collection'; 

	void main(){
		Map <String,String>m={'name':'Arnes','Id':'E1001'}; 
   print('Map :${m}'); 
	}
```

Output:
```bash
Map :{name: Arnes, Id: E1001}
```



Arnes R. Putri.
August 2019.
Praxis Academy.