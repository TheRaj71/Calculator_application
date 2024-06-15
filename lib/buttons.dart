import 'package:flutter/material.dart';
//This imports the Material package from Flutter, which provides various widgets and functionalities to build an app with a Material Design.


// creating Stateless Widget for buttons
class MyButton extends StatelessWidget {

// declaring variables 
final color;//colour of button
final textColor;//buttons text color
final String buttonText;//storeing text of button whihc must be string
final buttontapped;//logic when button will be pressed

//Constructor
MyButton({this.color, this.textColor, required this.buttonText, this.buttontapped});
//This is the constructor for the MyButton class. It initializes the properties of the widget. The buttonText parameter is required, while the others are optional.
// required this em on main property
@override
Widget build(BuildContext context) {
	return GestureDetector(
    //detect various gestures, including taps. It is used to make the button responsive to tap events.
	onTap: buttontapped,
  //when the button is tapped, the buttontapped function will be called. above declared bitch
	child: Padding(
		padding: const EdgeInsets.all(0.2),
		child: ClipRRect(
		// borderRadius: BorderRadius.circular(25),
		child: Container(
			color: color,
			child: Center(
			child: Text(
				buttonText,
				style: TextStyle(
				color: textColor,
				fontSize: 25,
				fontWeight: FontWeight.bold,
				),
			),
			),
		),
		),
	),
	);
}
}
