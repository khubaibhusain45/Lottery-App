import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int lotteryNumber = Random().nextInt(9) + 1;
  String message = "Press the Button to try your luck";
  IconData? resultIcon;
  Color iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lottery App', style: TextStyle(color: Colors.black)),
        elevation: 19,
        shadowColor: Colors.black,
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lottery Number is $lotteryNumber",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blueGrey,
              ),
              height: 200,
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (resultIcon != null)
                      Icon(resultIcon, color: iconColor, size: 40),
                    Wrap(
                      children: [
                        Text(
                          message,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int number = Random().nextInt(9) + 1;
          setState(() {
            if (number == lotteryNumber) {
              message =
              "Congratulations! Your number matched the lottery number and You won the lottery";
              resultIcon = Icons.check_circle;
              iconColor = Colors.green;
            } else {
              message = "Number you get is $number, Better Luck Next Time";
              resultIcon = Icons.cancel;
              iconColor = Colors.red;
            }
          });
        },
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.black,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
