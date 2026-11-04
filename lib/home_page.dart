import 'package:flutter/material.dart';

import 'Sultan1/productScreen.dart';
import 'profile_page.dart';
import 'Sultan1/login_Page3.dart';


class HomePage extends StatelessWidget {

  final String? username;
  final String? email;
  final int? userId;


  final String? gender;
  final DateTime? dateOfBirth;

  const HomePage({
    super.key,
    this.username,
    this.email,
    this.userId,
    this.gender,
    this.dateOfBirth,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              'Gender: ${gender ?? "Not Selected"}',
            ),

            Text(
              'Date of Birth: ${dateOfBirth == null ? "Not Selected" : "${dateOfBirth!.day}/${dateOfBirth!.month}/${dateOfBirth!.year}"}',
            ),

          ],
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [

            UserAccountsDrawerHeader(

              accountName: Text(
                username ?? 'Sultan Portfolio',
              ),

              accountEmail: Text(
                email ?? 'No Email',
              ),

              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.blue,
                ),
              ),

              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),

              title: const Text('Home'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),

              title: const Text('Profile'),

              onTap: () {

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      username: username,
                      email: email,
                      userId: userId,
                      gender: gender,
                      dateOfBirth: dateOfBirth,
                    ),
                  ),
                );
              },
            ),

            // PRODUCTS
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.blue,
              ),

              title: const Text('Products'),

              onTap: () {

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ProductsScreen(),
                  ),
                );
              },
            ),

            const Spacer(),

            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),

              title: const Text(
                'Logout',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),

              onTap: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const Loginscreen3(),
                  ),
                      (route) => false,
                );
              },
            ),

          ],
        ),
      ),

      endDrawer: Drawer(
        child: Column(
          children: [

            UserAccountsDrawerHeader(

              accountName: Text(
                username ?? 'Sultan Portfolio',
              ),

              accountEmail: Text(
                email ?? 'No Email',
              ),

              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                ),
              ),

              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.blue,
              ),

              title: const Text('Home'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),

              title: const Text('Profile'),

              onTap: () {

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      gender: gender,
                      dateOfBirth: dateOfBirth,
                    ),
                  ),
                );
              },
            ),

            // PRODUCTS
            ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.blue,
              ),

              title: const Text('Products'),

              onTap: () {

                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ProductsScreen(),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}