import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() =>runApp(MaterialApp(home: ApiDemo()));
class ApiDemo extends StatefulWidget {
  @override
  State<ApiDemo> createState() => _ApiDemoState();
}
class _ApiDemoState extends State<ApiDemo>{
  String _data = "Press the button to fetch data";
  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        _data = "ID: ${json['id']}\nTitle: ${json['title']}\nCompleted: ${json['completed']}";
      });
    } else {
      setState(() {
        _data = "Error: ${response.statusCode}";
      });
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("REST API Demo")),
    body: Center(child: Text(_data, style: TextStyle(fontSize: 18))),
    floatingActionButton: FloatingActionButton(
      onPressed: fetchData,
      child: Icon(Icons.cloud_download),
    ),
  );
}
