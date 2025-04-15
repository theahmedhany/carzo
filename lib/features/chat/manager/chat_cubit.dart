import 'package:carzo/core/helpers/extensions.dart';
import 'package:carzo/core/widgets/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/chat_message_model.dart';
import '../data/services/gemini_service.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final GeminiService geminiService;
  final TextEditingController controller = TextEditingController();

  ChatCubit(this.geminiService) : super(ChatState.initial());

  Future<void> callGeminiModel(BuildContext context) async {
    if (controller.text.isEmpty) return;

    emit(state.copyWith(isLoading: true));

    try {
      final prompt = controller.text.trim();
      final response = await geminiService.generateResponse(prompt);

      final updatedMessages =
          List<ChatMessageModel>.from(state.messages)
            ..add(ChatMessageModel(text: controller.text, isUser: true))
            ..add(ChatMessageModel(text: response, isUser: false));

      emit(state.copyWith(messages: updatedMessages, isLoading: false));
      controller.clear();
    } catch (e) {
      emit(state.copyWith(isLoading: false));

      showDialog(
        context: context,
        builder:
            (context) => CustomAlertDialog(
              dialogColor: Colors.redAccent,
              dialogHeader: 'Request Failed',
              dialogBody: e.toString(),
              dialogIcon: Icons.error,
              press: () => context.pop(),
            ),
      );
    }
  }
}
