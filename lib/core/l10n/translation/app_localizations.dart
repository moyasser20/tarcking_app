import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translation/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Flower E-Commerce App'**
  String get appName;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get emailHintText;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHintText.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHintText;

  /// No description provided for @emailIsEmptyErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get emailIsEmptyErrorMessage;

  /// No description provided for @emailValidationErrorMsg.
  ///
  /// In en, this message translates to:
  /// **'This email is not valid'**
  String get emailValidationErrorMsg;

  /// No description provided for @passwordRequiredErrorMsg.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequiredErrorMsg;

  /// No description provided for @passwordValidationErrorMsg.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters and include M#12m'**
  String get passwordValidationErrorMsg;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgetPasswordTextButton.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgetPasswordTextButton;

  /// No description provided for @continueAsGuestButton.
  ///
  /// In en, this message translates to:
  /// **'Continue as guest'**
  String get continueAsGuestButton;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAnAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @invalidPasswordMsg.
  ///
  /// In en, this message translates to:
  /// **'Invalid password'**
  String get invalidPasswordMsg;

  /// No description provided for @passwordErrorMatchingMsg.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match!'**
  String get passwordErrorMatchingMsg;

  /// No description provided for @updateText.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateText;

  /// No description provided for @logoutAlertMsg.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logoutAlertMsg;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @logoutConfirmTextCenter.
  ///
  /// In en, this message translates to:
  /// **'Confirm logout!'**
  String get logoutConfirmTextCenter;

  /// No description provided for @resetPasswordUnderMsg.
  ///
  /// In en, this message translates to:
  /// **'Password must not be empty and must contain at least 6 characters with one uppercase letter and one number'**
  String get resetPasswordUnderMsg;

  /// No description provided for @emailVerificationScreen.
  ///
  /// In en, this message translates to:
  /// **'Email Verification'**
  String get emailVerificationScreen;

  /// No description provided for @emailVerificationScreenUnderMsg.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code that was sent to your\nemail address'**
  String get emailVerificationScreenUnderMsg;

  /// No description provided for @codeReceiveMsgError.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get codeReceiveMsgError;

  /// No description provided for @forgetPasswordUnderText.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email associated with\nyour account'**
  String get forgetPasswordUnderText;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgetPassword;

  /// No description provided for @validationEmailErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'This email is not valid'**
  String get validationEmailErrorMessage;

  /// No description provided for @requiredEmailErrorMessage.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get requiredEmailErrorMessage;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter new password'**
  String get newPasswordHint;

  /// No description provided for @wrongPasswordErrorMsg.
  ///
  /// In en, this message translates to:
  /// **'Wrong password, try again'**
  String get wrongPasswordErrorMsg;

  /// No description provided for @notificationCount.
  ///
  /// In en, this message translates to:
  /// **'3'**
  String get notificationCount;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @savedAddress.
  ///
  /// In en, this message translates to:
  /// **'Saved Address'**
  String get savedAddress;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageChanged.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageChanged;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notification;

  /// No description provided for @termsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get termsConditions;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error:'**
  String get error;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileTitle;

  /// No description provided for @usernameLabel.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get usernameLabel;

  /// No description provided for @firstNameLabel.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstNameLabel;

  /// No description provided for @lastNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastNameLabel;

  /// No description provided for @passwordChangeText.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get passwordChangeText;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @updateButton.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get updateButton;

  /// No description provided for @errorText.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get errorText;

  /// No description provided for @profileUpdatedSuccessMsg.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdatedSuccessMsg;

  /// No description provided for @addToCartBtn.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get addToCartBtn;

  /// No description provided for @mostSellingTitle.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get mostSellingTitle;

  /// No description provided for @mostSellingSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Bloom with our best-selling products'**
  String get mostSellingSubTitle;

  /// No description provided for @occasionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Occasions'**
  String get occasionsTitle;

  /// No description provided for @occasionsSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Celebrate with our top-selling flowers'**
  String get occasionsSubTitle;

  /// No description provided for @versionInfo.
  ///
  /// In en, this message translates to:
  /// **'v 6.3.0 - (446)'**
  String get versionInfo;

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'Deliver to'**
  String get deliverTo;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get subTotal;

  /// No description provided for @deliveryFee.
  ///
  /// In en, this message translates to:
  /// **'Delivery Fee'**
  String get deliveryFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @yourCartIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get yourCartIsEmpty;

  /// No description provided for @addItemsToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Add items to get started'**
  String get addItemsToGetStarted;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue Shopping'**
  String get continueShopping;

  /// No description provided for @removeItem.
  ///
  /// In en, this message translates to:
  /// **'Remove item'**
  String get removeItem;

  /// No description provided for @updateQuantity.
  ///
  /// In en, this message translates to:
  /// **'Update quantity'**
  String get updateQuantity;

  /// No description provided for @itemAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Item added to cart'**
  String get itemAddedToCart;

  /// No description provided for @itemRemovedFromCart.
  ///
  /// In en, this message translates to:
  /// **'Item removed from cart'**
  String get itemRemovedFromCart;

  /// No description provided for @quantityUpdated.
  ///
  /// In en, this message translates to:
  /// **'Quantity updated'**
  String get quantityUpdated;

  /// No description provided for @cartLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading cart...'**
  String get cartLoading;

  /// No description provided for @cartError.
  ///
  /// In en, this message translates to:
  /// **'Error loading cart'**
  String get cartError;

  /// No description provided for @proceedToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Checkout'**
  String get proceedToCheckout;

  /// No description provided for @cartItems.
  ///
  /// In en, this message translates to:
  /// **'Cart Items'**
  String get cartItems;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @shoppingCart.
  ///
  /// In en, this message translates to:
  /// **'Shopping Cart'**
  String get shoppingCart;

  /// No description provided for @emptyCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Your shopping cart is empty. Start adding some beautiful flowers!'**
  String get emptyCartMessage;

  /// No description provided for @viewProducts.
  ///
  /// In en, this message translates to:
  /// **'View Products'**
  String get viewProducts;

  /// No description provided for @cartSummary.
  ///
  /// In en, this message translates to:
  /// **'Cart Summary'**
  String get cartSummary;

  /// No description provided for @applyCoupon.
  ///
  /// In en, this message translates to:
  /// **'Apply Coupon'**
  String get applyCoupon;

  /// No description provided for @couponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCode;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @secureCheckout.
  ///
  /// In en, this message translates to:
  /// **'Secure Checkout'**
  String get secureCheckout;

  /// No description provided for @moneyBackGuarantee.
  ///
  /// In en, this message translates to:
  /// **'30-Day Money Back Guarantee'**
  String get moneyBackGuarantee;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @taxes.
  ///
  /// In en, this message translates to:
  /// **'Taxes'**
  String get taxes;

  /// No description provided for @shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get shipping;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @egp.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get egp;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @recorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get recorder;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @bestSeller.
  ///
  /// In en, this message translates to:
  /// **'Best Seller'**
  String get bestSeller;

  /// No description provided for @occasion.
  ///
  /// In en, this message translates to:
  /// **'Occasion'**
  String get occasion;

  /// No description provided for @noAboutInfoFound.
  ///
  /// In en, this message translates to:
  /// **'No about info found'**
  String get noAboutInfoFound;

  /// No description provided for @notificationDelete.
  ///
  /// In en, this message translates to:
  /// **'Notification deleted'**
  String get notificationDelete;

  /// No description provided for @noTermsFound.
  ///
  /// In en, this message translates to:
  /// **'No terms found'**
  String get noTermsFound;

  /// No description provided for @errorLoadingTerms.
  ///
  /// In en, this message translates to:
  /// **'Error loading terms'**
  String get errorLoadingTerms;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup_title;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get loading;

  /// No description provided for @first_name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get first_name;

  /// No description provided for @first_name_required.
  ///
  /// In en, this message translates to:
  /// **'First name is required'**
  String get first_name_required;

  /// No description provided for @last_name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get last_name;

  /// No description provided for @last_name_required.
  ///
  /// In en, this message translates to:
  /// **'Last name is required'**
  String get last_name_required;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enter_email.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enter_email;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirm_password;

  /// No description provided for @password_mismatch.
  ///
  /// In en, this message translates to:
  /// **'Password does not match'**
  String get password_mismatch;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phone_number;

  /// No description provided for @enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Enter phone number'**
  String get enter_phone_number;

  /// No description provided for @phone_number_required.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phone_number_required;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @gender_required.
  ///
  /// In en, this message translates to:
  /// **'Gender is required'**
  String get gender_required;

  /// No description provided for @terms_prefix.
  ///
  /// In en, this message translates to:
  /// **'Creating an account, you agree to our '**
  String get terms_prefix;

  /// No description provided for @terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get terms_conditions;

  /// No description provided for @signup_button.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup_button;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @signup_success.
  ///
  /// In en, this message translates to:
  /// **'Account created successfully'**
  String get signup_success;

  /// No description provided for @loginRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get loginRequiredTitle;

  /// No description provided for @loginRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You need to login to access this feature.'**
  String get loginRequiredMessage;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add Address'**
  String get addAddress;

  /// No description provided for @savedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// No description provided for @selectLocation.
  ///
  /// In en, this message translates to:
  /// **'Select Location on Map'**
  String get selectLocation;

  /// No description provided for @addressField.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressField;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the address'**
  String get addressHint;

  /// No description provided for @addressRequired.
  ///
  /// In en, this message translates to:
  /// **'Address is required'**
  String get addressRequired;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the phone number'**
  String get phoneHint;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get phoneRequired;

  /// No description provided for @recipientName.
  ///
  /// In en, this message translates to:
  /// **'Recipient name'**
  String get recipientName;

  /// No description provided for @recipientHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the recipient name'**
  String get recipientHint;

  /// No description provided for @recipientRequired.
  ///
  /// In en, this message translates to:
  /// **'Recipient name is required'**
  String get recipientRequired;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @cityHint.
  ///
  /// In en, this message translates to:
  /// **'Cairo'**
  String get cityHint;

  /// No description provided for @cityRequired.
  ///
  /// In en, this message translates to:
  /// **'City is required'**
  String get cityRequired;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @areaHint.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get areaHint;

  /// No description provided for @areaRequired.
  ///
  /// In en, this message translates to:
  /// **'Area is required'**
  String get areaRequired;

  /// No description provided for @saveAddress.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get saveAddress;

  /// No description provided for @selectLocationError.
  ///
  /// In en, this message translates to:
  /// **'Please select a location on the map'**
  String get selectLocationError;

  /// No description provided for @noAddresses.
  ///
  /// In en, this message translates to:
  /// **'No addresses saved'**
  String get noAddresses;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addNewAddress;

  /// No description provided for @errorLoading.
  ///
  /// In en, this message translates to:
  /// **'Error loading addresses'**
  String get errorLoading;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @deleteAddress.
  ///
  /// In en, this message translates to:
  /// **'Delete Address'**
  String get deleteAddress;

  /// No description provided for @deleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this address?'**
  String get deleteConfirmation;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Location permission required'**
  String get required;

  /// No description provided for @grant.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grant;

  /// No description provided for @permanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied'**
  String get permanentlyDenied;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open Settings'**
  String get openSettings;

  /// No description provided for @serviceDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled'**
  String get serviceDisabled;

  /// No description provided for @enableLocation.
  ///
  /// In en, this message translates to:
  /// **'Enable Location'**
  String get enableLocation;

  /// No description provided for @selected.
  ///
  /// In en, this message translates to:
  /// **'Selected: '**
  String get selected;

  /// No description provided for @locationServicesDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled'**
  String get locationServicesDisabled;

  /// No description provided for @permissionDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied'**
  String get permissionDenied;

  /// No description provided for @permissionPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission permanently denied. Enable it in settings.'**
  String get permissionPermanentlyDenied;

  /// No description provided for @errorGettingLocation.
  ///
  /// In en, this message translates to:
  /// **'Error getting location: '**
  String get errorGettingLocation;

  /// No description provided for @enterAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter the address'**
  String get enterAddress;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter the phone number'**
  String get enterPhoneNumber;

  /// No description provided for @updateAddress.
  ///
  /// In en, this message translates to:
  /// **'Update Address'**
  String get updateAddress;

  /// No description provided for @editAddress.
  ///
  /// In en, this message translates to:
  /// **'Edit Address'**
  String get editAddress;

  /// No description provided for @swipeDownToRefresh.
  ///
  /// In en, this message translates to:
  /// **'Swipe down to refresh'**
  String get swipeDownToRefresh;

  /// No description provided for @selectAnAddress.
  ///
  /// In en, this message translates to:
  /// **'Select an address'**
  String get selectAnAddress;

  /// No description provided for @errorLoadingAddress.
  ///
  /// In en, this message translates to:
  /// **'Error loading addresses'**
  String get errorLoadingAddress;

  /// No description provided for @noProductsForCategory.
  ///
  /// In en, this message translates to:
  /// **'No products found for this category'**
  String get noProductsForCategory;

  /// No description provided for @noProductsForOccasion.
  ///
  /// In en, this message translates to:
  /// **'No products found for this occasion'**
  String get noProductsForOccasion;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get deliveryAddress;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNew;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery time'**
  String get deliveryTime;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @instant.
  ///
  /// In en, this message translates to:
  /// **'Instant'**
  String get instant;

  /// No description provided for @arrivesBy.
  ///
  /// In en, this message translates to:
  /// **' Arrive by 03 Sep 2024, 11:00 AM'**
  String get arrivesBy;

  /// No description provided for @itIsAGift.
  ///
  /// In en, this message translates to:
  /// **'It is a gift'**
  String get itIsAGift;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter the name'**
  String get enterName;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter the phone number'**
  String get enterPhone;

  /// No description provided for @completePayment.
  ///
  /// In en, this message translates to:
  /// **'Complete Payment'**
  String get completePayment;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get cashOnDelivery;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit card'**
  String get creditCard;

  /// No description provided for @placing.
  ///
  /// In en, this message translates to:
  /// **'Placing...'**
  String get placing;

  /// No description provided for @clearCartTitle.
  ///
  /// In en, this message translates to:
  /// **'Clear Cart'**
  String get clearCartTitle;

  /// No description provided for @clearCartMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to clear all items?'**
  String get clearCartMessage;

  /// No description provided for @addressChanged.
  ///
  /// In en, this message translates to:
  /// **'Delivery address changed successfully'**
  String get addressChanged;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;

  /// No description provided for @productAddedToCart.
  ///
  /// In en, this message translates to:
  /// **'Product added to cart'**
  String get productAddedToCart;

  /// No description provided for @thisItemIsSoldOut.
  ///
  /// In en, this message translates to:
  /// **'This item is sold out'**
  String get thisItemIsSoldOut;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'Out of Stock'**
  String get outOfStock;

  /// No description provided for @addressAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address added Successfully'**
  String get addressAddedSuccessfully;

  /// No description provided for @addressUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address updated Successfully'**
  String get addressUpdatedSuccessfully;

  /// No description provided for @addressDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Address deleted Successfully'**
  String get addressDeletedSuccessfully;

  /// No description provided for @cartClearedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Cart cleared successfully'**
  String get cartClearedSuccessfully;

  /// No description provided for @profilePhotoUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profile photo updated successfully'**
  String get profilePhotoUpdatedSuccessfully;

  /// No description provided for @passwordUpdatedSuccessMsg.
  ///
  /// In en, this message translates to:
  /// **'Password changed successfully!'**
  String get passwordUpdatedSuccessMsg;

  /// No description provided for @codeLengthError.
  ///
  /// In en, this message translates to:
  /// **'Code must be at least 6 digits'**
  String get codeLengthError;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
