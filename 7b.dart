import 'package:flutter/material.dart';
void main() =>runApp(const MaterialApp(home: NoDueForm()));
class NoDueForm extends StatefulWidget {
  const NoDueForm({super.key});
  @override
  State<NoDueForm> createState() => _NoDueFormState();
}
class _NoDueFormState extends State<NoDueForm>{
  final _key = GlobalKey<FormState>();
  final name = TextEditingController();
  final dept = TextEditingController();
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('No Due Form')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _key,
          child: Column(
            children: [
              TextFormField(
                controller: name,
                decoration: const InputDecoration(labelText: 'Student Name'),
                validator: (v) => v!.isEmpty ? 'Name required!' : null,
              ),
              TextFormField(
                controller: dept,
                decoration: const InputDecoration(labelText: 'Department'),
                validator: (v) => v!.isEmpty ? 'Department required!' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    setState(() {
                      result =
                          '✅ No Due Certificate Generated for ${name.text} from ${dept.text} Department!';
                    });
                  } else {
                    setState(() {
                      result = '⚠ Please fill all required details.';
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              Text(result,
                  style: const TextStyle(fontSize: 16, color: Colors.blue)),
            ],
          ),
        ),
      ),
    );
  }
}
