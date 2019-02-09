import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'model/images_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';


class App extends StatefulWidget {
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {

  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
      ++counter;
      var response = await get("https://jsonplaceholder.typicode.com/photos/$counter");
      var imageModel = ImageModel.parsedJson(json.decode(response.body));
      setState(() {
        images.add(imageModel);
      });
  }


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Images"),
        ),
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: fetchImage,
        ),
      ),
    );
  }

}