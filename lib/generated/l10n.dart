// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and high quality.`
  String get onboarding_intro_one {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and get the best deals and high quality.',
      name: 'onboarding_intro_one',
      desc: '',
      args: [],
    );
  }

  /// `We offer you the finest carefully selected fruits. Check details, images, and reviews to ensure you pick the perfect fruit.`
  String get onboarding_intro_two {
    return Intl.message(
      'We offer you the finest carefully selected fruits. Check details, images, and reviews to ensure you pick the perfect fruit.',
      name: 'onboarding_intro_two',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to FruitHub`
  String get onboarding_intro_title_one {
    return Intl.message(
      'Welcome to FruitHub',
      name: 'onboarding_intro_title_one',
      desc: '',
      args: [],
    );
  }

  /// `Search and Shop`
  String get search_and_shop {
    return Intl.message(
      'Search and Shop',
      name: 'search_and_shop',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get cart {
    return Intl.message(
      'Shopping Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgot {
    return Intl.message(
      'Forgot Password?',
      name: 'forgot',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect username or password`
  String get login_error {
    return Intl.message(
      'Incorrect username or password',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Successfully logged in`
  String get login_success {
    return Intl.message(
      'Successfully logged in',
      name: 'login_success',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get register_error {
    return Intl.message(
      'Email already in use',
      name: 'register_error',
      desc: '',
      args: [],
    );
  }

  /// `Successfully registered`
  String get register_success {
    return Intl.message(
      'Successfully registered',
      name: 'register_success',
      desc: '',
      args: [],
    );
  }

  /// `Successfully logged out`
  String get logout_success {
    return Intl.message(
      'Successfully logged out',
      name: 'logout_success',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `create one`
  String get make_account {
    return Intl.message(
      'create one',
      name: 'make_account',
      desc: '',
      args: [],
    );
  }

  /// `Login with Google`
  String get login_with_google {
    return Intl.message(
      'Login with Google',
      name: 'login_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Login with Facebook`
  String get login_with_facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'login_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get login_with_apple {
    return Intl.message(
      'Login with Apple',
      name: 'login_with_apple',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message(
      'Full Name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `by_creating_an_account_you_agree_to`
  String get by_creating_an_account_you_agree_to {
    return Intl.message(
      'by_creating_an_account_you_agree_to',
      name: 'by_creating_an_account_you_agree_to',
      desc: '',
      args: [],
    );
  }

  /// `Our Terms and Conditions`
  String get our_terms_and_conditions {
    return Intl.message(
      'Our Terms and Conditions',
      name: 'our_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `New Account Registration`
  String get new_account_registration {
    return Intl.message(
      'New Account Registration',
      name: 'new_account_registration',
      desc: '',
      args: [],
    );
  }

  /// `You already have an account?`
  String get you_already_have_an_account {
    return Intl.message(
      'You already have an account?',
      name: 'you_already_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get please_enter_you_name {
    return Intl.message(
      'Please enter your name',
      name: 'please_enter_you_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get please_enter_you_email {
    return Intl.message(
      'Please enter your email',
      name: 'please_enter_you_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_you_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_you_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get please_enter_you_confirm_password {
    return Intl.message(
      'Please enter your confirm password',
      name: 'please_enter_you_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your full name`
  String get please_enter_you_full_name {
    return Intl.message(
      'Please enter your full name',
      name: 'please_enter_you_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get please_enter_a_valid_email {
    return Intl.message(
      'Please enter a valid email',
      name: 'please_enter_a_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get please_enter_a_valid_password {
    return Intl.message(
      'Please enter a valid password',
      name: 'please_enter_a_valid_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid full name`
  String get please_enter_a_valid_full_name {
    return Intl.message(
      'Please enter a valid full name',
      name: 'please_enter_a_valid_full_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid confirm password`
  String get please_enter_a_valid_confirm_password {
    return Intl.message(
      'Please enter a valid confirm password',
      name: 'please_enter_a_valid_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get the_password_provided_is_too_weak {
    return Intl.message(
      'The password provided is too weak',
      name: 'the_password_provided_is_too_weak',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email`
  String get account_already_in_use {
    return Intl.message(
      'The account already exists for that email',
      name: 'account_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while creating the user.`
  String get an_error_occurred_while_creating_the_user {
    return Intl.message(
      'An error occurred while creating the user.',
      name: 'an_error_occurred_while_creating_the_user',
      desc: '',
      args: [],
    );
  }

  /// `Please accept the Terms and Conditions.`
  String get please_accept_the_terms_and_conditions {
    return Intl.message(
      'Please accept the Terms and Conditions.',
      name: 'please_accept_the_terms_and_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection and try again.`
  String get please_check_your_internet_connection_and_try_again {
    return Intl.message(
      'Please check your internet connection and try again.',
      name: 'please_check_your_internet_connection_and_try_again',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email`
  String get user_not_found_for_that_email {
    return Intl.message(
      'No user found for that email',
      name: 'user_not_found_for_that_email',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Password or Email provided for that user`
  String get wrong_password_or_email_provided_for_that_user {
    return Intl.message(
      'Wrong Password or Email provided for that user',
      name: 'wrong_password_or_email_provided_for_that_user',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak`
  String get weak_password {
    return Intl.message(
      'The password provided is too weak',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
