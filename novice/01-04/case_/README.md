# Generic Class in DART

Directory: bin/main.dart

So here we are making a generic class of type ```T```. We do not declare the type of it in prior, instead we are going to do that in our ```main()``` function, so ```T``` is going to be versatile (hence the term 'generic').

There is one constructor with one parameter that will describe the type of T. The ```GenericClass``` has one getter that returns ```_object``` and one method that will print the type of ```T```.

```
class GenericClass <T> {
	T _object;

	GenericClass(T o) {
		_object = o;
	}

	T get object {
		return _object;
	}

	void showType() {
		print('Type of T is {$T}');
	}

}
```

In our ```main()``` function, first we declare three instances of ```GenericClass```, namely ```integerObject```, ```stringObject```, and ```doubleObject```. Now the three instances are all instances of ```GenericClass```, but each of them have different ```_object``` types, based on what we declared inside the ```<type>```.


```
void main() {
	//Integer 
	GenericClass <int> integerObject = new GenericClass<int>(100);
	integerObject.showType();

	int value = integerObject.object;
	print('Value: $value');

	//String
	GenericClass <String> stringObject = new GenericClass<String>('100');
	stringObject.showType();

	String value2 = stringObject.object;
	print('Value: $value2');

	//Double
	GenericClass <double> doubleObject = new GenericClass<double>(100.0);
	doubleObject.showType();

	double value3 = doubleObject.object;
	print('Value: $value3');
}
```

After running the program, we will have the output as follows:
```bash
Type of T is {int}
Value: 100
Type of T is {String}
Value: 100
Type of T is {double}
Value: 100.0
```