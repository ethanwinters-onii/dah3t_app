import 'dart:math';

import 'package:discovery_app/openai_models/chat_model.dart';
import 'package:discovery_app/providers/openai_model_provider.dart';
import 'package:discovery_app/service/api_service.dart';
import 'package:discovery_app/service/logger_service.dart';
import 'package:discovery_app/service/service.dart';
import 'package:discovery_app/utils/components/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../misc/constant.dart';

class ChatAIPage extends StatefulWidget {
  const ChatAIPage({super.key});

  @override
  State<ChatAIPage> createState() => _ChatAIPageState();
}

class _ChatAIPageState extends State<ChatAIPage> {
  bool _isTyping = false;

  late TextEditingController controller;
  late FocusNode focusNode;
  late ScrollController scrollController;

  List<ChatModel> chatList = [];

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF343541),
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(AppImages.openaiLogo)),
        ),
        backgroundColor: Color(0xFF444654),
        title: const Text(
          'ChatGPT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await Services.showModalSheet(context: context);
              },
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: chatList.length,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatList[index].msg,
                        chatIndex: chatList[index].chatIndex,
                      );
                    })),
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
            ],
            SizedBox(
              height: 15,
            ),
            Material(
              color: Color(0xFF444654),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Consumer<OpenAIModelProvider>(
                          builder: (context, model, _) {
                        return TextField(
                          controller: controller,
                          focusNode: focusNode,
                          onSubmitted: (value) async {
                            // TODO send message
                            await sendMessageFCT(provider: model);
                          },
                          decoration: InputDecoration(
                              hintText: "How can I help you?",
                              hintStyle: TextStyle(color: Colors.grey),
                              fillColor: Color(0xFF444654),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        );
                      }),
                    ),
                    Consumer<OpenAIModelProvider>(builder: (context, model, _) {
                      return IconButton(
                          onPressed: () async {
                            await sendMessageFCT(provider: model);
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ));
                    })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void scrollListToEnd() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOut);
  }

  Future<void> sendMessageFCT({required OpenAIModelProvider provider}) async {
    String msg = controller.text;
    setState(() {
      _isTyping = true;
      chatList.add(ChatModel(msg: controller.text, chatIndex: 0));
      controller.clear();
      focusNode.unfocus();
    });
    try {
      chatList.addAll(await ApiService.sendMessage(
          message: msg, modelId: provider.getCurrentModel));
      setState(() {});
    } on Exception catch (e) {
      logger.warning(e);
    } finally {
      setState(() {
        scrollListToEnd();

        _isTyping = false;
      });
    }
  }
}
