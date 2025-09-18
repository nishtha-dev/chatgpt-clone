import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class CustomMarkdown extends StatelessWidget {
  final String text;
  const CustomMarkdown({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: text,
      padding: EdgeInsets.zero,
      selectable: true,
      shrinkWrap: true,
      onTapText: () {
        // ! TODO: Handle On tap text here
      },
      onTapLink: (text, href, title) {
        // ! TODO: Handle link here
      },
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
