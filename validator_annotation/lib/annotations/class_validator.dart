import 'package:meta/meta_meta.dart';

/// Values for the automatic function validator name
/// renaming behavior for [ClassValidator].
enum NamingConvention {
  /// Encodes a field named `userEmail` to `validate_user_email`.
  snackCase('snackCase'),

  /// Encodes a field named `user_email` to `validateUserEmail`.
  camelCase('camelCase'),

  /// Encodes a field named `user_email` to `ValidateUserEmail`.
  pascalCase('pascalCase');

  const NamingConvention(
    this.label,
  );
  final String label;

  factory NamingConvention.fromLabel(String label) => switch (label) {
        'snackCase' => NamingConvention.snackCase,
        'pascalCase' => NamingConvention.pascalCase,
        _ => NamingConvention.camelCase,
      };
}

/// An annotation used to specify a class to generate code for.
@Target({
  TargetKind.classType,
})
class ClassValidator {
  /// if `true`, it will stop when first error occured
  /// and only take the first error.
  ///
  /// note : this options only used, when validating an instance
  final bool stopWhenFirstError;

  /// Specifies naming convention for
  /// validator function on each field & instance. Default value is `camelCase`
  ///
  /// Example :
  ///
  /// ```dart
  /// @ClassValidator(
  ///   namingConvention : NamingConvention.camelCase,
  /// )
  /// class Example{
  ///   @IsEmailValidator()
  ///   final String user_email;
  /// }
  /// ```
  ///
  /// It will generate :
  ///
  /// ```dart
  /// class ExampleValidator{
  ///   static String? validateUserEmail(dynamic value){
  ///     final annotations = [
  ///       IsEmailValidator(),
  ///     ];
  ///     return validateField(value, annotations,);
  ///   }
  ///   static ValidationResult validateExample(Example instance){
  ///     final validationDatas = [
  ///       ValidationData(
  ///         instanceMemberSymbol: 'user_email',
  ///         valueToValidate: instance.user_email,
  ///         annotations: [
  ///           IsEmailValidator(),
  ///         ],
  ///        )
  ///     ];
  ///
  ///     return validateInstance(
  ///       validationDatas,
  ///       stopWhenFirstError : true,
  ///     );
  ///   }
  /// }
  /// ```
  final NamingConvention namingConvention;

  const ClassValidator({
    this.stopWhenFirstError = true,
    this.namingConvention = NamingConvention.camelCase,
  });

  Map<String, dynamic> get toJson => {
        'stopWhenFirstError': stopWhenFirstError,
        'namingConvention': namingConvention.label,
      };
}
