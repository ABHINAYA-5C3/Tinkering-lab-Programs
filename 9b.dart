import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() =>runApp(MaterialApp(home: UpiDemo()));
class UpiDemo extends StatefulWidget {
  @override
  State<UpiDemo> createState() => _UpiDemoState();
}
class _UpiDemoState extends State<UpiDemo>{
  Map? user;
  Future<void> fetch() async {
    final r = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    setState(() => user = r.statusCode == 200 ? jsonDecode(r.body) : null);
  }
  @override
  Widget build(BuildContext ctx) => Scaffold(
    appBar: AppBar(title: Text('UPI Card API Demo')),
    body: Center(child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.blue.shade50, elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 70),
      child: Padding(
        padding: EdgeInsets.all(22),
        child: user == null
          ? Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.account_balance_wallet, size: 40, color: Colors.grey),
              Text("No Data Fetched", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold))
            ])
          : Column(mainAxisSize: MainAxisSize.min, children: [
              Icon(Icons.account_balance_wallet, size: 40, color: Colors.indigo),
              SizedBox(height: 10),
              Text(user!['name'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("UPI ID: ${user!['username']}@bank", style: TextStyle(color: Colors.indigo)),
              SizedBox(height: 5),
              Text(user!['email'], style: TextStyle(fontSize: 12)),
              Text("Contact: ${user!['phone']}", style: TextStyle(color: Colors.black54, fontSize: 12)),
              Text("City: ${user!['address']['city']}", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w500, fontSize: 12)),
            ])
      ),
    )),
    floatingActionButton: FloatingActionButton(
      onPressed: fetch, child: Icon(Icons.cloud_download),
    ),
  );
}
