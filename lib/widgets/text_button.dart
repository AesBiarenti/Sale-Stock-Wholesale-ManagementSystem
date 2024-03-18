import 'package:flutter/material.dart';

Widget textButton({required Color color,required String text,required void Function()? onPressed}) {
  return Expanded(
    child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: BorderSide(color: color, width: 8),
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(child: Text(text))),
  );
}
