import 'package:flutter/material.dart';
import 'package:quiz_app/data/question_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 51, 69),
      body: Padding(
          padding: const EdgeInsets.all(18),
          child: PageView.builder(
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
                        color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        onPressed: () {},
                        child: Text(
                          questions[index].answer.keys.toList()[i],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: const ButtonStyle(),
                    child: const Text(
                      "Next Question",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
