import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: const Text(
          "Conversations",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey, width: 3),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade300),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
