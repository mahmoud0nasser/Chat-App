import 'package:chat_app_th/constants/constants.dart';
import 'package:chat_app_th/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubblee extends StatelessWidget {
  ChatBubblee({
    super.key,
    required this.message,
  });

  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      // alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          // color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              20.0,
              // bottomRight,
            ),
            topLeft: Radius.circular(
              20.0,
            ),
            topRight: Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Text(
          message.message,
          // text,
          // 'I\'m a New User',
          // overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.0,
            color: const Color.fromRGBO(255, 255, 255, 1),
            height: 1.2,
          ),
        ),
      ),
    );
  }
}
class ChatBubbleFriend extends StatelessWidget {
  ChatBubbleFriend({
    super.key,
    required this.message,
  });

  Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              20.0,
            ),
            topLeft: Radius.circular(
              20.0,
            ),
            topRight: Radius.circular(
              20.0,
            ),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            height: 1.2,
          ),
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble({
    super.key,
    this.bottomRight = 0.0,
    this.bottomleft = 0.0,
    // required this.text,
    required this.message,
    required this.color,
    required this.alignment,
    required this.text,
  });

  final double bottomRight;
  final double bottomleft;
  // final String text;
  final Color color;
  Message message;
  final Alignment alignment;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      // alignment: Alignment.centerLeft,
      child: Container(
        // height: 40.0,
        /* margin: EdgeInsets.only(
          top: 16.0,
          left: 16.0,
          right: 16.0,
        ), */
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: color,
          // color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              // 20.0,
              bottomRight,
            ),
            topLeft: Radius.circular(
              20.0,
            ),
            topRight: Radius.circular(
              20.0,
            ),
            bottomLeft: Radius.circular(
              bottomleft,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 0.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  height: 1.2,
                ),
              ),
            ),
            Text(
              message.message,
              // text,
              // 'I\'m a New User',
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.0,
                color: const Color.fromRGBO(255, 255, 255, 1),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({
    super.key,
    this.bottomRight = 0.0,
    this.bottomleft = 0.0,
    // required this.text,
    required this.message,
    required this.color,
    required this.alignment,
    required this.text,
  });

  final double bottomRight;
  final double bottomleft;
  // final String text;
  final Color color;
  Message message;
  final Alignment alignment;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      // alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 6.0,
          vertical: 10.0,
        ),
        decoration: BoxDecoration(
          color: color,
          // color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(
              // 20.0,
              bottomRight,
            ),
            topLeft: Radius.circular(
              20.0,
            ),
            topRight: Radius.circular(
              20.0,
            ),
            bottomLeft: Radius.circular(
              bottomleft,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 0.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  height: 1.2,
                ),
              ),
            ),
            Text(
              message.message,
              style: TextStyle(
                fontSize: 18.0,
                color: const Color.fromRGBO(255, 255, 255, 1),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}