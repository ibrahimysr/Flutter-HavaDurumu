import 'package:flutter/material.dart';
import 'package:hava_durumu2/Homepage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Hava Durumu",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.blue])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.sunny,
                      size: 75,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.cloudy_snowing,
                      size: 75,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: 50,
                  width: 175,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.black),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      },
                      child: Text(
                        "Ana Ekrana Geç",
                        style: TextStyle(fontSize: 18),
                      ))),
              Text("")
            ],
          ),
        ),
      ),
    );
  }
}
