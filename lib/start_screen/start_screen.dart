import 'package:flutter/material.dart';
import 'package:quiz_app/home_page/home_page.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 51, 69),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              "Let's Play Quiz,",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const Text(
              "Test your general knowledge",
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const HomePage())));
                },
                color: Colors.teal,
                minWidth: double.infinity,
                shape: const StadiumBorder(),
                child: const Text(
                  "Let's Start Quiz",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
