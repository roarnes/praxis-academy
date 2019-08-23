# case_json_listview

This app uses http to get a json data from the web. The data then saved into a list of arrays which will later be used to populate a ListView.

Here's what the json data looks like:

```
[
  {
    "userId": 1,
    "id": 1,
    "title": "delectus aut autem",
    "completed": false
  },
  {
    "userId": 1,
    "id": 2,
    "title": "quis ut nam facilis et officia qui",
    "completed": false
  },
  {
    "userId": 1,
    "id": 3,
    "title": "fugiat veniam minus",
    "completed": false
  },
  {
    "userId": 1,
    "id": 4,
    "title": "et porro tempora",
    "completed": true
  },
  {
    "userId": 1,
    "id": 5,
    "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
    "completed": false
  },

  .....

]
```

So we are taking the key of 'title' to be displayed in the listview, and 'completed' to show an icon whether it is completed or not.

```
Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/todos"),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      data = json.decode(response.body);
    });

    print(data[1]);

    return "Success!";
}
```

```
showCompleted(int index){
    IconData icon;

    if (data[index]["completed"] == true){
      icon = Icons.check_circle_outline;
    }
    else {
      icon = Icons.radio_button_unchecked;
    }
    return icon;
}
```

Home page of the app:
[Home Page To Do List](ScreenShot.png)
