// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flowery Rider App';

  @override
  String get login => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailHintText => 'Enter your email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordHintText => 'Enter your password';

  @override
  String get emailIsEmptyErrorMessage => 'Email is required';

  @override
  String get emailValidationErrorMsg => 'This email is not valid';

  @override
  String get passwordRequiredErrorMsg => 'Password is required';

  @override
  String get passwordValidationErrorMsg =>
      'Password must be at least 6 characters and include M#12m';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get forgetPasswordTextButton => 'Forgot password?';

  @override
  String get continueAsGuestButton => 'Continue as guest';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get applicationSub => 'Your application has been\n submitted!';

  @override
  String get applicationSubMsg =>
      'Thank you for providing your application,\n we will review your application and will get back to you soon.';
}
