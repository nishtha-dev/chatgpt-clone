import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/auth/controller/bloc/auth_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/auth/controller/repository/auth_repository_impl.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/controller/bloc/chat_bloc.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/controller/controller.dart';
import 'package:path_provider/path_provider.dart';

import 'firebase_options.dart';
import 'src/core/route/routes.dart';
import 'src/core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } on Exception {
    runApp(MyApp());
    return;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final goRouter = AppRouter().router;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(360, 801));
        return MultiBlocProvider(
          providers: [
            BlocProvider<AuthBloc>(
              create: (BuildContext context) =>
                  AuthBloc(authRepo: AuthRepositoryImpl()),
            ),
            BlocProvider<ChatBloc>(
              create: (BuildContext context) =>
                  ChatBloc(chatRepo: ChatRepositoryImpl()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'ChatGPT',
            theme: AppTheme().themeData,
            routerConfig: goRouter,
            // builder: ,
          ),
        );
      },
    );
  }
}
