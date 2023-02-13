import 'package:expenses_tracker/onboarding/onboardingPageModal.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:expenses_tracker/utility/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMain extends StatefulWidget {
  @override
  _OnboardingMainState createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
        widget: Column(children: const [
      OnboardingPageModal(
          'Gain total control of your money',
          'Become your own money manager and make every cent count',
          'assets/images/Onboarding/onboarding_page_one.svg')
    ])),
    PageModel(
        widget: Column(children: const [
      OnboardingPageModal(
          'Know where your money goes',
          'Track your transaction easily, with categories and financial report ',
          'assets/images/Onboarding/onboarding_page_two.svg'),
    ])),
    PageModel(
        widget: Column(children: const [
      OnboardingPageModal(
          'Planning ahead',
          'Setup your budget for each category so you in control',
          'assets/images/Onboarding/onboarding_page_three.svg'),
    ]))
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: kVoiletColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: kVoiletColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {},
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 0.0,
                color: Colors.white,
              ),
            ),
            child: SizedBox(
              height: deviceHeight(context) * 0.15,
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      deviceWidth(context) * 0.10,
                      deviceHeight(context) * 0.05,
                      deviceWidth(context) * 0.10,
                      deviceHeight(context) * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            activeIndicator: const ActiveIndicator(
                                color: kGreyColor, borderWidth: 1),
                            closedIndicator: const ClosedIndicator(
                                color: kVoiletColor, borderWidth: 20),
                            indicatorDesign: IndicatorDesign.polygon(
                              polygonDesign: PolygonDesign(
                                polygon: DesignType.polygon_circle,
                              ),
                            ),
                          )),
                      index == pagesLength - 1
                          ? _signupButton
                          : _skipButton(setIndex: setIndex)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
