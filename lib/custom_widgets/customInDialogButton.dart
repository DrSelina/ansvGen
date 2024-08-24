import 'package:flutter/material.dart';

//APACHE 2.0

class Customindialogbutton extends StatelessWidget {
  const Customindialogbutton(
      {super.key,
      required this.callback,
      required this.text,
      required this.editCallback});
  final VoidCallback callback;
  final VoidCallback editCallback;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        children: [
          IconButton(onPressed: () => editCallback(), icon: Icon(Icons.edit)),
          Container(
            child: TextButton(
              onPressed: () {
                callback();
                Navigator.pop(context);
              },
              child: Text(text),
            ),
          ),
        ],
      ),
    );
  }
}
