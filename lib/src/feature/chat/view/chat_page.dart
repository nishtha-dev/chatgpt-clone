import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/constants/app_colors.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/controller/bloc/chat_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/models/chat_data_model.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/widgets/chat_card.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/common/custom_text_field.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _userQueryController = TextEditingController();
  int count = 1;
  String userQuery = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToEnd();
    });
  }

  void _scrollToEnd() {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.more_horiz),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      return ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        itemCount: state.chatHistory.length,
                        controller: _scrollController,
                        addAutomaticKeepAlives: false,
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 120,
                        ),
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10.h);
                        },
                        itemBuilder: (context, index) {
                          ChatDataModel currentChat = state.chatHistory[index];
                          return ChatCard(
                            id: currentChat.id,
                            key: Key(currentChat.id),
                            shouldType: currentChat.shouldType,
                            scrollToEnd: _scrollToEnd,
                            text: currentChat.chatText,
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: _userQueryController,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print(
                              "response.text controler ${_userQueryController.text}");
                          context.read<ChatBloc>().add(
                                GetQueryResponse(
                                  userQuery: _userQueryController.text.trim(),
                                ),
                              );
                          _userQueryController.clear();
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.blue,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.arrow_upward,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextModel {
  final String text;
  bool isTyped;
  TextModel({
    required this.text,
    this.isTyped = false,
  });
}
