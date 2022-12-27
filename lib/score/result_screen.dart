import 'package:flutter/material.dart';
import 'package:quiz_app/home_page/home_page.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 51, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Congratulations!!!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "your score is :",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "${widget.score}/100",
              style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 80,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const HomePage())));
              },
              elevation: 0,
              color: Colors.orange,
              textColor: Colors.white,
              child: const Text("Play again"),
            )
          ],
        ),
      ),
    );
  }
}
