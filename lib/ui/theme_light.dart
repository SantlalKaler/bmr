import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Sell -> #FFD54F
// Rent -> #FF546E7A

Color get primaryColor => const Color(0xFF2CACE0);

Color get primaryColorDark => const Color(0xFF64548B);

Color get primaryColorLight => Colors.red.shade200;

Color get scaffoldBackgroundColor => Colors.white;

Color get greenColor => const Color(0xFF25D366);

Color get disabledColor => Colors.grey.shade400;
Color get blueGrey => Colors.blueGrey.withValues(alpha: 0.1);
Color get shimmerEffectColor => Colors.blueGrey.withValues(alpha: 0.2);

class LightTheme {
  static getMyLightTheme() {
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      // primarySwatch: Colors.red,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: primaryColorLight,
      primaryIconTheme: IconThemeData(color: primaryColor),
      iconTheme: const IconThemeData(color: Colors.black87),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: greenColor,
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black54, fontSize: 14),
          iconTheme: IconThemeData(
            color: Colors.black,
          )),
      cardTheme: CardThemeData(
          color: Colors.grey.shade50,
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: false,
            fillColor: Colors.transparent,
            labelStyle:
                GoogleFonts.roboto(color: Colors.grey.shade600, fontSize: 13),
            hintStyle: GoogleFonts.lato(fontSize: 13),
            contentPadding: const EdgeInsets.all(15),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(15)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(15)),
          ),
          menuStyle: const MenuStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white))),
      chipTheme: ChipThemeData(
          selectedColor: primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          backgroundColor: Colors.blueGrey.shade100,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      /*textTheme: TextTheme(
          labelMedium: GoogleFonts.oswald(
              fontSize: 14, color: const Color(0xFF725B2E), letterSpacing: 1),
          labelSmall: GoogleFonts.oswald(
              fontSize: 14, color: Colors.black87, letterSpacing: 1),
          bodyLarge:
              GoogleFonts.roboto(color: Colors.black54, fontSize: 15),
          bodyMedium:
              GoogleFonts.roboto(color: Colors.blueGrey.shade600, fontSize: 14),
          bodySmall: GoogleFonts.poppins(
              color: Colors.blueGrey.shade500, fontSize: 11),
            titleLarge: GoogleFonts.lato(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
          titleSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black87),
          titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black87, height: 1.0)),*/
      textTheme: TextTheme(
          labelMedium: GoogleFonts.oswald(
              fontSize: 14, color: const Color(0xFF725B2E), letterSpacing: 1),
          labelSmall: GoogleFonts.oswald(
              fontSize: 14, color: Colors.black87, letterSpacing: 1),
          bodyLarge:
              GoogleFonts.roboto(color: Colors.blueGrey.shade600, fontSize: 15),
          bodyMedium:
              GoogleFonts.roboto(color: Colors.blueGrey.shade600, fontSize: 14),
          bodySmall: GoogleFonts.poppins(
              color: Colors.blueGrey.shade500, fontSize: 11),
          titleLarge: GoogleFonts.lato(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
          titleSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black87),
          titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.black87, height: 1.0)),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          /*elevation: 3,
          foregroundColor: Colors.white,
          disabledBackgroundColor: disabledColor,*/
          //backgroundColor: Colors.transparent,
          minimumSize: Size(GetPlatform.isMobile ? double.infinity : 300,
              GetPlatform.isMobile ? 40 : 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          side: const BorderSide(color: Colors.grey),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return 0;
                }
                return 3;
              }),
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.disabled)) {
                  return disabledColor;
                }
                return primaryColor;
              }),
              shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
              minimumSize: WidgetStatePropertyAll(Size(
                  GetPlatform.isMobile ? double.infinity : 300,
                  GetPlatform.isMobile ? 40 : 50)))),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: primaryColorDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        labelStyle:
            GoogleFonts.roboto(color: Colors.grey.shade600, fontSize: 13),
        hintStyle: GoogleFonts.lato(fontSize: 13),
        contentPadding: const EdgeInsets.all(15),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15)),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(15)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(15)),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(WidgetState.selected)) {
            return primaryColorDark;
          }
          return Colors.grey.shade100;
        }),
      ),
      drawerTheme: DrawerThemeData(backgroundColor: Colors.blueGrey.shade50),
      dialogTheme: DialogThemeData(
          contentTextStyle:
              GoogleFonts.poppins(color: Colors.grey.shade700, fontSize: 13),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      listTileTheme: ListTileThemeData(
        titleTextStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w600, fontSize: 14.5, color: Colors.black87),
        iconColor: Colors.black87,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
    );
  }
}
