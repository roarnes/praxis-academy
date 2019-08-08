import 'dart:collection'; 

var students = new HashMap();
var courses = new HashSet();

void main(){
	//HashMap
	students['dept']='Computer Science'; 
	students['name']='Arnes'; 
	students['email']='arnes@abc.com'; 
	print('Map after adding  entries :${students}'); 

	students.addAll({'dept': 'Computer Science', 'email' : 'arnes@abc.com'});

	students.remove('dept');
	print('Map after removing one entry :${students}'); 
	students.clear();
	print('Map after removing all entries :${students}'); 

	// HashSet
	courses.add('Calculus');
	courses.add('Programming');
	courses.add('Database');

	// courses.addAll(['Calculus', 'Programming', 'Database']);
	courses.remove('Calculus');
	print('Set after removing one entry : $courses');
	courses.clear();
	print('Set after removing all entry : $courses');
}