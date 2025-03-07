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
/// import 'app_texts/app_localizations.dart';
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Guidix\nWe designed this app to make life easier for the blind and visually impaired. You can scan QR codes to access information effortlessly, with the ability to edit QR code data or purchase new codes directly through the app. Start now and make the world more accessible for everyone!'**
  String get welcomeMessage;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'sign Up'**
  String get signUp;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @creatAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Creat An Account'**
  String get creatAnAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please type ypur name'**
  String get fullNameHint;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @emailHint.
  ///
  /// In en, this message translates to:
  /// **'Please typr your email'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue With Google'**
  String get continueWithGoogle;

  /// No description provided for @continueWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Continue With Facebook'**
  String get continueWithFacebook;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @donotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donotHaveAnAccount;

  /// No description provided for @enterYourEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get enterYourEmailAddress;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @verifyYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify your email'**
  String get verifyYourEmail;

  /// No description provided for @enteringTheCode.
  ///
  /// In en, this message translates to:
  /// **'Please enter the code we sent to email'**
  String get enteringTheCode;

  /// No description provided for @recevivingTheCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code ?'**
  String get recevivingTheCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'verify'**
  String get verify;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create new password'**
  String get createNewPassword;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @scanQr.
  ///
  /// In en, this message translates to:
  /// **'Scan your QR code'**
  String get scanQr;

  /// No description provided for @scan.
  ///
  /// In en, this message translates to:
  /// **'scan'**
  String get scan;

  /// No description provided for @cameraAcess.
  ///
  /// In en, this message translates to:
  /// **'Camera access for this app'**
  String get cameraAcess;

  /// No description provided for @allowOnlyWhileUsingTheApp.
  ///
  /// In en, this message translates to:
  /// **'Allow only while using the app'**
  String get allowOnlyWhileUsingTheApp;

  /// No description provided for @askEveryTime.
  ///
  /// In en, this message translates to:
  /// **'Ask every time'**
  String get askEveryTime;

  /// No description provided for @donotAllow.
  ///
  /// In en, this message translates to:
  /// **'Don\'t allow'**
  String get donotAllow;

  /// No description provided for @addNew.
  ///
  /// In en, this message translates to:
  /// **'Add new'**
  String get addNew;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View details'**
  String get viewDetails;

  /// No description provided for @newQrCode.
  ///
  /// In en, this message translates to:
  /// **'New QR Code'**
  String get newQrCode;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @categoryHint.
  ///
  /// In en, this message translates to:
  /// **'Type a name of category'**
  String get categoryHint;

  /// No description provided for @qrCodeDetails.
  ///
  /// In en, this message translates to:
  /// **'QR code details'**
  String get qrCodeDetails;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @nameAR.
  ///
  /// In en, this message translates to:
  /// **'Name in Arabic'**
  String get nameAR;

  /// No description provided for @nameEn.
  ///
  /// In en, this message translates to:
  /// **'Name in English'**
  String get nameEn;

  /// No description provided for @nameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the product name'**
  String get nameHint;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionAR.
  ///
  /// In en, this message translates to:
  /// **'Description in Arabic'**
  String get descriptionAR;

  /// No description provided for @descriptionEn.
  ///
  /// In en, this message translates to:
  /// **'Description in English'**
  String get descriptionEn;

  /// No description provided for @descriptionHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your description'**
  String get descriptionHint;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @myQrCode.
  ///
  /// In en, this message translates to:
  /// **'My QR Code'**
  String get myQrCode;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @clothes.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothes;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get seeAll;

  /// No description provided for @addCategory.
  ///
  /// In en, this message translates to:
  /// **'Add category'**
  String get addCategory;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @deleteSelectedItem.
  ///
  /// In en, this message translates to:
  /// **'Delete selected item ?'**
  String get deleteSelectedItem;

  /// No description provided for @discard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get discard;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @newCategory.
  ///
  /// In en, this message translates to:
  /// **'New category'**
  String get newCategory;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @community.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get community;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @qrCode.
  ///
  /// In en, this message translates to:
  /// **'My QR'**
  String get qrCode;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'My account'**
  String get myAccount;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @typeQrCode.
  ///
  /// In en, this message translates to:
  /// **'Type QR code'**
  String get typeQrCode;

  /// No description provided for @sticker.
  ///
  /// In en, this message translates to:
  /// **'Sticker'**
  String get sticker;

  /// No description provided for @quantityOfSticker.
  ///
  /// In en, this message translates to:
  /// **'Quantity of sticker:'**
  String get quantityOfSticker;

  /// No description provided for @fabric.
  ///
  /// In en, this message translates to:
  /// **'Fabric'**
  String get fabric;

  /// No description provided for @quantityOfFabric.
  ///
  /// In en, this message translates to:
  /// **'Quantity of fabric:'**
  String get quantityOfFabric;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get buyNow;

  /// No description provided for @showNearbyServices.
  ///
  /// In en, this message translates to:
  /// **'Show nearby services'**
  String get showNearbyServices;

  /// No description provided for @accessMessage.
  ///
  /// In en, this message translates to:
  /// **'We need to know your loction in order to suggest nearby services'**
  String get accessMessage;

  /// No description provided for @enterAddressManually.
  ///
  /// In en, this message translates to:
  /// **'Enter address manually'**
  String get enterAddressManually;

  /// No description provided for @locateMe.
  ///
  /// In en, this message translates to:
  /// **'Locate me'**
  String get locateMe;

  /// No description provided for @donotAskAgain.
  ///
  /// In en, this message translates to:
  /// **'Don\'t ask again'**
  String get donotAskAgain;

  /// No description provided for @enterYourAddress.
  ///
  /// In en, this message translates to:
  /// **'Enter your address'**
  String get enterYourAddress;

  /// No description provided for @deliverTo.
  ///
  /// In en, this message translates to:
  /// **'Delivere to'**
  String get deliverTo;

  /// No description provided for @streetName.
  ///
  /// In en, this message translates to:
  /// **'Street name'**
  String get streetName;

  /// No description provided for @buildingName.
  ///
  /// In en, this message translates to:
  /// **'Building name'**
  String get buildingName;

  /// No description provided for @floorAppartmentVilla.
  ///
  /// In en, this message translates to:
  /// **'Floor,Appartment or Villa'**
  String get floorAppartmentVilla;

  /// No description provided for @landnark.
  ///
  /// In en, this message translates to:
  /// **'Landmark'**
  String get landnark;

  /// No description provided for @addDeliveryInstructions.
  ///
  /// In en, this message translates to:
  /// **'Add delivery instructions'**
  String get addDeliveryInstructions;

  /// No description provided for @addressType.
  ///
  /// In en, this message translates to:
  /// **'Addres type'**
  String get addressType;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @youraddress.
  ///
  /// In en, this message translates to:
  /// **'Your address'**
  String get youraddress;

  /// No description provided for @continuee.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuee;

  /// No description provided for @addNewAddress.
  ///
  /// In en, this message translates to:
  /// **'Add new address'**
  String get addNewAddress;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get paymentMethod;

  /// No description provided for @selectPaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Select payment method'**
  String get selectPaymentMethod;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get signOut;

  /// No description provided for @instapay.
  ///
  /// In en, this message translates to:
  /// **'Instapay'**
  String get instapay;

  /// No description provided for @vodafoneCash.
  ///
  /// In en, this message translates to:
  /// **'Vodafone'**
  String get vodafoneCash;

  /// No description provided for @confirmPayment.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get confirmPayment;

  /// No description provided for @addNewCard.
  ///
  /// In en, this message translates to:
  /// **'Add new card'**
  String get addNewCard;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @cardNumber.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get cardNumber;

  /// No description provided for @ccv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get ccv;

  /// No description provided for @expires.
  ///
  /// In en, this message translates to:
  /// **'Expires'**
  String get expires;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get darkMode;

  /// No description provided for @inverterTheme.
  ///
  /// In en, this message translates to:
  /// **'Invert mode'**
  String get inverterTheme;

  /// No description provided for @otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get otp;

  /// No description provided for @linkAccount.
  ///
  /// In en, this message translates to:
  /// **'Link account'**
  String get linkAccount;

  /// No description provided for @defaultCard.
  ///
  /// In en, this message translates to:
  /// **'Make this my default card'**
  String get defaultCard;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'Visa'**
  String get visa;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'How was your experience with us?'**
  String get experience;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @paymentSuccess.
  ///
  /// In en, this message translates to:
  /// **'Payment success'**
  String get paymentSuccess;

  /// No description provided for @thankYou.
  ///
  /// In en, this message translates to:
  /// **'thank you'**
  String get thankYou;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @greetingHi.
  ///
  /// In en, this message translates to:
  /// **'Hi, Name'**
  String get greetingHi;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Meet you alwaye be good'**
  String get greeting;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get orders;

  /// No description provided for @payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get payments;

  /// No description provided for @myAddresses.
  ///
  /// In en, this message translates to:
  /// **'My Address'**
  String get myAddresses;

  /// No description provided for @inviteFriends.
  ///
  /// In en, this message translates to:
  /// **'Invite friends'**
  String get inviteFriends;

  /// No description provided for @help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @remove.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove;

  /// No description provided for @setAsDefault.
  ///
  /// In en, this message translates to:
  /// **'Set as default'**
  String get setAsDefault;

  /// No description provided for @lightMood.
  ///
  /// In en, this message translates to:
  /// **'Light mood'**
  String get lightMood;

  /// No description provided for @darkMood.
  ///
  /// In en, this message translates to:
  /// **'Dark mood'**
  String get darkMood;

  /// No description provided for @invertColor.
  ///
  /// In en, this message translates to:
  /// **'Invert color'**
  String get invertColor;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get logOut;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @wanttologOut.
  ///
  /// In en, this message translates to:
  /// **'Do you Want to log out?'**
  String get wanttologOut;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes,log out'**
  String get yes;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'Lirst name'**
  String get firstName;

  /// No description provided for @firstNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please type your first name'**
  String get firstNameHint;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lastName;

  /// No description provided for @lastNameHint.
  ///
  /// In en, this message translates to:
  /// **'Please type your last name'**
  String get lastNameHint;

  /// No description provided for @enterYourBirthday.
  ///
  /// In en, this message translates to:
  /// **'Enter your birthday'**
  String get enterYourBirthday;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @subTotal.
  ///
  /// In en, this message translates to:
  /// **'Sub Total'**
  String get subTotal;

  /// No description provided for @cashOnDelivery.
  ///
  /// In en, this message translates to:
  /// **'Cash on deliver'**
  String get cashOnDelivery;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @orderPlaced.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get orderPlaced;

  /// No description provided for @orderDispatched.
  ///
  /// In en, this message translates to:
  /// **'Order dispatched'**
  String get orderDispatched;

  /// No description provided for @orderInTransit.
  ///
  /// In en, this message translates to:
  /// **'Order in transit'**
  String get orderInTransit;

  /// No description provided for @deliveredSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Delivered successfully'**
  String get deliveredSuccessfully;

  /// No description provided for @howToScan.
  ///
  /// In en, this message translates to:
  /// **'How can you scan ?'**
  String get howToScan;

  /// No description provided for @howToScanHint.
  ///
  /// In en, this message translates to:
  /// **'1. Open the application.\n2. Select the \'Scan\' button.\n3. Point your camera at the QR code.\n4. The app will scan the code and display options: \'Add New\' or \'View Details\'.\n5. If you select \'Add New\', you can enter information: Name, Category, and Description. You can either choose an existing category or create a new one.\n6. If you choose \'View Details\', you\'ll see the existing details: Name, Category, and Description, with an option to edit them.'**
  String get howToScanHint;

  /// No description provided for @howToBuy.
  ///
  /// In en, this message translates to:
  /// **'How can you buy QR code online ?'**
  String get howToBuy;

  /// No description provided for @howToBuyHint.
  ///
  /// In en, this message translates to:
  /// **'1. Open the application.\n2. Select the cart.\n3. Choose the material and quantity\n4. Enter your details: name and address.\n5. Select the payment method: Cash, Visa, or Vodafone Cash.\n6. If you choose Visa, enter card details: card number, expiry date, and CVV.\n7. Press confirm order.'**
  String get howToBuyHint;

  /// No description provided for @howToEdit.
  ///
  /// In en, this message translates to:
  /// **'How can you edit info in your QR Code ?'**
  String get howToEdit;

  /// No description provided for @howToEditHint.
  ///
  /// In en, this message translates to:
  /// **'1. Open the application.\n2. Select the \'Scan\' button.\n3. Point the camera at the QR code.\n4. Click on \'View Details\' when it appears.\n5. Click on \'View Details\' to see the information.\n6 .Scroll down and select \'Edit\'.\n7. Modify the information as needed.\n'**
  String get howToEditHint;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @noProductYet.
  ///
  /// In en, this message translates to:
  /// **'No product yet'**
  String get noProductYet;

  /// No description provided for @noProductCompletedYet.
  ///
  /// In en, this message translates to:
  /// **'No product completed yet'**
  String get noProductCompletedYet;

  /// No description provided for @noProductCancelled.
  ///
  /// In en, this message translates to:
  /// **'No product cancelled'**
  String get noProductCancelled;

  /// No description provided for @myAddress.
  ///
  /// In en, this message translates to:
  /// **'My address'**
  String get myAddress;

  /// No description provided for @enableLocation.
  ///
  /// In en, this message translates to:
  /// **'Enable location'**
  String get enableLocation;

  /// No description provided for @enableYourLocation.
  ///
  /// In en, this message translates to:
  /// **'Please enable location services on your device'**
  String get enableYourLocation;

  /// No description provided for @wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get wallet;

  /// No description provided for @emptyWallet.
  ///
  /// In en, this message translates to:
  /// **'Your wallet is empty.\n Please add payment methods first'**
  String get emptyWallet;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get connectionError;

  /// No description provided for @checkyourInternet.
  ///
  /// In en, this message translates to:
  /// **'please check your internet connection'**
  String get checkyourInternet;

  /// No description provided for @scanQrCodeWithFlash.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code with flash'**
  String get scanQrCodeWithFlash;

  /// No description provided for @scanQrCodeWithoutFlash.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code without flash'**
  String get scanQrCodeWithoutFlash;

  /// No description provided for @scanQrCodeWithCamera.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code with camera'**
  String get scanQrCodeWithCamera;

  /// No description provided for @scanQrCodeWithCameraAndFlash.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code with camera and flash'**
  String get scanQrCodeWithCameraAndFlash;

  /// No description provided for @communitySoon.
  ///
  /// In en, this message translates to:
  /// **'Community soon'**
  String get communitySoon;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @qrcode.
  ///
  /// In en, this message translates to:
  /// **'QR code'**
  String get qrcode;

  /// No description provided for @deleteCategory.
  ///
  /// In en, this message translates to:
  /// **'Delete category'**
  String get deleteCategory;

  /// No description provided for @backLabel.
  ///
  /// In en, this message translates to:
  /// **'Back To Previouse Screen'**
  String get backLabel;

  /// No description provided for @notfoundQrCode.
  ///
  /// In en, this message translates to:
  /// **'This QRCode is not supported by Guidix System yet .Try to scan the correct Guidix QRCode .If the problem persist please contact our support team'**
  String get notfoundQrCode;

  /// No description provided for @saveUpdates.
  ///
  /// In en, this message translates to:
  /// **'Save updates'**
  String get saveUpdates;
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
