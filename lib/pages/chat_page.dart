import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/pages/chat_ai_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343541),
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppImages.userImage),
        ),
        backgroundColor: Color(0xFF444654),
        title: const Text(
          'Hey, you!',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ChatAIPage()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppConstants.backgroundColor,
                minimumSize: Size(180, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                elevation: 10),
            child: Text(
              "Let's playing!",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
