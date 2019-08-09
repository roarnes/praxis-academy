# Asynchronous in DART

Asynchronous operation, in comparison to a synchronous (the classic operation), does not block a certain part of the program, including the latter parts.

In dart, the asynchronous operation is done with ```Future<type>```.

## Future<type>
Directory: bin/futures.dart

Here we try opening a .txt file in our program and see how asynchonous operation works.
```
void main() {
	// Async for opening a text file
	File file = new File('.../exercise/students.txt');

	Future<String> f = file.readAsString();  
	f.then((data)=>print(data));

	print("End of main");
}
```

students.txt:
```
1. Arnes
2. Ghinaya
3. Indra
4. Vidiskiu
5. Jehezkiel
```

Output:
```bash
End of main
1. Arnes
2. Ghinaya
3. Indra
4. Vidiskiu
5. Jehezkiel

```

As seen from the output, the content of ```students.txt``` appeared later because opening a file essentially takes longer than to print a string.

### ```async``` and ```await```

The asyncrony in DART is supported by ```async``` and ```await```. In the following example we have two asynchronous functions and three synchronous functions.

Asynchronous functions:
```
Future<void> printDailyNewsDigest() async {
  var newsDigest = await gatherNewsReports();
  print(newsDigest);
}

Future<String> gatherNewsReports() =>
    Future.delayed(oneSecond, () => news);

const news = '<gathered news goes here>';
const oneSecond = Duration(seconds: 1);
```

```printDailyNewsDigest()``` takes a String of ```news``` which the function ```gatherNewsReports()``` returns. However, ```gatherNewsReports()``` is delayed for one second to return ```news```.

Synchronous functions:
```
printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}
```

Our synchronous functions above do not effect the other part of the program, while the asynchronous ones obviously do.

In the main() function, we call ```printDailyNewsDigest()``` first, followed by the rest of our syncronous function. We would expect then, since ```printDailyNewsDigest()``` awaits for ```gatherNewsReports()```, which is delayed for a second, ```printWinningLotteryNumbers()```, ```printWeatherForecast()```, and ```printBaseballScore()``` will be executed firstm in the order that they are called in main().

main():
```
void main() {
	printDailyNewsDigest();
	printWinningLotteryNumbers();
	printWeatherForecast();
	printBaseballScore();
}
```

Output:
```bash
Winning lotto numbers: [23, 63, 87, 26, 2]
Tomorrow's forecast: 70F, sunny.
Baseball score: Red Sox 10, Yankees 0
<gathered news goes here>
```

## Stream
Directory: bin/streams.dart

Another characterization of asynchronous programming in dart is stream. In stream, the asynchronous for loop (commonly just called await for) iterates over the events of a stream like the for loop iterates over an Iterable.

```
import 'dart:async';


Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }

}

main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); //output is 55
}
```

We can also pass an exception using ```try``` and ```catch``` method which is written as follows.

```
import 'dart:async';


Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  try {
    await for (var value in stream) {
      print('pp $value');
      sum += value;
    }
  } catch (e) {
    print(e);
    return -1;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    if (i == 4) {
      throw new Exception('Intentional exception');
    } 
    else {
      yield i;
    }
    print(i);
  }

}

main() async {
  var stream = countStream(10);
  var sum = await sumStream(stream);
  print(sum); //output is -1
}
```

## Concurrency
Directory: bin/concurrencies.dart

Concurrency is the execution of several instruction sequences at the same time. It involves performing more than one task simultaneously. The units of running codes are isolated, and they are called isolates.

Below is the example of using isolate in DART.

```
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
```

Here, the spawn method of the Isolate class facilitates running a function, foo, in parallel with the rest of our code. The spawn function takes two parameters −

the function to be spawned, and
an object that will be passed to the spawned function.
In case there is no object to pass to the spawned function, it can be passed a NULL value. After each run, the program will give different outputs.


Output 1:
```bash
execution from main: 1
execution from main: 2
execution from main: 3
execution from foo ... the message is :Greetings!!
execution from foo ... the message is :Hello!!

```

Output2 :
```bash
execution from main: 1
execution from main: 2
execution from main: 3
execution from foo ... the message is :Greetings!!
execution from foo ... the message is :Welcome!!
execution from foo ... the message is :Hello!!
```

