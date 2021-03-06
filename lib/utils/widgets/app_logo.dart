import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sos_mobile_app/theme/colors.dart';

class AppLogo extends StatelessWidget {
  final String mainTitle;
  final String subTitle;
  final String logo;

  const AppLogo(
      {Key? key,
      required this.mainTitle,
      required this.subTitle,
      required this.logo})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          logo,
          width: 100,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    mainTitle,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    subTitle,
                    style: const TextStyle(
                        color: AppColors.primaryColor, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
