extension StringExtension on String {
  String removeWhiteSpace() => replaceAll(RegExp(r'[ \t]+'), '');
}
