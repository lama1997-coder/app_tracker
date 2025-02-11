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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message('Hello', name: 'hello', desc: '', args: []);
  }

  /// `Login to your account`
  String get loginTitle {
    return Intl.message(
      'Login to your account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `It’s great to see you again.`
  String get loginSubtitle {
    return Intl.message(
      'It’s great to see you again.',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login`
  String get loginButton {
    return Intl.message('Login', name: 'loginButton', desc: '', args: []);
  }

  /// `Don't have an account? `
  String get registerPrompt {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'registerPrompt',
      desc: '',
      args: [],
    );
  }

  /// ` Register here`
  String get register_here {
    return Intl.message(
      ' Register here',
      name: 'register_here',
      desc: '',
      args: [],
    );
  }

  /// `You have an account? `
  String get loginPrompt {
    return Intl.message(
      'You have an account? ',
      name: 'loginPrompt',
      desc: '',
      args: [],
    );
  }

  /// ` Login here`
  String get login_here {
    return Intl.message(' Login here', name: 'login_here', desc: '', args: []);
  }

  /// `Welcome `
  String get welcome {
    return Intl.message('Welcome ', name: 'welcome', desc: '', args: []);
  }

  /// `Coming soon`
  String get soon {
    return Intl.message('Coming soon', name: 'soon', desc: '', args: []);
  }

  /// `Your money Tracker`
  String get for_your_business {
    return Intl.message(
      'Your money Tracker',
      name: 'for_your_business',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Feathers`
  String get feathers {
    return Intl.message('Feathers', name: 'feathers', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Sheet`
  String get sheet {
    return Intl.message('Sheet', name: 'sheet', desc: '', args: []);
  }

  /// `Sheets`
  String get sheets {
    return Intl.message('Sheets', name: 'sheets', desc: '', args: []);
  }

  /// `Accounts`
  String get accounts {
    return Intl.message('Accounts', name: 'accounts', desc: '', args: []);
  }

  /// `Categories`
  String get categories {
    return Intl.message('Categories', name: 'categories', desc: '', args: []);
  }

  /// `Account Group`
  String get account_group {
    return Intl.message(
      'Account Group',
      name: 'account_group',
      desc: '',
      args: [],
    );
  }

  /// `A sufficiently long subtitle warrants three lines.`
  String get sheets_subtitle {
    return Intl.message(
      'A sufficiently long subtitle warrants three lines.',
      name: 'sheets_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `A sufficiently long subtitle warrants three lines.`
  String get accounts_subtitle {
    return Intl.message(
      'A sufficiently long subtitle warrants three lines.',
      name: 'accounts_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `A sufficiently long subtitle warrants three lines.`
  String get categories_subtitle {
    return Intl.message(
      'A sufficiently long subtitle warrants three lines.',
      name: 'categories_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `A sufficiently long subtitle warrants three lines.`
  String get account_group_subtitle {
    return Intl.message(
      'A sufficiently long subtitle warrants three lines.',
      name: 'account_group_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Add New Sheet`
  String get add_new_sheet {
    return Intl.message(
      'Add New Sheet',
      name: 'add_new_sheet',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Start Amount`
  String get start_amount {
    return Intl.message(
      'Start Amount',
      name: 'start_amount',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get currency {
    return Intl.message('Currency', name: 'currency', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Amount`
  String get amount {
    return Intl.message('Amount', name: 'amount', desc: '', args: []);
  }

  /// `In`
  String get income {
    return Intl.message('In', name: 'income', desc: '', args: []);
  }

  /// `Out`
  String get outcome {
    return Intl.message('Out', name: 'outcome', desc: '', args: []);
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Operations`
  String get operations {
    return Intl.message('Operations', name: 'operations', desc: '', args: []);
  }

  /// `Type`
  String get type {
    return Intl.message('Type', name: 'type', desc: '', args: []);
  }

  /// `Create new operation`
  String get create_new_operation {
    return Intl.message(
      'Create new operation',
      name: 'create_new_operation',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Please enter a name`
  String get please_enter_name {
    return Intl.message(
      'Please enter a name',
      name: 'please_enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an amount`
  String get please_enter_amount {
    return Intl.message(
      'Please enter an amount',
      name: 'please_enter_amount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an currency`
  String get please_enter_currency {
    return Intl.message(
      'Please enter an currency',
      name: 'please_enter_currency',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount`
  String get invalid_amount {
    return Intl.message(
      'Invalid amount',
      name: 'invalid_amount',
      desc: '',
      args: [],
    );
  }

  /// `Form Submitted`
  String get form_submitted {
    return Intl.message(
      'Form Submitted',
      name: 'form_submitted',
      desc: '',
      args: [],
    );
  }

  /// `The new sheet has been added successfully.`
  String get sheet_added_successfully {
    return Intl.message(
      'The new sheet has been added successfully.',
      name: 'sheet_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Date of Birth`
  String get date_of_birth {
    return Intl.message(
      'Date of Birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message('Country', name: 'country', desc: '', args: []);
  }

  /// `This field is required`
  String get required_field {
    return Intl.message(
      'This field is required',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get number {
    return Intl.message('Number', name: 'number', desc: '', args: []);
  }

  /// `Select an option`
  String get dropdown {
    return Intl.message(
      'Select an option',
      name: 'dropdown',
      desc: '',
      args: [],
    );
  }

  /// `Choose an option`
  String get radio {
    return Intl.message('Choose an option', name: 'radio', desc: '', args: []);
  }

  /// `Please enter a valid number`
  String get invalid_number {
    return Intl.message(
      'Please enter a valid number',
      name: 'invalid_number',
      desc: '',
      args: [],
    );
  }

  /// `Date & Time`
  String get date_time {
    return Intl.message('Date & Time', name: 'date_time', desc: '', args: []);
  }

  /// `Select Date`
  String get select_date {
    return Intl.message('Select Date', name: 'select_date', desc: '', args: []);
  }

  /// `Select Time`
  String get select_time {
    return Intl.message('Select Time', name: 'select_time', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Create an Account`
  String get register_prompt {
    return Intl.message(
      'Create an Account',
      name: 'register_prompt',
      desc: '',
      args: [],
    );
  }

  /// `It’s great to join us.`
  String get register_greeting {
    return Intl.message(
      'It’s great to join us.',
      name: 'register_greeting',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get birthday {
    return Intl.message('Birthday', name: 'birthday', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message('Sign Up', name: 'sign_up', desc: '', args: []);
  }

  /// `Registration Successful`
  String get registration_successful {
    return Intl.message(
      'Registration Successful',
      name: 'registration_successful',
      desc: '',
      args: [],
    );
  }

  /// `There was an error with your registration. Please try again.`
  String get registration_error {
    return Intl.message(
      'There was an error with your registration. Please try again.',
      name: 'registration_error',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Enter OTP`
  String get otp_screen_title {
    return Intl.message(
      'Enter OTP',
      name: 'otp_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `A verification code has been sent to your email.`
  String get otp_verification_message {
    return Intl.message(
      'A verification code has been sent to your email.',
      name: 'otp_verification_message',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get invalid_email_error {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'invalid_email_error',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get password_length_error {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'password_length_error',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get gender_selection {
    return Intl.message(
      'Select Gender',
      name: 'gender_selection',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male_option {
    return Intl.message('Male', name: 'male_option', desc: '', args: []);
  }

  /// `Female`
  String get female_option {
    return Intl.message('Female', name: 'female_option', desc: '', args: []);
  }

  /// `عربي`
  String get arabic {
    return Intl.message('عربي', name: 'arabic', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Receive OTP in email`
  String get receiveOtpInEmail {
    return Intl.message(
      'Receive OTP in email',
      name: 'receiveOtpInEmail',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message('User name', name: 'username', desc: '', args: []);
  }

  /// `Password does not match`
  String get password_not_match {
    return Intl.message(
      'Password does not match',
      name: 'password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty`
  String get password_empty {
    return Intl.message(
      'Password cannot be empty',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete?`
  String get areYouSureToDelete {
    return Intl.message(
      'Are you sure you want to delete?',
      name: 'areYouSureToDelete',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get field_required {
    return Intl.message(
      'This field is required',
      name: 'field_required',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forget_password {
    return Intl.message(
      'Forget Password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address`
  String get enter_email {
    return Intl.message(
      'Enter your email address',
      name: 'enter_email',
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
