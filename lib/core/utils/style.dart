import 'dart:ui';

import 'package:flutter/cupertino.dart';

class Style {



 static double normalFontSize(context) => MediaQuery.of(context).size.width * 16 / 375;
 static double smallFontSize(context) => MediaQuery.of(context).size.width * 14 / 375;
 static double bigFontSize(context) => MediaQuery.of(context).size.width * 20 / 375;

}