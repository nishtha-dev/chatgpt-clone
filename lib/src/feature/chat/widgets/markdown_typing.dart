import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/controller/bloc/chat_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/widgets/custom_markdwon.dart';

class MarkdownTypingText extends StatefulWidget {
  final String text;
  final String id;
  final Duration duration;
  final Function scrollToEnd;

  const MarkdownTypingText({
    Key? key,
    required this.text,
    required this.id,
    this.duration = const Duration(milliseconds: 10),
    required this.scrollToEnd,
  }) : super(key: key);

  @override
  MarkdownTypingTextState createState() => MarkdownTypingTextState();
}

class MarkdownTypingTextState extends State<MarkdownTypingText> {
  String _displayedText = '';
  int _currentIndex = 0;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(widget.duration, _updateText);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateText(Timer timer) {
    setState(() {
      if (_currentIndex <= widget.text.length) {
        // ! TODO: Implement Indicator here
        _displayedText = widget.text.substring(0, _currentIndex);
        _currentIndex++;
      } else {
        // Scrolling to end after typing
        widget.scrollToEnd();
        context.read<ChatBloc>().add(UpdateTypeStatus(chatId: widget.id));
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomMarkdown(
      text: _displayedText,
    );
  }
}
