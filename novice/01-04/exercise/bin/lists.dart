var name = 'Earth';
var planets = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];

var star = new List();

var numbers = [2, 9, 10, 8, 3, 7];

main(List<String> arguments) {

	// List Methods
	planets[0] = 'Mercury';
	print(planets);

	print('There are ${planets.length} planets in our galaxy.');
	print('The first planet is ${planets.first}');
	print('The last planet is ${planets.last}');
	print(planets.reversed);

	if (planets.isEmpty){
		print('Planets has no elements.');
	}

	else if (planets.isNotEmpty){
		print('Planets has elements.');
	}

	star.add('Sun');
	print(star.single);
	// print(planets.single);


	planets.forEach((planet) => print(planet));

	var mappedPlanets = planets.map((planet) => '$planet is in our solar system').toList();
	print(mappedPlanets);

	print(planets.contains('Pluto'));

	numbers.sort((num1, num2) => num1 - num2);
	print (numbers);

	planets.where((planet) => planet.contains('a')).forEach(print);
}