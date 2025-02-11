import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDataProvider {
static const backgroundLightPrimaryColor = Color(0xFF69AEA9);
static const backgroundDarkPrimaryColor = Color(0xFF3F8782);

//USED DARK

  static const backgroundDarkColor = Color(0xFF000000);
  static const primaryDarkThemeColor = Color.fromARGB(255, 255, 255, 255);
  static const greyDarkThemeColor = Color(0xFF3D3F4D);
  static const greyLightThemeColor = Color(0xFF5D5F72);
  static const transparent = Colors.transparent;

  // static const mainAppDarkColor = Color.fromARGB(255, 39, 153, 144);

  static const primaryDarkCardThemeColor = Color(0xFF1B5C58);
  static const primaryDarkCardEndThemeColor = Color(0xFF9055FF);
  static const textDarkThemeColor = Colors.white;
  static const textWrongColor = Colors.red;
  static const textRightColor = Colors.green;
  static const primaryDarkThemeButtonColor = Colors.white;

  static const primaryDarkThemeSecTextColor = Color.fromARGB(255, 2, 2, 2);
  static const textDarksecThemeColor = Color(0xFF1E1E1E);
  static const red = Color.fromARGB(255, 207, 3, 3);

  static const drawerBackgroundDarkColor = Colors.white;

  static const imageBackgroundLight = "assets/images/blight.png";
  static const imageBackgroundDark = "assets/images/bdark.png";
  static const imageBackgroundLightWeb = "assets/images/blight-web.png";
  static const imageBackgroundDarkWeb = "assets/images/bdark-web.png";

  static const mainAppColor = Color(0xFF69AEA9);
  static const textLightThemeColor = Color.fromARGB(255, 239, 239, 239);
  static const textLightGreyThemeColor = Color(0xFF68656E);

  static const backgroundLightColor = Color(0xFFEFEFEF);
  static const primaryLightThemeColor = Color.fromARGB(148, 217, 217, 217);

  static const borderColor = Color(0xFFDADADA);
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      textTheme: TextTheme(
        //text white
          displaySmall: GoogleFonts.poppins(
            color: ThemeDataProvider.textDarksecThemeColor,
            fontSize: 10,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          displayLarge: GoogleFonts.poppins(
            color: ThemeDataProvider.textLightThemeColor,
            fontSize: 25,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: GoogleFonts.poppins(
            color: ThemeDataProvider.textLightThemeColor,
            fontSize: 13,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
          ),
        headlineLarge:  GoogleFonts.poppins(
        color: ThemeDataProvider.mainAppColor,
        fontSize: 25,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
        headlineSmall: GoogleFonts.poppins(
          color: ThemeDataProvider.greyDarkThemeColor,
          fontSize: 12,
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
        ),
      ),
      drawerTheme: DrawerThemeData(

        backgroundColor: drawerBackgroundDarkColor,
        scrimColor: textLightThemeColor,
        elevation: 10,


      ),
      listTileTheme: ListTileThemeData(
        iconColor: Colors.white, // Set icon color to white
        textColor: Colors.white, // Set text color to white
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ThemeDataProvider.mainAppColor,

      ),
      switchTheme: SwitchThemeData(
          splashRadius: 100,
          thumbColor: MaterialStateProperty.all(primaryDarkThemeColor),
          trackColor: MaterialStateProperty.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? backgroundDarkColor
                  : null)),
      cardColor: primaryDarkThemeColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: primaryDarkThemeColor,
          unselectedItemColor: textDarksecThemeColor,
          backgroundColor: primaryDarkThemeSecTextColor),
      scaffoldBackgroundColor: backgroundLightColor,
      appBarTheme: const AppBarTheme(

          backgroundColor:mainAppColor,
          titleTextStyle: TextStyle(
            color: textDarkThemeColor,
            fontWeight: FontWeight.w400,
          ),
          iconTheme: IconThemeData(color: primaryDarkThemeColor)),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white, modalBackgroundColor: Colors.white),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          // textStyle: WidgetStateProperty.all(TextStyle(fontSize: 200)),
          backgroundColor: WidgetStateProperty.all(mainAppColor),
          minimumSize: WidgetStateProperty.all(
              Size(MediaQuery.sizeOf(context).width, 50)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: primaryLightThemeColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
  //static final lightTheme = ;

  static final darkTheme = ThemeData(
    fontFamily: 'din',
    //used
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(

        textStyle:
        WidgetStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
        foregroundColor: WidgetStateProperty.all(primaryDarkThemeButtonColor),
        backgroundColor: WidgetStateProperty.all(primaryDarkThemeButtonColor),
        minimumSize: WidgetStateProperty.all(const Size(150, 40)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(
              color: primaryDarkThemeButtonColor,
            ),
          ),
        ),
      ),
    ),

    navigationRailTheme: NavigationRailThemeData(


        indicatorColor: greyDarkThemeColor,
        indicatorShape: CircleBorder(),
        selectedLabelTextStyle: TextStyle(color: greyDarkThemeColor),
        // selectedLabelTextStyle: TextStyle(color: primaryDarkThemeColor),
        backgroundColor: backgroundDarkColor,
        selectedIconTheme: IconThemeData(color: primaryDarkThemeColor),
        unselectedIconTheme: IconThemeData(
          color: greyDarkThemeColor,
        )),
    scaffoldBackgroundColor: backgroundDarkColor,
    inputDecorationTheme:InputDecorationTheme(
      filled: true, // Enables the background color
      fillColor: Colors.transparent, // Background color of the TextField
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(
          color: Colors.blue, // Default border color
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ThemeDataProvider.greyLightThemeColor,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ThemeDataProvider.textWrongColor,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ThemeDataProvider.textWrongColor,
          width: 1,
        ),
      ),
      hintStyle: TextStyle(
        color: greyLightThemeColor, // Hint text color
      ),
      labelStyle: TextStyle(
        color: Colors.white, // Label text color
      ),

    ),

