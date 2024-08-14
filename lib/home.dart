import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});

  snackbar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  List mylist = [
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/c/c5/JPEG_example_down.jpg",
      "title": "1"
    },
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/c/c5/JPEG_example_down.jpg",
      "title": "1"
    },
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/c/c5/JPEG_example_down.jpg",
      "title": "1"
    },
    {
      "img":
          "https://upload.wikimedia.org/wikipedia/commons/c/c5/JPEG_example_down.jpg",
      "title": "1"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Greeting App',
            style: TextStyle(color: Colors.black87, fontSize: 19.0),
          ),
          backgroundColor: Colors.white24,
        ),
        body: ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  snackbar(context, mylist[index]['title']);
                },
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: Image.network(
                    mylist[index]['img'],
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }));
  }
}
