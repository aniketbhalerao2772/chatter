import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  const MessageText({
    super.key,
    required this.userType,
    required this.userName,
    required this.message,
    required this.time,
  });

  final String userName;
  final String message;
  final String time;

  final bool userType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: userType == true
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$userName",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      Text(
                        "$message",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$time",
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}