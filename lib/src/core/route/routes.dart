import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/core/route/route_utils.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/auth/view/sign_in_page.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/auth/view/splash_screen.dart';
import 'package:nishtha_saraswat_answersai_flutter/src/feature/chat/view/chat_page.dart';

import '../../feature/auth/view/landing_page.dart';
import '../../feature/auth/view/main_screen.dart';

final kNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter get router => _goRouter;

  CustomTransitionPage animatePage(childWidget) {
    return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 500),
      child: childWidget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurveTween(curve: Curves.linear).animate(animation),
        child: child,
      ),
    );
  }

  late final GoRouter _goRouter = GoRouter(
      navigatorKey: kNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: RouteEnum.splash.toPath,
      // redirect: (ctx, state) {
      //   final authState = ctx.read<AuthBloc>().state;
      //   if (authState.isAuthenticated) {
      //     return RouteEnum.homePage.toPath;
      //   } else if (state.fullPath == RouteEnum.landingPage.toPath ||
      //       state.fullPath == RouteEnum.loginPage.toPath ||
      //       state.fullPath == RouteEnum.signUpPage.toPath ||
      //       state.fullPath == RouteEnum.forgotPasswordPage.toPath ||
      //       state.fullPath == RouteEnum.splash.toPath) {
      //     print('hell0');
      //     return null;
      //   } else {
      //     return RouteEnum.landingPage.toPath;
      //   }
      // },
      routes: [
        GoRoute(
          path: RouteEnum.splash.toPath,
          name: RouteEnum.splash.toName,
          pageBuilder: (context, state) => animatePage(const SplashScreen()),
        ),

        GoRoute(
          name: RouteEnum.loginPage.toName,
          path: RouteEnum.loginPage.toPath,
          builder: ((context, state) => const ChatPage()),
        ),
        // GoRoute(
        //   name: RouteEnum.signUpPage.toName,
        //   path: RouteEnum.signUpPage.toPath,
        //   builder: ((context, state) => const SignUpPage()),
        // ),
        // GoRoute(
        //   name: RouteEnum.forgotPasswordPage.toName,
        //   path: RouteEnum.forgotPasswordPage.toPath,
        //   builder: ((context, state) => const ForgotPasswordPage()),
        // ),
        GoRoute(
          name: RouteEnum.landingPage.toName,
          path: RouteEnum.landingPage.toPath,
          builder: ((context, state) {
            return const LandingPage();
          }),
        ),
        // GoRoute(
        //   name: RouteEnum.homePage.toName,
        //   path: RouteEnum.homePage.toPath,
        //   builder: ((context, state) => const HomePage()),
        // )
      ]);
}
