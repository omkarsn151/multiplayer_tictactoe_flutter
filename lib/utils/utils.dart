import 'package:flutter/material.dart';
import '../resources/game_methods.dart';
import '../widgets/custom_text.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blue)
        ),
        contentPadding: const EdgeInsets.all(20),
        title: Align(
          alignment: Alignment.center,
          child: CustomText(
            text: text,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wine_bar_outlined,
              color: Colors.blue,
              size: 100,
            ),
            SizedBox(height: 20),
            CustomText(
              text: 'Congratulations!',
              fontSize: 20,
              color: Colors.blue,
            ),
          ],
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                GameMethods().clearBoard(context);
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
              ),
              child: const CustomText(
                text: 'Play Again',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      );
    },
  );
}
