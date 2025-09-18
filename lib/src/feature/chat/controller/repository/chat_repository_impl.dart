import 'dart:async';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:nishtha_saraswat_answersai_flutter/env/env.dart';

import 'chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  final GenerativeModel _geminiModel = GenerativeModel(
    model: 'gemini-pro',
    apiKey: Env.geminiKey,
  );
  @override
  Future<String> getQueryResponse({required String userQuery}) async {
    try {
      final chat = _geminiModel.startChat();
      print("response.text user ${userQuery}");
      final response = await chat.sendMessage(Content.text(userQuery));
      print("response.text ${response.text}");
      return response.text ?? "";
    } catch (e) {
      rethrow;
    }
  }
}
