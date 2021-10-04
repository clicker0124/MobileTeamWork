import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String? result;
  double? height;
  double? weight;

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "BMIT Calculator ",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0.0,
          backgroundColor: Color(0xfffafafa),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Height in Cm : ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: heightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your height in Cm",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Your Weight in Kg : ",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weightController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Your weight in Kg",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    radioButton("Man", Colors.blue, 0),
                    radioButton("Woman", Colors.pink, 1),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      double height = double.parse(heightController.value.text);
                      double weight = double.parse(weightController.value.text);
                      calculateBmi(height, weight);
                    },
                    color: Colors.blue,
                    child: Text("Calculate",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "Your BMI is: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12.0),
        height: 80,
        child: FlatButton(
          color: currentindex == index ? color : Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