////////////////////////////////////////////////////////////////

    textTheme: TextTheme(

      //small grey text
      // headlineSmall: GoogleFonts.poppins(
      //   color: ThemeDataProvider.textLightGreyThemeColor,
      //   fontSize: 14,
      //   decoration: TextDecoration.none,
      //   fontWeight: FontWeight.bold,
      // ),

      //menu item
      labelSmall: GoogleFonts.poppins(
        // color: ThemeDataProvider.textDarksecThemeColor,
        fontSize: 2,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,

      ),
      titleSmall: GoogleFonts.poppins(
        color: ThemeDataProvider.primaryDarkThemeColor,
        fontSize: 10,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w300,

      ),
      //defualt sizt
      displayMedium: GoogleFonts.poppins(
        color: ThemeDataProvider.textDarkThemeColor,
        fontSize: 20,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w500,
      ),
      displaySmall: GoogleFonts.poppins(
        color: ThemeDataProvider.primaryDarkThemeColor,
        fontSize: 14,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
      displayLarge: GoogleFonts.poppins(
        color: ThemeDataProvider.textDarkThemeColor,
        fontSize: 25,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: textDarkThemeColor,
      scrimColor: textLightThemeColor.withOpacity(0.5),
      elevation: 10,
    ),

    switchTheme: SwitchThemeData(
        splashRadius: 100,
        thumbColor: MaterialStateProperty.all(primaryDarkThemeColor),
        trackColor: MaterialStateProperty.resolveWith((states) =>
        states.contains(MaterialState.selected)
            ? backgroundDarkColor
            : null)),
    //cardColor: primaryDarkThemeColor,
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //     selectedItemColor: primaryDarkThemeColor,
    //     unselectedItemColor: textDarksecThemeColor,
    //     backgroundColor: primaryDarkThemeSecTextColor),
    // bottomSheetTheme: const BottomSheetThemeData(
    //   backgroundColor: primaryDarkThemeColor,
    //   modalBackgroundColor: primaryDarkThemeColor,
    // ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: textDarkThemeColor,
      ),
    ),
    // bottomAppBarTheme: const BottomAppBarTheme(
    //   color: primaryDarkThemeColor,
    // ),

  );
}
