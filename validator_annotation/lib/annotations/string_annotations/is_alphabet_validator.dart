import '../../utils/utils.dart';
import '../base_validator_annotation.dart';

/// Metadata to validate if [String] instance is alphabet or not
///
/// [trimWhiteSpace] if `true` the whitespace and tab will be replaced
/// by empty string
///
/// [allowMultiline] if `true` it will allow multiline
///
/// [onlyAcceptLowerCase] when this value is `true`
/// only accept 'a-z' character.
/// Otherwise it will accept uppercase too
///
/// if value [Type] is not [String] it will throw an [Exception]
///
/// For now only support 'a-z' & 'A-Z' alphabet
class IsAlphabetValidator extends ValidatorAnnotation {
  final bool allowMultiline;
  final bool onlyAcceptLowerCase;

  /// when this value is true
  ///
  /// all white spaces will be replaced by empty string
  final bool trimWhiteSpace;

  const IsAlphabetValidator({
    super.fieldName,
    super.errorMessage,
    this.allowMultiline = true,
    this.trimWhiteSpace = true,
    this.onlyAcceptLowerCase = false,
  }) : super(
          name: 'IsAlphabetValidator',
        );

  /// validate where [value] is string and contain only alphabet
  @override
  bool isValid(dynamic value) {
    assertNullableString(
      value: value,
      allowNullable: true,
    );
    value as String?;
    return validateIsAlphabet(
      allowMultiline: allowMultiline,
      onlyAcceptLowerCase: onlyAcceptLowerCase,
      value: value,
      trimWhiteSpace: trimWhiteSpace,
    );
  }

  @override
  String get defaultErrorMessage => 'must be alphabet';
}
