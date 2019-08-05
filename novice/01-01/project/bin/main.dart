import 'package:project/project.dart' as project;

//Declaring Variables
	var name = 'Voyager I';
	var year = 1977;
	var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];

	List<List<int>> lists = [[0],[0]];
	var galaxies = [['Milky Way', 'Andromeda'], ['Messier 81', 'Whirlpool']];

	Map space_objects = {
		"Planet" : ['Mercury', 'Venus'],
		"Star" : 'Sun'
	};


void main() {
	print ('Hello World');

	//Lists
	print (lists[0]);
	print (galaxies[1][0]);

	//Maps
	print (space_objects['Planet'][0]);

	//Control Flow
	if (year >= 2001) {
		print('21st century');
	}
	else if (year >= 1901) {
		print('20th century');
	}

	//Loops
	for (var object in flybyObjects) {
		print(object);
	}

	while (year < 2016) {
		year += 5;
		print (year);
	}

	flybyObjects.where((name) => name.contains('a')).forEach(print);

	//Function from imported file
	print('${project.multiply(10, 2)}!');
	print ('${project.fibonacci(20)}');


	//Class object
	var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
	voyager.describe();

	var voyager3 = Spacecraft.unlaunched('Voyager III');
	voyager3.describe();

	var orbiter = Orbiter('Mars Orbiter', DateTime(2013, 11, 5), 421.7);
	orbiter.describe();
}


class Spacecraft {
  String name;
  DateTime launchDate;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  int get launchYear =>
      launchDate?.year; // read-only non-final property

  // Method.
  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years =
          DateTime.now().difference(launchDate).inDays ~/
              365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  num altitude;
  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);
}

//Mixin
class Piloted {
  int astronauts = 1;
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
}

//Interface
//All classes are basically interfaces, defined implicitly
class MockSpaceship implements Spacecraft {
  // ···
}

//Abstract
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}