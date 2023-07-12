import 'package:flutter/material.dart';
import 'package:isseymiyake/providers.dart';
import 'slideprogressions.dart';

int index = 1;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Issey Miyake',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _controller;
  int action = 0;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(onPressed: () {}, child: Icon(Icons.menu)),
        title: Center(child: Text("isseymikaye.com")),
        actions: [
          TextButton(onPressed: () {}, child: Icon(Icons.person_2_outlined)),
          TextButton(onPressed: () {}, child: Icon(Icons.shop_outlined)),
          Text("${indexProvider.value}")
        ],
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          // Swiping in down direction.
          if (details.delta.dy < 0) {
            action = 1;
            print(details.delta.dy);
          }
          // Swiping in up direction.
          if (details.delta.dy > 0) {
            action = -1;
            print(details.delta.dy);
          }
        },
        onPanEnd: (details) {
          setState(
            () {
              if (indexProvider.value < 5 && indexProvider.value > 1) {
                indexProvider.value = indexProvider.value + action;
              } else if (indexProvider.value == 5 && action == -1) {
                indexProvider.value = indexProvider.value + action;
              } else if (indexProvider.value == 1 && action == 1) {
                indexProvider.value = indexProvider.value + action;
              }
            },
          );
        },
        child: SlideProgression(),
      ),
    );
  }
}
