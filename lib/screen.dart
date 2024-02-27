import 'dart:convert';
import 'package:flutter/material.dart';
import 'Item.dart';

class JsonListViewScreen extends StatefulWidget {
  @override
  _JsonListViewScreenState createState() => _JsonListViewScreenState();
}

class _JsonListViewScreenState extends State<JsonListViewScreen> {
  late List<Item> items;

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  Future<void> loadItems() async {
    // Carga el JSON desde el archivo assets
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/data.json');
    List<dynamic> jsonList = json.decode(jsonString);

    // Convierte el JSON en objetos Dart
    setState(() {
      items = jsonList.map((item) => Item.fromJson(item)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'JSON ListView Example',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.lightBlueAccent,
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              title: Text(
                items[index].name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'ID: ${items[index].id}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
