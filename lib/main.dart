import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  String textDefault = "Pode Entrar!!";

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  void decrement() {
    setState(() {
      count--;
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
    });
    print(count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/restaurant.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Lotado' : 'Pode Entrar!',
                style: TextStyle(
                  fontSize: 50,
                  color: isFull ? Colors.red : Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  "$count",
                  style: TextStyle(
                      fontSize: 100,
                      color: isFull ? Colors.red : Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isEmpty
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: isEmpty ? null : decrement,
                      child: const Text(
                        'SAIU',
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: isFull
                              ? Colors.white.withOpacity(0.2)
                              : Colors.white,
                          fixedSize: const Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: isFull ? null : increment,
                      child: const Text(
                        'ENTROU',
                        style: TextStyle(color: Colors.black, fontSize: 40),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
