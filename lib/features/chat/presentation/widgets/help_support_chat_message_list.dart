import 'package:flutter/material.dart';

import '../../data/models/chat_message_model.dart';
import 'help_support_chat_message_bubble.dart';

class HelpSupportChatMessageList extends StatelessWidget {
  final List<ChatMessageModel> messages;
  final ScrollController _scrollController = ScrollController();

  HelpSupportChatMessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });

    return ListView.builder(
      controller: _scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        return HelpSupportChatMessageBubble(message: message);
      },
    );
  }
}
