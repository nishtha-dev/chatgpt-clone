// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nishtha_saraswat_answersai_flutter/src/core/constants/app_colors.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/widgets/typography.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/widgets/custom_markdwon.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/widgets/markdown_typing.dart';

class ChatCard extends StatelessWidget {
  final bool shouldType;
  final String id;
  final Function scrollToEnd;
  final String text;
  const ChatCard({
    Key? key,
    required this.shouldType,
    required this.id,
    required this.scrollToEnd,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Avatar(),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText.body3(
                "Username".toUpperCase(),
                color: AppColors.grey,
              ),
              SizedBox(
                height: 2.h,
              ),
              switch (shouldType) {
                true => MarkdownTypingText(
                    id: id,
                    text: text,
                    duration: const Duration(milliseconds: 10),
                    scrollToEnd: scrollToEnd,
                  ),
                false => CustomMarkdown(text: text),
              }
            ],
          ),
        ),
      ],
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.h,
      width: 20.w,
      decoration: const BoxDecoration(
        color: AppColors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
