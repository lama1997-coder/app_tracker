import 'package:flutter/cupertino.dart';


class Constants {
  static String graphQlUrl = 'https://graph.nasna.tv/';

}

class PaddingConstants {
  static const EdgeInsets   screenPadding = EdgeInsets.all(25.0);
  static const EdgeInsets smallPadding = EdgeInsets.all(5.0);
  static const EdgeInsets mediumPadding = EdgeInsets.all(20.0);

  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 5.0);
  static const EdgeInsets horizontalLargePadding = EdgeInsets.symmetric(horizontal: 32.0);
  static const EdgeInsets cardPadding = EdgeInsets.symmetric(vertical: 5.0,horizontal: 5);
  static const EdgeInsets tagsMargin = EdgeInsets.symmetric(horizontal: 20);

// static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 16.0);
// static const EdgeInsets cardPadding = EdgeInsets.all(12.0);
// static const EdgeInsets listItemPadding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
}


class Utils {

  static String formattedTime(positionDuration) {
    return "${positionDuration.inHours.toString().padLeft(2, '0')}:${(positionDuration.inMinutes % 60).toString().padLeft(2, '0')}:${(positionDuration.inSeconds % 60).toString().padLeft(2, '0')}";

  }
}

class Images {

  static String onBoardingImage = 'lib/assets/onboardingImage.png';
  static String bg = 'lib/assets/bg.png';
  static String emptyIcon = 'lib/assets/emptyIcon.png';


}