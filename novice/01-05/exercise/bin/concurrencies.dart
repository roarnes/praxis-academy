import 'dart:isolate';  

void foo(var message){ 
   print('execution from foo ... the message is :${message}'); 
}  

void main(){ 
   Isolate.spawn(foo,'Hello!!'); 
   Isolate.spawn(foo,'Greetings!!'); 
   Isolate.spawn(foo,'Welcome!!'); 
   
   print('execution from main: 1'); 
   print('execution from main: 2'); 
   print('execution from main: 3'); 
}