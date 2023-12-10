extension StringExtension on String {
  String removeWhiteSpace() {
    return replaceAll(RegExp(r'[ \t]+'), '');
  }
}
