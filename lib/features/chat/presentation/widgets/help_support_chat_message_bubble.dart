import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_fonts.dart';
import '../../data/models/chat_message_model.dart';

class HelpSupportChatMessageBubble extends StatelessWidget {
  final ChatMessageModel message;

  const HelpSupportChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Align(
        alignment:
            message.isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: message.isUser ? Colors.white : const Color(0xffB9E5E8),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  message.isUser ? const Radius.circular(12) : Radius.zero,
              bottomRight:
                  message.isUser ? Radius.zero : const Radius.circular(12),
            ),
          ),
          child:
              message.isUser
                  ? SelectableText(
                    message.text,
                    style: AppFonts.font12DarkRegular,
                  )
                  : AnimatedTextKit(
                    repeatForever: false,
                    displayFullTextOnTap: true,
                    totalRepeatCount: 1,
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        message.text,
                        textStyle: AppFonts.font12DarkRegular,
                        speed: const Duration(milliseconds: 20),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
