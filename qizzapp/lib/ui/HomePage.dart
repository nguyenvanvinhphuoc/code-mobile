import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qizzapp/ui/Option.dart';
import 'package:qizzapp/ui/completePage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List responseData = [];
  int number = 0;
  late Timer _timer;
  int _secondRemaining = 15;
  List<String> shuffleOption = [];

  Future api() async {
    final response =
        await http.get(Uri.parse('https://opentdb.com/api.php?amount=10'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['results'];
      setState(() {
        responseData = data;
        updateShuffle();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    api();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 421,
              width: 400,
              child: Stack(
                children: [
                  Container(
                    height: 240,
                    width: 390,
                    decoration: BoxDecoration(
                      color: const Color(0xffA42FC1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    bottom: 60,
                    left: 22,
                    child: Container(
                      height: 170,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            blurRadius: 5,
                            spreadRadius: 3,
                            color: Color(0xffA42FC1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '05',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 28),
                                ),
                                Text(
                                  '07',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 28),
                                ),
                              ],
                            ),
                            Center(
                              child: Text(
                                'Question 3/10',
                                style: TextStyle(
                                  color: Color(0xffA42FC1),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(responseData.isNotEmpty
                                ? responseData[number]['question']
                                : ''),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 210,
                    left: 140,
                    child: CircleAvatar(
                      radius: 42,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text(
                          _secondRemaining.toString(),
                          style: TextStyle(
                            color: Color(0xffA42FC1),
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: shuffleOption.map((option) {
                return Option(options: option);
              }).toList(),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffA42FC1),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  if (number < responseData.length - 1) {
                    nextQuestion();
                  } else {
                    completed();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void nextQuestion() {
    setState(() {
      number++;
      updateShuffle();
      _secondRemaining = 15;
    });
  }

  void completed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Completed()));
  }

  void updateShuffle() {
    setState(() {
      List<dynamic> incorrectAnswers =
          responseData[number]['incorrect_answers'];
      List<String> incorrectAnswersList =
          incorrectAnswers.map((item) => item.toString()).toList();
      shuffleOption = shuffleOptionFunc([
        responseData[number]['correct_answer'].toString(),
        ...incorrectAnswersList,
      ]);
    });
  }

  List<String> shuffleOptionFunc(List<String> options) {
    List<String> shuffledOptions = List.from(options);
    shuffledOptions.shuffle();
    return shuffledOptions;
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondRemaining > 0) {
          _secondRemaining--;
        } else {
          nextQuestion();
          _secondRemaining = 15;
        }
      });
    });
  }
}
