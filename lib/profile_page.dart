import 'package:flutter/material.dart';
import 'my_text_form_field.dart';
import 'home_page.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'Sultan Portfolio',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home, color: Colors.blue),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.person, color: Colors.blue),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),

            const SizedBox(height: 15),

            const Text(
              'Sultan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text('Network Engineer'),
            const Text('Web Developer'),
            const Text('Flutter Developer'),

            const SizedBox(height: 30),

            const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Form(
              child: Column(
                children: [
                  const MyTextFormField(name: 'Full Name'),

                  const SizedBox(height: 15),

                  const MyTextFormField(name: 'Email'),

                  const SizedBox(height: 15),

                  const MyTextFormField(name: 'Specialization'),

                  const SizedBox(height: 25),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile form submitted'),
                        ),
                      );
                    },
                    child: const Text('Save Profile'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}