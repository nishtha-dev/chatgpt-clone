import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/typography.dart';

class AdditionalAccountInfo extends StatelessWidget {
  final String infoText;
  final String linkText;
  final Function onTapHandler;
  const AdditionalAccountInfo({
    Key? key,
    required this.infoText,
    required this.linkText,
    required this.onTapHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyleV1.body2.copyWith(
          color: AppColors.black,
        ),
        // style: const TextStyleV1.(
        //     color: AppColors.black,
        //     fontWeight: FontWeight.w700,
        //     fontSize: 16,
        //     height: 1.6),
        children: <TextSpan>[
          TextSpan(text: infoText),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTapHandler();
              },
            style: TextStyleV1.body2.copyWith(
              color: AppColors.green4,
              decoration: TextDecoration.none,
            ),

            // const TextStyle(
            //   color: AppColors.green4,
            //   fontWeight: FontWeight.w700,
            //   fontSize: 16,
            //   height: 1.6,
            //   decoration: TextDecoration.none,
            // ),
            text: linkText,
          ),
        ],
      ),
    );
  }
}
