import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/UserProvider.dart';
import 'productScreen.dart';
import 'cartScreen.dart';
import 'myOrderScreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),

      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userProvider.username),
              accountEmail: Text(userProvider.email),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person, size: 40),
              ),
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),

            // Home
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // Categories
            ListTile(
              leading: const Icon(Icons.category),
              title: const Text('Categories'),
              onTap: () {},
            ),

            // Products
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Products'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductsScreen(),
                  ),
                );
              },
            ),

            // Cart
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Cart'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CartScreen(),
                  ),
                );
              },
            ),

            // My Orders
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MyOrdersScreen(),
                  ),
                );
              },
            ),

            // Profile
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}