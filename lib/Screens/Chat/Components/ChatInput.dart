import 'package:flutter/material.dart';

import '../../../Theme/Colors/appcolors.dart';

class ChatInput extends StatelessWidget {
  final controller;
  final void Function()? sendMessage;

  const ChatInput({super.key, this.controller, this.sendMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 85,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: TextField(
                controller: controller,
                cursorColor: AppColors.purple,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  filled: true,
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 15, right: 10),
                    child: Icon(
                      Icons.attach_file_rounded,
                      size: 28,
                    ),
                  ),
                  border: InputBorder.none,
                  fillColor: AppColors.graylight,
                  prefixIconColor: AppColors.purple,
                  hintText: "Type Here",
                  hintStyle: TextStyle(
                    color: AppColors.graymdm.withOpacity(0.7),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: sendMessage,
            child: Container(
              // sendMessage
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(50),
              ),

              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
