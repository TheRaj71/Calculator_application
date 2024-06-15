import 'package:flutter/material.dart';
import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
runApp(Calculate());
}
// Entry point of the app, runs the MyApp widget (basic)

class Calculate extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	debugShowCheckedModeBanner: false,
	home: HomePage(),
	); // MaterialApp
}
}

class HomePage extends StatefulWidget {
@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
var userInput = '';// first var input will be dynamix
var answer = '';

// Array of button
final List<String> buttons = [
	'C',
	'+/-',
	'%',
	'DEL',
	'7',
	'8',
	'9',
	'/',
	'4',
	'5',
	'6',
	'x',
	'1',
	'2',
	'3',
	'-',
	'0',
	'.',
	'=',
	'+',
];

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: new AppBar(
		title: new Text("Calculator - By Raj"),
	), //AppBar
	backgroundColor: Colors.white38,
	body: Column(
		children: <Widget>[
		Expanded(
			child: Container(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				children: <Widget>[
					Container(
					padding: EdgeInsets.all(20),
					alignment: Alignment.centerRight,
					child: Text(
						userInput,
						style: TextStyle(fontSize: 18, color: Colors.white),
					),
					),
					Container(
					padding: EdgeInsets.all(15),
					alignment: Alignment.centerRight,
					child: Text(
						answer,
						style: TextStyle(
							fontSize: 30,
							color: Colors.white,
							fontWeight: FontWeight.bold),
					),
					)
				]),
			),
		),
		Expanded(
			flex: 3,
			child: Container(
			child: GridView.builder(
				itemCount: buttons.length,
				gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 4),
				itemBuilder: (BuildContext context, int index) {
					// Clear Button
					if (index == 0) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput = '';
							answer = '0';
						});
						},
						buttonText: buttons[index],
						color: Colors.pink[50],
						textColor: Colors.pink,
					);
					}

					// +/- button
					else if (index == 1) {
					return MyButton(
						buttonText: buttons[index],
						color: Colors.blueGrey[50],
						textColor: Colors.black,
					);
					}
					// % Button
					else if (index == 2) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: Colors.blueGrey[50],
						textColor: Colors.black,
					);
					}
					// Delete Button
					else if (index == 3) {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput =
								userInput.substring(0, userInput.length - 1);
						});
						},
						buttonText: buttons[index],
						color: Colors.blue[50],
						textColor: Colors.black,
					);
					}
					// Equal_to Button
					else if (index == 18) {
					return MyButton(
						buttontapped: () {
						setState(() {
							equalPressed();
						});
						},
						buttonText: buttons[index],
						color: Colors.red[700],
						textColor: Colors.white,
					);
					}

					// other buttons
					else {
					return MyButton(
						buttontapped: () {
						setState(() {
							userInput += buttons[index];
						});
						},
						buttonText: buttons[index],
						color: isOperator(buttons[index])
							? Colors.black26
							: Colors.white,
						textColor: isOperator(buttons[index])
							? Colors.white
							: Colors.black,
					);
					}
				}), // GridView.builder
			),
		),
		],
	),
	);
}

bool isOperator(String x) {
	if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
	return true;// return true; // Returns true if the string is an operator.
	}
	return false;
}

// function to calculate the input operation
void equalPressed() {
	String finaluserinput = userInput;
	finaluserinput = userInput.replaceAll('x', '*');
   // Replaces 'x' with '*' for multiplication.

	Parser p = Parser(); // Creates a parser.
Expression exp = p.parse(finaluserinput); // Parses the user input string into an expression object.

ContextModel cm = ContextModel(); // Creates a context model to store the variables and their values.

	double eval = exp.evaluate(EvaluationType.REAL, cm);
// Converts the result of the expression evaluation to a string and stores it in the 'answer' variable.
answer = eval.toString(); // Stores the evaluated expression result as a string in the 'answer' variable.

}
}
final String footerText = "Made by The_Raj";


// Made by The_Raj with the help of groq,utube,online artricles
//designing was tough since i'm not familiar with flutter till since 14 june 2024