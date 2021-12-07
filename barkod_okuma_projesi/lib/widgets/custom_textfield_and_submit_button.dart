import 'package:flutter/material.dart';

class CustomTextfieldAndSubmitButton extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final String textFieldTitle;
  final double leftMargin;

  const CustomTextfieldAndSubmitButton({
    Key? key,
    required this.textController,
    required this.labelText,
    required this.textFieldTitle,
    required this.leftMargin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //TEXTFIELD TITLE
        Text(
          textFieldTitle,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontFamily: "Open Sans",
          ),
        ),
        // TEXTFIELD CONTAINER
        Container(
          margin: EdgeInsets.fromLTRB(leftMargin, 0, leftMargin, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              //  border: Border.all(color: Colors.red),
              ),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              icon: const Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        //SUBMIT BUTTON
        OutlinedButton(
          onPressed: () {},
          child: Text("ARA"),
        )
      ],
    );
  }
}
