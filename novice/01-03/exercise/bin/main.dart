import 'package:exercise/oop_in_dart.dart' as oop;

main(List<String> arguments) {

	var cat = new oop.Animal('Kitty', 'Cat', 2);
	var dog = new oop.Animal('Brad', 'Dog', 2.5);

	cat.describe();
	dog.describe();
	print(cat.get_name);
}
