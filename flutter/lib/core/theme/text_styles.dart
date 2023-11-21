import 'package:flutter/cupertino.dart';

enum FontSize { small, medium, large, extraLarge, huge, gigantic }

class TextStyles {
  static TextStyles? _instace;

  TextStyles._();

  static TextStyles get i {
    _instace ??= TextStyles._();
    return _instace!;
  }

  String get font => 'BwModelica';

  Map<FontSize, double> get textStylesBySize {
    return {
      FontSize.small: 12.0,
      FontSize.medium: 16.0,
      FontSize.large: 24.0,
      FontSize.extraLarge: 32,
      FontSize.huge: 40,
      FontSize.gigantic: 48,
    };
  }

  TextStyle get textLight =>
      TextStyle(fontWeight: FontWeight.w300, fontFamily: font);

  TextStyle get textRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: font);

  TextStyle get textMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: font);

  TextStyle get textSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: font);

  TextStyle get textBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: font);

  TextStyle get textExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: font);

  ///////////////////////////////////////////////////////////////////

  TextStyle get textInputStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get textFormFieldStyle =>
      textRegular.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get hintTextStyle =>
      textRegular.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get inputErrorTextStyle =>
      textRegular.copyWith(fontSize: textStylesBySize[FontSize.small]);

  TextStyle get textButtonLabel =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  ///////////////////////////////////////////////////////////////////
  ///
  TextStyle get textsScreen =>
      textRegular.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get subtitleStyle =>
      textSemiBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get buttonTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get footerTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.small]);

  TextStyle get appBarTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get titleScreen =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get errorTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.small]);

  TextStyle get warningTextStyle =>
      textSemiBold.copyWith(fontSize: textStylesBySize[FontSize.small]);

  TextStyle get headerTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.extraLarge]);

  TextStyle get descriptionTextStyle =>
      textRegular.copyWith(fontSize: textStylesBySize[FontSize.large]);

  TextStyle get bottomTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get titleDrawerTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);

  TextStyle get itemMenuDrawerTextStyle =>
      textBold.copyWith(fontSize: textStylesBySize[FontSize.medium]);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
