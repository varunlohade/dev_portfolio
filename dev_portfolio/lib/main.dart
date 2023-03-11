import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  late AnimationController _animationcontroller;
  late Animation _animation;
  late Animation padding;
  VideoPlayerController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset('assets/background.mp4')
      ..initialize().then((_) {
        _controller!.play();
        _controller!.setLooping(true);
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });
    _animationcontroller = AnimationController(
      duration: const Duration(milliseconds: 275),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.2).animate(CurvedAnimation(
        parent: _animationcontroller,
        curve: Curves.ease,
        reverseCurve: Curves.easeIn));
    padding = Tween(begin: 0.0, end: -25.0).animate(CurvedAnimation(
        parent: _animationcontroller,
        curve: Curves.ease,
        reverseCurve: Curves.easeIn));
    _animationcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: double.infinity,
              child: AppBar(
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10),
                    child: Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10),
                    child: Text(
                      "About",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10),
                    child: Text(
                      "Work",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 10, right: 30),
                    child: Text(
                      "Contact",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: Row(
                  children: [
                    Container(
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffe4bc64)),
                    ),
                    const Text(
                      " Varun",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.60,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                          // image: const DecorationImage(
                          //     image: NetworkImage('assets/93498.jpg'),
                          //     fit: BoxFit.cover),
                          color: Color(0xff4D455D),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Hi, I am Varun Lohade,\na FullStack Mobile Application Developer",
                              style: GoogleFonts.lato(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/github.png',
                                  height: 100,
                                  color: Colors.white,
                                ),
                                Image.asset(
                                  'assets/linkedin.png',
                                  height: 100,
                                  color: Colors.white,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                MouseRegion(
                  onEnter: (value) {
                    setState(() {
                      _animationcontroller.forward();
                    });
                  },
                  onExit: (value) {
                    setState(() {
                      _animationcontroller.reverse();
                    });
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    width: MediaQuery.of(context).size.width * 0.42,
                    clipBehavior: Clip.hardEdge,
                    transform: Matrix4(
                        _animation.value,
                        0,
                        0,
                        0,
                        0,
                        _animation.value,
                        0,
                        0,
                        0,
                        0,
                        2,
                        0,
                        padding.value,
                        padding.value,
                        0,
                        1),
                    decoration: BoxDecoration(
                        color: Color(0xffE96479),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.77,
                    width: MediaQuery.of(context).size.width * 0.42,
                    decoration: BoxDecoration(
                        color: Color(0xffF5E9CF),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.77,
                    width: MediaQuery.of(context).size.width * 0.55,
                    decoration: BoxDecoration(
                        color: Color(0xff7DB9B6),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
