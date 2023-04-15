import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:discovery_app/misc/constant.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex});

  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? Color(0xFF343541) : Color(0xFF444654),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Center(
                        child: Image.asset(
                      chatIndex == 0 ? AppImages.userImage : AppImages.botImage,
                      height: 30,
                      width: 30,
                    ))),
                Expanded(
                  child: chatIndex == 0 
                  ? Text(
                    msg,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                  : DefaultTextStyle(
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                    child: AnimatedTextKit(
                        isRepeatingAnimation: false,
                        repeatForever: false,
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        animatedTexts: [TypewriterAnimatedText(msg.trim())],
                    ),
                  ),
                ),
                if (chatIndex == 1)
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.thumb_up_alt_outlined, color: Colors.white),
                        SizedBox(width: 6,),
                        Icon(Icons.thumb_down_alt_outlined, color: Colors.white,)
                      ],
                    ),
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}
