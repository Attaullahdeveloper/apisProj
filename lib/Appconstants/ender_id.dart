import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/fetch_data.dart';

class Enterid extends StatefulWidget {
  const Enterid({super.key});

  @override
  State<Enterid> createState() => _EnteridState();
}

class _EnteridState extends State<Enterid> {
  bool isLoading = false;
  final TextEditingController idcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>(); //  add form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text(
          'Enter the user ID',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey, //  connect form
          child: Column(
            children: [
              TextFormField(
                controller: idcontroller,
                decoration: const InputDecoration(
                  labelText: 'Enter ID',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Please enter ID"; // ✅ return string
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // ✅ validate before proceeding
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    setState(() {
                      isLoading = false;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FetchData(
                          id: int.parse(idcontroller.text),
                        ),
                      ),
                    );
                  }
                },
                child: Center(
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Enter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
