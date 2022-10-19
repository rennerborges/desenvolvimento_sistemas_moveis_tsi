import 'dart:ui';

class ColorsInvoiceUp {
  late Color blue900;
  late Color blueMain;
  late Color blue300;

  late Color grayText;
  late Color grayTextBold;

  late Color gray100;
  late Color grayHint;

  late Color red100;

  late Color green100;

  late Color white;

  ColorsInvoiceUp(bool darkTheme) {
    blue900 = const Color(0xFF152670);
    blueMain = const Color(0xff1F59DA);
    blue300 = const Color(0xFFE3EBFF);

    grayText = Color(darkTheme ? 0xFFe0e0e0 : 0xFF8B8B8B);
    grayTextBold = Color(darkTheme ? 0xFFFFFFFF : 0xFF263238);

    gray100 = const Color(0xFFF9F9F9);
    grayHint = Color(darkTheme ? 0xFF424242 : 0xFFe0e0e0);

    red100 = const Color(0xFFFFE3E3);

    green100 = const Color(0xFFE3FFE4);

    white = Color(darkTheme ? 0xFF212121 : 0xFFFFFFFF);
  }
}
