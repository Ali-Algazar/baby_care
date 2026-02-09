import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🧩 1. Space Extensions (اختصار SizedBox)
extension SpaceExtension on num {
  SizedBox get height => SizedBox(height: toDouble().h);
  SizedBox get width => SizedBox(width: toDouble().w);
}

extension SafeEmit on Cubit {
  void safeEmit(state) {
    if (!isClosed) emit(state);
  }
}

/// 🎯 2. Padding Extensions
extension PaddingExtension on num {
  EdgeInsets get all => EdgeInsets.all(toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
}

/// 🌈 3. Context Extensions (Theme, Size, MediaQuery)
extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
  TextTheme get textTheme => theme.textTheme;
}

/// 💬 4. Snackbar Helper
extension SnackbarExtension on BuildContext {
  void showSnack(String message, {Color? color, int seconds = 2}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? theme.colorScheme.primary,
        duration: Duration(seconds: seconds),
      ),
    );
  }
}

/// 🧾 5. String Extensions
extension StringExtension on String {
  String get capitalize =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
  bool get isEmail => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(this);
  bool get isPhone => RegExp(r'^(01)[0-9]{9}$').hasMatch(this); // أرقام مصر 😎
}

/// 🕐 6. DateTime Formatter
extension DateTimeExtension on DateTime {
  String get formatted =>
      "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
  String get time =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
}

/// 🧮 7. Nullable Safety Helpers
extension NullableExtensions<T> on T? {
  bool get isNull => this == null;
  bool get isNotNull => this != null;
}

/// 🖼️ 8. Image Asset Shortcut
extension ImagePath on String {
  Image get toImage => Image.asset(this);
  AssetImage get toAsset => AssetImage(this);
}

/// 🧱 9. Widget Padding Shortcut
extension WidgetPadding on Widget {
  Padding paddingAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  Padding paddingSym({double h = 0, double v = 0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
    child: this,
  );
}

/// ⚙️ 10. Widget Visibility Shortcut
extension VisibilityExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}
