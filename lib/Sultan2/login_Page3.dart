import 'package:flutter/material.dart';

import '../home_page.dart';
import 'screens/homeScreen.dart';
import 'signup_page3.dart';

import 'package:provider/provider.dart';
import 'providers/UserProvider.dart';

class Loginscreen3 extends StatefulWidget {
  const Loginscreen3({super.key});

  @override
  State<Loginscreen3> createState() => _Loginscreen3State();
}

class _Loginscreen3State extends State<Loginscreen3> {

  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();





  Future<void> login(BuildContext context) async {
    final username = usernamecontroller.text.trim();
    final password = passwordcontroller.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter username and password'),
        ),
      );
      return;
    }

    final provider = context.read<UserProvider>();

    final success = await provider.login(username, password);

    if (!mounted) return;

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Homescreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(provider.error ?? 'Login failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  void dispose() {
    usernamecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.indigo,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              const SizedBox(height: 50),

              const Icon(
                Icons.person,
                size: 100,
                color: Colors.indigo,
              ),

              const SizedBox(height: 20),

              TextField(
                controller: usernamecontroller,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),

              const SizedBox(height: 20),

              Consumer<UserProvider>(
                builder: (context, provider, child) {
                  return ElevatedButton(
                    onPressed: provider.isLoading
                        ? null
                        : () => login(context),

                    child: provider.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  );
                },
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text('Dont have an account?'),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const Signupscreen(),
                        ),
                      );
                    },

                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Text('Navigate to Forget Password?'),

              GestureDetector(
                onTap: () {},

                child: const Text(
                  'Forget Password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}