import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class CtrlFonts{
  static var kSub2HeadTextStyle = GoogleFonts.dmSans(
    textStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
  );

  static var SmileySansTextStyle = const TextStyle(
    fontFamily: "SmileySans",
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.2,
  );
}
class TempHumidBanner extends StatelessWidget {
  final double? horizontalPadding;
  final String? img;
  final String? title;
  final Widget? child;

  TempHumidBanner({
    required this.img,
    required this.title,
    required this.horizontalPadding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      width: Get.width * 0.38,
      padding:
      EdgeInsets.symmetric(horizontal: horizontalPadding!, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(
              img!,
            ),
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(flex: 4),
              child!,
              const Spacer(flex: 2),
              Text(
                title!,
                style: CtrlFonts.kSub2HeadTextStyle.copyWith(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: 12,
                ),
              ),
              const Spacer(flex: 4),
            ],
          ),
        ],
      ),
    );
  }
}

class SmartSystem extends StatelessWidget {
  final Color color;
  final String title;
  final String imageUrl;
  final Widget? child;
  final VoidCallback onTap;

  SmartSystem({
    Key? key,
    required this.color,
    required this.title,
    this.child,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Get.width * 0.414,
        width: Get.width * 0.4,
        margin: const EdgeInsets.only(bottom: 10),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Get.width * 0.06,
                width: Get.width * 0.34,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: color.withOpacity(0.45)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: Get.width * 0.4,
                width: Get.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: color,
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 15,
                      left: Get.width * 0.032,
                      child: Image(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.fill,
                        height: Get.width * 0.16,
                      ),
                    ),

                    Positioned(
                      top: 20,
                      right: 15,
                      child: child ?? Container(),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 18,
                      child: Text(
                        title,
                        style: CtrlFonts.SmileySansTextStyle.copyWith(
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
