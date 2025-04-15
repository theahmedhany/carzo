import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_master_app_bar.dart';
import '../../data/services/gemini_service.dart';
import '../../manager/chat_cubit.dart';
import '../../manager/chat_state.dart';
import '../widgets/help_support_chat_message_input.dart';
import '../widgets/help_support_chat_message_list.dart';

class HelpSupportChatView extends StatelessWidget {
  const HelpSupportChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(GeminiService()),
      child: Scaffold(
        backgroundColor: AppColors.kMainBackgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              const CustomMasterAppBar(title: 'Help Support Chat'),
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    return HelpSupportChatMessageList(messages: state.messages);
                  },
                ),
              ),
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return HelpSupportChatMessageInput(
                    controller: context.read<ChatCubit>().controller,
                    isLoading: state.isLoading,
                    onSend:
                        () =>
                            context.read<ChatCubit>().callGeminiModel(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
