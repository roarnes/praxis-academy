import "dart:async"; 
import "dart:io"; //HttpClient()
import 'dart:convert'; //Utf8Decoder()

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

Future <void> printContent() async {
	var content = await getContent();
  	print(content);
}

Future <void> saveContent() async {
	final filename = 'planets.txt';
	var content = await getContent();

	new File(filename).writeAsString(content.toString());

	print('Content saved!');
}

void  main() async {
	printContent();
	saveContent();

    print('End of main');
}

