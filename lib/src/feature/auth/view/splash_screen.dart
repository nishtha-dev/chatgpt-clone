import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/constants.dart';
import '../../../core/route/route_utils.dart';
import '../controller/bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        _redirect();
      }
    });
  }

  void _redirect() async {
    final authState = context.read<AuthBloc>().state;
    if (authState.isAuthenticated) {
      context.pushReplacementNamed(RouteEnum.homePage.toName);
    } else {
      context.pushReplacementNamed(RouteEnum.landingPage.toName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Container(
        height: 10.h,
        decoration: const BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
      ),
    ));
  }
}
