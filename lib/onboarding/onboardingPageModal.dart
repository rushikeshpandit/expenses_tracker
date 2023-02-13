import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expenses_tracker/utility/helper.dart';

class OnboardingPageModal extends StatelessWidget {
  const OnboardingPageModal(
      this.headerText, this.descriptionText, this.imagePath);
  final String headerText;
  final String descriptionText;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * 0.85,
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 5.0,
              color: Colors.white,
            ),
          ),
          child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        deviceWidth(context) * 0.15,
                        deviceHeight(context) * 0.20,
                        deviceWidth(context) * 0.15,
                        deviceHeight(context) * 0.10),
                    child: SvgPicture.asset(imagePath,
                        height: deviceHeight(context) * 0.3,
                        width: deviceWidth(context) * 0.3,
                        allowDrawingOutsideViewBox: true),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.1),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        headerText,
                        style: const TextStyle(
                          fontSize: 32.0,
                          wordSpacing: 1,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w700,
                          color: Colors.black
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: deviceWidth(context) * 0.15,
                        vertical: deviceHeight(context) * 0.05),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        descriptionText,
                        style: const TextStyle(
                          color: Color(0xff91919f),
                          letterSpacing: 0.7,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
