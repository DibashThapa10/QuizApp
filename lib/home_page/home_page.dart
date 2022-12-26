import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';
import 'package:quiz_app/score/result_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.blueAccent;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 51, 69),
      body: Padding(
          padding: const EdgeInsets.all(18),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/${questions.length}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 25),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 8,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    questions[index].question,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  for (int i = 0; i < questions[index].answer.length; i++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: MaterialButton(
                        shape: const StadiumBorder(),
                        color: isPressed
                            ? questions[index].answer.entries.toList()[i].value
                                ? isTrue
                                : isWrong
                            : Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                }
                              },
                        child: Text(
                          questions[index].answer.keys.toList()[i],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: isPressed
                            ? index + 1 == questions.length
                                ? () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultScreen(score)));
                                  }
                                : () {
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    setState(() {
                                      isPressed = false;
                                    });
                                  }
                            : null,
                        style: OutlinedButton.styleFrom(
                            shape: const StadiumBorder(),
                            side: const BorderSide(
                                color: Colors.yellow, width: 1)),
                        child: Text(
                          index + 1 == questions.length
                              ? "See result"
                              : "Next Question ",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
