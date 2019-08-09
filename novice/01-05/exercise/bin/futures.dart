import "dart:async"; 
import "dart:io"; 

Future<void> printDailyNewsDigest() async {
  try {
    var newsDigest = await gatherNewsReports();
    print(newsDigest);
  } catch (e) {
    // Handle error...
    print('Error $e');
  }
}


Future<String> gatherNewsReports() =>
    Future.delayed(oneSecond, () => news);

const news = '<gathered news goes here>';
const oneSecond = Duration(seconds: 1);

void main() {
	// Async for opening a text file
	File file = new File('/Users/arnes/Praxis/novice/01-05/exercise/students.txt');
	Future<String> f = file.readAsString();  
	f.then((data)=>print(data));
	print("End of main");

	// News
	printDailyNewsDigest();
	printWinningLotteryNumbers();
	printWeatherForecast();
	printBaseballScore();

}

printWinningLotteryNumbers() {
  print('Winning lotto numbers: [23, 63, 87, 26, 2]');
}

printWeatherForecast() {
  print("Tomorrow's forecast: 70F, sunny.");
}

printBaseballScore() {
  print('Baseball score: Red Sox 10, Yankees 0');
}