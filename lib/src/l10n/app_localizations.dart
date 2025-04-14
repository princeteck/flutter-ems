import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

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
/// import 'l10n/app_localizations.dart';
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
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Employment Management System'**
  String get appTitle;

  /// No description provided for @welcomeMessage.
  ///
  /// In en, this message translates to:
  /// **'Welcome to your Employment Management System'**
  String get welcomeMessage;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

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

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @addEmployee.
  ///
  /// In en, this message translates to:
  /// **'Add Employee'**
  String get addEmployee;

  /// No description provided for @addProfession.
  ///
  /// In en, this message translates to:
  /// **'Add Profession'**
  String get addProfession;

  /// No description provided for @updateProfession.
  ///
  /// In en, this message translates to:
  /// **'Update Profession'**
  String get updateProfession;

  /// No description provided for @professionsDashboard.
  ///
  /// In en, this message translates to:
  /// **'Professions Dashboard'**
  String get professionsDashboard;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailAddress;

  /// No description provided for @joiningDate.
  ///
  /// In en, this message translates to:
  /// **'Joining Date'**
  String get joiningDate;

  /// No description provided for @finalDate.
  ///
  /// In en, this message translates to:
  /// **'Final Date'**
  String get finalDate;

  /// No description provided for @employeesList.
  ///
  /// In en, this message translates to:
  /// **'Employees List'**
  String get employeesList;

  /// No description provided for @employeeDetails.
  ///
  /// In en, this message translates to:
  /// **'Employee Details'**
  String get employeeDetails;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @professions.
  ///
  /// In en, this message translates to:
  /// **'Professions'**
  String get professions;

  /// No description provided for @menu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get menu;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @systemThemeMode.
  ///
  /// In en, this message translates to:
  /// **'System Theme Mode'**
  String get systemThemeMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @appSettings.
  ///
  /// In en, this message translates to:
  /// **'App Settings'**
  String get appSettings;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @helpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get helpCenter;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @profileInformation.
  ///
  /// In en, this message translates to:
  /// **'Profile Information'**
  String get profileInformation;

  /// No description provided for @updateEmployee.
  ///
  /// In en, this message translates to:
  /// **'Update Employee'**
  String get updateEmployee;

  /// No description provided for @hintFullName.
  ///
  /// In en, this message translates to:
  /// **'e.g. John Doe'**
  String get hintFullName;

  /// No description provided for @hintEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'john.doe@example.com'**
  String get hintEmailAddress;

  /// No description provided for @noDate.
  ///
  /// In en, this message translates to:
  /// **'No Date'**
  String get noDate;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @nextMonth.
  ///
  /// In en, this message translates to:
  /// **'Next Month'**
  String get nextMonth;

  /// No description provided for @afterOneWeek.
  ///
  /// In en, this message translates to:
  /// **'After 1 Week'**
  String get afterOneWeek;

  /// No description provided for @previousMonth.
  ///
  /// In en, this message translates to:
  /// **'Previous Month'**
  String get previousMonth;

  /// No description provided for @selectMonthAndYear.
  ///
  /// In en, this message translates to:
  /// **'Select Month and Year'**
  String get selectMonthAndYear;

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get selectDate;

  /// No description provided for @nextMonday.
  ///
  /// In en, this message translates to:
  /// **'Next Monday'**
  String get nextMonday;

  /// No description provided for @exampleFullName.
  ///
  /// In en, this message translates to:
  /// **'John Doe'**
  String get exampleFullName;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @noDateSelected.
  ///
  /// In en, this message translates to:
  /// **'No Date Selected'**
  String get noDateSelected;

  /// No description provided for @dateSelected.
  ///
  /// In en, this message translates to:
  /// **'Date Selected'**
  String get dateSelected;

  /// No description provided for @pleaseEnterAValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get pleaseEnterAValidEmail;

  /// No description provided for @pleaseEnterAValidFullName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid full name'**
  String get pleaseEnterAValidFullName;

  /// No description provided for @pleaseEnterAValidProfession.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid profession'**
  String get pleaseEnterAValidProfession;

  /// No description provided for @finalDateCannotBeBeforeJoinDate.
  ///
  /// In en, this message translates to:
  /// **'Final date cannot be before Joining date'**
  String get finalDateCannotBeBeforeJoinDate;

  /// No description provided for @employeeAdded.
  ///
  /// In en, this message translates to:
  /// **'Employee added successfully'**
  String get employeeAdded;

  /// No description provided for @employeeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Employee updated successfully'**
  String get employeeUpdated;

  /// No description provided for @employeeDeleted.
  ///
  /// In en, this message translates to:
  /// **'Employee deleted successfully'**
  String get employeeDeleted;

  /// No description provided for @employeeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Employee not found'**
  String get employeeNotFound;

  /// No description provided for @employeeListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Employee list is empty'**
  String get employeeListEmpty;

  /// No description provided for @noProfessions.
  ///
  /// In en, this message translates to:
  /// **'No professions available'**
  String get noProfessions;

  /// No description provided for @professionAdded.
  ///
  /// In en, this message translates to:
  /// **'Profession added successfully'**
  String get professionAdded;

  /// No description provided for @professionUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profession updated successfully'**
  String get professionUpdated;

  /// No description provided for @professionDeleted.
  ///
  /// In en, this message translates to:
  /// **'Profession deleted successfully'**
  String get professionDeleted;

  /// No description provided for @professionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Profession not found'**
  String get professionNotFound;

  /// No description provided for @professionListEmpty.
  ///
  /// In en, this message translates to:
  /// **'Profession list is empty'**
  String get professionListEmpty;

  /// No description provided for @noEmployees.
  ///
  /// In en, this message translates to:
  /// **'No employees available'**
  String get noEmployees;

  /// No description provided for @nameTheProfessionToBeAdded.
  ///
  /// In en, this message translates to:
  /// **'Name the profession to be added'**
  String get nameTheProfessionToBeAdded;

  /// No description provided for @nameTheProfessionToBeUpdated.
  ///
  /// In en, this message translates to:
  /// **'Name the profession to be updated'**
  String get nameTheProfessionToBeUpdated;

  /// No description provided for @hintProfession.
  ///
  /// In en, this message translates to:
  /// **'e.g. Software Engineer, Manager, etc.'**
  String get hintProfession;

  /// No description provided for @errorProfessionName.
  ///
  /// In en, this message translates to:
  /// **'Profession name cannot be empty'**
  String get errorProfessionName;

  /// No description provided for @errorProfessionNameLength.
  ///
  /// In en, this message translates to:
  /// **'Profession name must be between 3 and 50 characters'**
  String get errorProfessionNameLength;

  /// No description provided for @deleteAllProfessionTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete All Professions'**
  String get deleteAllProfessionTitle;

  /// No description provided for @deleteAllProfessionsMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all professions? This action cannot be undone.'**
  String get deleteAllProfessionsMessage;

  /// No description provided for @deleteAllEmployeesTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete All Employees'**
  String get deleteAllEmployeesTitle;

  /// No description provided for @deleteAllEmployeesMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete all employees? This action cannot be undone.'**
  String get deleteAllEmployeesMessage;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @errorSavingEmployee.
  ///
  /// In en, this message translates to:
  /// **'Error saving employee data'**
  String get errorSavingEmployee;

  /// No description provided for @employeeUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Employee updated successfully'**
  String get employeeUpdatedSuccessfully;

  /// No description provided for @employeeDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Employee deleted successfully'**
  String get employeeDeletedSuccessfully;

  /// No description provided for @errorDeletingEmployee.
  ///
  /// In en, this message translates to:
  /// **'Error deleting employee'**
  String get errorDeletingEmployee;

  /// No description provided for @errorLoadingEmployees.
  ///
  /// In en, this message translates to:
  /// **'Error loading employees'**
  String get errorLoadingEmployees;

  /// No description provided for @errorLoadingProfessions.
  ///
  /// In en, this message translates to:
  /// **'Error loading professions'**
  String get errorLoadingProfessions;

  /// No description provided for @errorSavingProfession.
  ///
  /// In en, this message translates to:
  /// **'Error saving profession data'**
  String get errorSavingProfession;

  /// No description provided for @professionUpdatedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profession updated successfully'**
  String get professionUpdatedSuccessfully;

  /// No description provided for @professionDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Profession deleted successfully'**
  String get professionDeletedSuccessfully;

  /// No description provided for @errorDeletingProfession.
  ///
  /// In en, this message translates to:
  /// **'Error deleting profession'**
  String get errorDeletingProfession;

  /// No description provided for @errorLoadingProfessionsList.
  ///
  /// In en, this message translates to:
  /// **'Error loading professions list'**
  String get errorLoadingProfessionsList;

  /// No description provided for @errorLoadingEmployeesList.
  ///
  /// In en, this message translates to:
  /// **'Error loading employees list'**
  String get errorLoadingEmployeesList;

  /// No description provided for @errorUpdatingEmployee.
  ///
  /// In en, this message translates to:
  /// **'Error updating employee'**
  String get errorUpdatingEmployee;

  /// No description provided for @employeeAddedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Employee added successfully'**
  String get employeeAddedSuccessfully;

  /// No description provided for @errorDeletingEmployees.
  ///
  /// In en, this message translates to:
  /// **'Error deleting employees'**
  String get errorDeletingEmployees;

  /// No description provided for @allEmployeesDeletedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'All employees deleted successfully'**
  String get allEmployeesDeletedSuccessfully;

  /// No description provided for @profession.
  ///
  /// In en, this message translates to:
  /// **'Profession'**
  String get profession;

  /// No description provided for @noProfessionsFound.
  ///
  /// In en, this message translates to:
  /// **'No professions found'**
  String get noProfessionsFound;

  /// No description provided for @selectProfession.
  ///
  /// In en, this message translates to:
  /// **'Select Profession'**
  String get selectProfession;

  /// No description provided for @messageNoProfessions.
  ///
  /// In en, this message translates to:
  /// **'Please add a profession before continuing.'**
  String get messageNoProfessions;

  /// No description provided for @currentEmployees.
  ///
  /// In en, this message translates to:
  /// **'Current Employees'**
  String get currentEmployees;

  /// No description provided for @pastEmployees.
  ///
  /// In en, this message translates to:
  /// **'Past Employees'**
  String get pastEmployees;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
