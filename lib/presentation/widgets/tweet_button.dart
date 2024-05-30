import 'package:flutter/material.dart';




class TweetButton extends StatelessWidget {
  final Function() onTap;
  const TweetButton({
    super.key, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15)),
          child: const Text(
          'Whizz Away',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}