import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micons/icons.dart';
import 'package:micons/micons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MICons Explore Icons',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> filteredIconList = [];
  bool showFilledIcons = false;

  @override
  void initState() {
    super.initState();
    iconList.sort();
    filteredIconList = iconList;
  }

  void _filterIcons(String query) {
    final filtered = iconList
        .where((icon) => icon.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredIconList = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent.withOpacity(.1),
      appBar: AppBar(
        title: const Text(
          'MICons Explore Icons',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        actions: [
          Row(
            children: [
              Text(
                showFilledIcons ? 'Filled' : 'Outlined',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 5),
              CupertinoSwitch(
                thumbColor: Colors.indigoAccent,
                trackColor: Colors.white,
                activeColor: Colors.white.withOpacity(.7),
                value: showFilledIcons,
                onChanged: (value) {
                  setState(() {
                    showFilledIcons = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: _filterIcons,
              decoration: InputDecoration(
                hintText: 'Search icons...',
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
              ),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: GridView.extent(
        padding: const EdgeInsets.all(10),
        maxCrossAxisExtent: 150,
        children: List.generate(
          filteredIconList.length,
          (index) {
            final icon = filteredIconList[index];
            return Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MIcons(
                    icon: icon,
                    filled: showFilledIcons,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    icon.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


