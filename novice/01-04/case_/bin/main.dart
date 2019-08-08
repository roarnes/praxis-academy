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