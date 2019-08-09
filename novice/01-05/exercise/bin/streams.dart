import 'dart:async';

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  // await for (var value in stream) {
  //   sum += value;
  // }
  // return sum;

  //with error event -- handling exceptions
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
    yield i;

    //with error events
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
  print('stream value: $stream');
  var sum = await sumStream(stream);
  print(sum);
}

