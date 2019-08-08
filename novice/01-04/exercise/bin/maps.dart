Map space_objects = {
	"Planet" : ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'],
	"Star" : 'Sun'
};

var space_objects = new Map();

void main(){
	// Maps Methods

	space_objects['Planets'] = ['Mercury', 'Venus', 'Earth', 'Mars'];

	space_objects['No of stars'] = 1000000000;
	space_objects['Blackholes'] = null;

	print(space_objects);

	print(space_objects.keys);
	print(space_objects.values);
	print(space_objects.length);
	print(space_objects.isEmpty);
	print(space_objects.isNotEmpty);
}