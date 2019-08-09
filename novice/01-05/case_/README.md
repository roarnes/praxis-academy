# Getting a web content using asynchronous programming in DART

Using DART, we would like to access and take the content from a specific URL in the web using a non-blocking I/O (asynchronous) and save the content into a .txt file.

## Required libraries

First we have to import the libraries that are necessary. We use dart:async to implement the asynchronous methods, dart:io to handle read/write operation, and dart:convert to handle the 
conversion from byte into utf-8.

```
import "dart:async"; 
import "dart:io"; //HttpClient()
import 'dart:convert'; //Utf8Decoder()
```

## Getting the content
Here we have an asynchronous method ```getContent()``` that will return the data of the collected content from the web.

```
getContent() async {
	var data;

	try{
		var url = Uri.parse('https://swapi.co/api/planets/1/');
    	var httpClient = HttpClient();
    	var request = await httpClient.getUrl(url);
    	var response = await request.close();
		data = await Utf8Decoder().bind(response).toList();
		httpClient.close();	
	}
	catch (e){
		print('Error $e');

	}

	return data;
}
```

## Printing the content
```printContent()``` calls ```getContent()``` and print the returned value after it finishes.
```
Future <void> printContent() async {
	var content = await getContent();
  	print(content);
}
```

## Saving the content
```saveContent()``` also calls ```getContent()``` and save the returned value after it finishes to a specific directory, which is /bin/planets.txt.
```
Future <void> saveContent() async {
	final filename = 'planets.txt';
	var content = await getContent();

	new File(filename).writeAsString(content.toString());

	print('Content saved!');
}
```

In our ```main()``` function we call first ```printContent()```, then ```saveContent()```, and do a print method. Since ```printContent()``` and ```saveContent()``` are both non-blocking, we should expect that the program will print first 'End of main'.

main():
```
void  main() async {
	printContent();
	saveContent();

    print('End of main');
}
```

Now after we run the program, it turns out that ```saveContent()``` finished first.

Output:
```bash
End of main

Content saved!

[{"name":"Tatooine","rotation_period":"23","orbital_period":"304","diameter":"10465","climate":"arid","gravity":"1 standard","terrain":"desert","surface_water":"1","population":"200000","residents":["https://swapi.co/api/people/1/","https://swapi.co/api/people/2/","https://swapi.co/api/people/4/","https://swapi.co/api/people/6/","https://swapi.co/api/people/7/","https://swapi.co/api/people/8/","https://swapi.co/api/people/9/","https://swapi.co/api/people/11/","https://swapi.co/api/people/43/","https://swapi.co/api/people/62/"],"films":["https://swapi.co/api/films/5/","https://swapi.co/api/films/4/","https://swapi.co/api/films/6/","https://swapi.co/api/films/3/","https://swapi.co/api/films/1/"],"created":"2014-12-09T13:50:49.641000Z","edited":"2014-12-21T20:48:04.175778Z","url":"https://swapi.co/api/planets/1/"}]
```

Arnes R. Putri.
August 2019.
Praxis Academy.