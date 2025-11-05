import 'package:flutter/material.dart';
void main() =>runApp(const MaterialApp(home: NoDueForm()));
class NoDueForm extends StatefulWidget {
  const NoDueForm({super.key});
  @override
  State<NoDueForm> createState() => _NoDueFormState();
}
class _NoDueFormState extends State<NoDueForm>{
  final name = TextEditingController();
  final roll = TextEditingController();
  final dept = TextEditingController();
  String result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("No Due Form"), backgroundColor: Colors.teal),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: name, decoration: const InputDecoration(labelText: "Student Name")),
          TextField(controller: roll, decoration: const InputDecoration(labelText: "Roll Number")),
          TextField(controller: dept, decoration: const InputDecoration(labelText: "Department")),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  result =
                      "✅ No Due Form Submitted\nName: ${name.text}\nRoll No: ${roll.text}\nDept: ${dept.text}";
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
              child: const Text("Submit")),
          const SizedBox(height: 15),
          Text(result, style: const TextStyle(fontSize: 16))
        ]),
      ),
    );
  }
}
