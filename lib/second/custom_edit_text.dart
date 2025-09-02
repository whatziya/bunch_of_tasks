import 'package:flutter/material.dart';

class CustomEditText extends StatelessWidget {
  final TextEditingController controller;

  const CustomEditText({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(),
          top: BorderSide(),
          right: BorderSide(),
          bottom: BorderSide(width: 5),
        ),
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          cursorColor: Colors.black,
          cursorHeight: 18,
          decoration: InputDecoration(
            hintText: 'Search here',
            hintStyle: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
          ),
        ),
      ),
    );
  }
}