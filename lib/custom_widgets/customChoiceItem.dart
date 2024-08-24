import 'package:flutter/material.dart';
import 'package:talker_flutter/talker_flutter.dart';

// ignore: must_be_immutable
class CustomChoiceItem extends StatefulWidget {
  const CustomChoiceItem(
      {super.key, required this.InnerItem, required this.callback});
  final Widget InnerItem;
  final VoidCallback callback;
  @override
  State<CustomChoiceItem> createState() => _CustomChoiceItemState();
}

class _CustomChoiceItemState extends State<CustomChoiceItem> {
  final talker = TalkerFlutter.init();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        child: Column(
          children: [
            widget.InnerItem,
            Switch(
              value: value,
              onChanged: (value) {
                setState(
                  () {
                    this.value = value;
                  },
                );
                widget.callback();
                //talker.log("action");
              },
            ),
          ],
        ));
  }
}
