import 'dart:ui';

class AppColors {
  static const primaryColor = Color(0xFF55307C);
  static const secondaryColor = Color(0xFF0062A8);
  static const blackColor = Color(0xFF000000);
  static const black = blackColor;
  static const whiteColor = Color(0xFFFFFFFF);
  static const smokeColor = Color(0xFFA799BB);
  static const cardBackground = Color(0xFFE9E9E9);
  static const navbarBackground = Color(0xFF503279);
  static var scaffoldBackground = Color(0xfffef8fe);
  // green 089C33
  static const greenColor = Color(0xFF119b38);
  static const yellowColor = Color(0xffE8A83C);
  //Brilliant Rose #F85AB8
  static const roseColor = Color(0xFFF85AB8);
  // Minsk 55307C
  static const minskColor = Color(0xFF55307C);
  //Endeavour 0062A8
  static const endeavourColor = Color(0xFF0062A8);
  //f4f4f4 light grey
  static const lightGreyColor = Color(0xFFF4F4F4);
  //// grey c4c4c4
  // imageBackground c4c4c4
  static const imageBackground = Color(0xFFC4C4C4);
  static const redColor = Color(0xFFC85259);

  static const Color greyColor = Color(0x80000000);
  //black.withAlpha(80);

  // grey c4c4c4
  static const greyUnselectedColor = Color(0xFFC4C4C4);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
