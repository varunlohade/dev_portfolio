import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Varun Lohade ",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 26,
                  )),
              Text("Mobile App Developer",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(66, 51, 48, 48))),
              SizedBox(
                height: 20,
              ),
              Text("I am Varun Lohade a Flutter and Django developer",
                  style: TextStyle(
                      fontSize: 18, fontFamily: "Roboto", color: Colors.black))
            ],
          ),
        ),
      )),
    );
  }
}
