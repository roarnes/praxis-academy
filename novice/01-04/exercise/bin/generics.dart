import 'dart:collection'; 

void main(){
	//List
	List <String> logTypes = new List <String>();  
   logTypes.add("ERROR"); 
   logTypes.add("INFO"); 
  
   //iterating across list 
   for (String type in logTypes) { 
      print(type); 
   }

   // logTypes.add(1);

   //Set
   Set <int> numberSet = new  Set<int>(); 
	numberSet.add(60);
	numberSet.add(70); 
	numberSet.add(100); 
	numberSet.add(20); 
	numberSet.add(5); 
	numberSet.add(60);
	// numberSet.add('70'); //will give error

	print(numberSet);

	//Queue
	Queue<int> queue = new Queue<int>(); 
	print("Default implementation ${queue.runtimeType}");  
	queue.addLast(10); 
	queue.addLast(20); 
	queue.addLast(30); 
	queue.addLast(40); 
	queue.removeFirst();  
   
	for(int no in queue){ 
		print(no); 
	}

	//Map
	Map <String,String>m={'name':'Arnes','Id':'E1001'}; 
   print('Map :${m}'); 

}