import 'package:flutter/material.dart';
import 'my_text_form_field.dart';

  class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? _selectedGender;
  DateTime? _selectedDate;
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && mounted) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 30),

              const MyTextFormField(name: "Username"),

              const SizedBox(height: 20),

              const MyTextFormField(name: "Email"),

              const SizedBox(height: 20),

              const MyTextFormField(
                name: "Password",
                isPassword: true,
              ),
              const SizedBox(height: 20),

              DropdownButton<String>(
                hint: const Text('Select Gender'),
                value: _selectedGender,
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _selectDate,
                child: const Text('Select Date of Birth'),
              ),

              const SizedBox(height: 10),

              Text(
                _selectedDate == null
                    ? 'No Date Selected'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                  onPressed: () {
                    Navigator.pop(context, {
                      'gender': _selectedGender,
                      'dateOfBirth': _selectedDate,
                    });
                  },

                child: const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}