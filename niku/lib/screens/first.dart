import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:niku/screens/game.dart';
import 'package:random_text_reveal/random_text_reveal.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/tic.json", height: 250),
            const RandomTextReveal(
              text: "Enter Your Name :",
              duration: Duration(seconds: 2),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.bold),
              curve: Curves.easeIn,
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: player1Controller,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: "Player Name 1 :",
                  hintStyle: TextStyle(color: Colors.cyan),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter player 1 name";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: player2Controller,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: "Player Name 2 :",
                  hintStyle: TextStyle(color: Colors.cyan),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter player 2 name";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                          player1: player1Controller.text,
                          player2: player2Controller.text),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(15)),
                child: const Text(
                  "Start Game",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.purple.shade100,
    );
  }
}
