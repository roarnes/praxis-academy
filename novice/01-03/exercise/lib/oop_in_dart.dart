class Animal {
	String name;
	String species;
	num age;

	Animal (this.name, this.species, this.age){
	}

	// Animal(){
	// }

	void describe(){
		print('${name} is a ${age} year old ${species}.');
	}

	String get get_name{
		return name;
	}
}


// class Mammal extends Animal {


// 	Mammal (){

// 	}
// }