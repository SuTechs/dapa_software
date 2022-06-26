import 'package:flutter/material.dart';

import 'candidate.dart';
import 'category.dart';
import 'client.dart';
import 'work.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // height: kToolbarHeight,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          /// Work
          NavigationDestination(
            icon: Icon(Icons.work),
            label: 'Work',
          ),

          /// Client
          NavigationDestination(
            icon: Icon(Icons.storefront),
            label: 'Client',
          ),

          /// Candidate
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Candidate',
          ),

          /// Category
          NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? const Work()
          : _selectedIndex == 1
              ? const Client()
              : _selectedIndex == 2
                  ? const Candidate()
                  : const Category(),
    );
  }
}
