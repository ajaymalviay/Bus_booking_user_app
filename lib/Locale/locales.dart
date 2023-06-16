import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';
import '../Config/app_config.dart';
import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/german.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/romanian.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'fr': french(),
    'id': indonesian(),
    'pt': portuguese(),
    'es': spanish(),
    'tr': turkish(),
    'it': italian(),
    'sw': swahili(),
    "de": german(),
    "ro": romanian(),
  };

  String? get forgotPassword {
    return _localizedValues[locale.languageCode]!['forgotPassword'];
  }

  String? get enterRegPhoneNumber {
    return _localizedValues[locale.languageCode]!['enterRegPhoneNumber'];
  }

  String? get enterPhoneNumber {
    return _localizedValues[locale.languageCode]!['enterPhoneNumber'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get back {
    return _localizedValues[locale.languageCode]!['back'];
  }

  String? get signIn {
    return _localizedValues[locale.languageCode]!['signIn'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }

  String? get forgot {
    return _localizedValues[locale.languageCode]!['forgot'];
  }

  String? get notRegisteredYet {
    return _localizedValues[locale.languageCode]!['notRegisteredYet'];
  }

  String? get registerNow {
    return _localizedValues[locale.languageCode]!['registerNow'];
  }

  String? get registerNownGet {
    return _localizedValues[locale.languageCode]!['registerNownGet'];
  }

  String? get ultimateExpOf {
    return _localizedValues[locale.languageCode]!['ultimateExpOf'];
  }

  String? get quickPaying {
    return _localizedValues[locale.languageCode]!['quickPaying'];
  }

  String? get signUp {
    return _localizedValues[locale.languageCode]!['signUp'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get createPassword {
    return _localizedValues[locale.languageCode]!['createPassword'];
  }

  String? get confirmPassword {
    return _localizedValues[locale.languageCode]!['confirmPassword'];
  }

  String? get phoneVerification {
    return _localizedValues[locale.languageCode]!['phoneVerification'];
  }

  String? get enter6digitcode {
    return _localizedValues[locale.languageCode]!['enter6digitcode'];
  }

  String? get sentOnGivenNum {
    return _localizedValues[locale.languageCode]!['sentOnGivenNum'];
  }

  String? get enterCodeHere {
    return _localizedValues[locale.languageCode]!['enterCodeHere'];
  }

  String? get codeResend {
    return _localizedValues[locale.languageCode]!['codeResend'];
  }

  String? get favorites {
    return _localizedValues[locale.languageCode]!['favorites'];
  }

  String? get notifications {
    return _localizedValues[locale.languageCode]!['notifications'];
  }

  String? get needHelp {
    return _localizedValues[locale.languageCode]!['needHelp'];
  }

  String? get rateUs {
    return _localizedValues[locale.languageCode]!['rateUs'];
  }

  String? get tnc {
    return _localizedValues[locale.languageCode]!['tnc'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }
  String? get profile {
    return _localizedValues[locale.languageCode]!['profile'];
  }

  String? get viewProfile {
    return _localizedValues[locale.languageCode]!['viewProfile'];
  }

  String? get favorited {
    return _localizedValues[locale.languageCode]!['favorited'];
  }

  String? get faq1 {
    return _localizedValues[locale.languageCode]!['faq1'];
  }

  String? get faq2 {
    return _localizedValues[locale.languageCode]!['faq2'];
  }

  String? get faq3 {
    return _localizedValues[locale.languageCode]!['faq3'];
  }

  String? get faq4 {
    return _localizedValues[locale.languageCode]!['faq4'];
  }

  String? get faq5 {
    return _localizedValues[locale.languageCode]!['faq5'];
  }

  String? get faq6 {
    return _localizedValues[locale.languageCode]!['faq6'];
  }

  String? get faq7 {
    return _localizedValues[locale.languageCode]!['faq7'];
  }

  String? get faq8 {
    return _localizedValues[locale.languageCode]!['faq8'];
  }

  String? get help {
    return _localizedValues[locale.languageCode]!['help'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get update {
    return _localizedValues[locale.languageCode]!['update'];
  }

  String? get changePicture {
    return _localizedValues[locale.languageCode]!['changePicture'];
  }

  String? get firstName {
    return _localizedValues[locale.languageCode]!['firstName'];
  }

  String? get lastName {
    return _localizedValues[locale.languageCode]!['lastName'];
  }

  String? get gender {
    return _localizedValues[locale.languageCode]!['gender'];
  }

  String? get male {
    return _localizedValues[locale.languageCode]!['male'];
  }

  String? get dateOfBirth {
    return _localizedValues[locale.languageCode]!['dateOfBirth'];
  }

  String? get not1 {
    return _localizedValues[locale.languageCode]!['not1'];
  }

  String? get not2 {
    return _localizedValues[locale.languageCode]!['not2'];
  }

  String? get not3 {
    return _localizedValues[locale.languageCode]!['not3'];
  }

  String? get not4 {
    return _localizedValues[locale.languageCode]!['not4'];
  }

  String? get daysAgo {
    return _localizedValues[locale.languageCode]!['daysAgo'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get addMoney {
    return _localizedValues[locale.languageCode]!['addMoney'];
  }

  String? get enterAmount {
    return _localizedValues[locale.languageCode]!['enterAmount'];
  }

  String? get havePromo {
    return _localizedValues[locale.languageCode]!['havePromo'];
  }

  String? get balance {
    return _localizedValues[locale.languageCode]!['balance'];
  }

  String? get dealsOfTheDay {
    return _localizedValues[locale.languageCode]!['dealsOfTheDay'];
  }

  String? get bookATicket {
    return _localizedValues[locale.languageCode]!['bookATicket'];
  }

  String? get trainTicket {
    return _localizedValues[locale.languageCode]!['waterbill'];
  }

  String? get flights {
    return _localizedValues[locale.languageCode]!['gasbill'];
  }

  String? get bus {
    return _localizedValues[locale.languageCode]!['bus'];
  }

  String? get from {
    return _localizedValues[locale.languageCode]!['from'];
  }

  String? get to {
    return _localizedValues[locale.languageCode]!['to'];
  }

  String? get departDate {
    return _localizedValues[locale.languageCode]!['departDate'];
  }

  String? get today {
    return _localizedValues[locale.languageCode]!['today'];
  }

  String? get tomorrow {
    return _localizedValues[locale.languageCode]!['tomorrow'];
  }

  String? get ac {
    return _localizedValues[locale.languageCode]!['ac'];
  }

  String? get nonAc {
    return _localizedValues[locale.languageCode]!['nonAc'];
  }

  String? get sleeper {
    return _localizedValues[locale.languageCode]!['sleeper'];
  }

  String? get seater {
    return _localizedValues[locale.languageCode]!['seater'];
  }

  String? get searchTrains {
    return _localizedValues[locale.languageCode]!['searchTrains'];
  }

  String? get oneWay {
    return _localizedValues[locale.languageCode]!['oneWay'];
  }

  String? get roundTrip {
    return _localizedValues[locale.languageCode]!['roundTrip'];
  }

  String? get returnDate {
    return _localizedValues[locale.languageCode]!['returnDate'];
  }

  String? get adult {
    return _localizedValues[locale.languageCode]!['adult'];
  }

  String? get child {
    return _localizedValues[locale.languageCode]!['child'];
  }

  String? get infant {
    return _localizedValues[locale.languageCode]!['infant'];
  }

  String? get classs {
    return _localizedValues[locale.languageCode]!['classs'];
  }

  String? get economy {
    return _localizedValues[locale.languageCode]!['economy'];
  }

  String? get searchFlights {
    return _localizedValues[locale.languageCode]!['searchFlights'];
  }

  String? get searchBuses {
    return _localizedValues[locale.languageCode]!['searchBuses'];
  }

  String? get enterPromo {
    return _localizedValues[locale.languageCode]!['enterPromo'];
  }

  String? get apply {
    return _localizedValues[locale.languageCode]!['apply'];
  }

  String? get offers {
    return _localizedValues[locale.languageCode]!['offers'];
  }

  String? get promo {
    return _localizedValues[locale.languageCode]!['promo'];
  }

  String? get tncApply {
    return _localizedValues[locale.languageCode]!['tncApply'];
  }

  String? get scanThisCode {
    return _localizedValues[locale.languageCode]!['scanThisCode'];
  }

  String? get downloadQrCode {
    return _localizedValues[locale.languageCode]!['downloadQrCode'];
  }

  String? get paymentSuccessful {
    return _localizedValues[locale.languageCode]!['paymentSuccessful'];
  }

  String? get yourBookingConfirmed {
    return _localizedValues[locale.languageCode]!['yourBookingConfirmed'];
  }

  String? get withQuickPay {
    return _localizedValues[locale.languageCode]!['withQuickPay'];
  }

  String? get shareYourBookingDetails {
    return _localizedValues[locale.languageCode]!['shareYourBookingDetails'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get phoneRecharge {
    return _localizedValues[locale.languageCode]!['phoneRecharge'];
  }

  String? get prepaid {
    return _localizedValues[locale.languageCode]!['prepaid'];
  }

  String? get postpaid {
    return _localizedValues[locale.languageCode]!['postpaid'];
  }

  String? get selectOperator {
    return _localizedValues[locale.languageCode]!['selectOperator'];
  }

  String? get amount {
    return _localizedValues[locale.languageCode]!['amount'];
  }

  String? get seePlans {
    return _localizedValues[locale.languageCode]!['seePlans'];
  }

  String? get payViaQuickpay {
    return _localizedValues[locale.languageCode]!['payViaQuickpay'];
  }

  String? get recharge {
    return _localizedValues[locale.languageCode]!['recharge'];
  }

  String? get electricity {
    return _localizedValues[locale.languageCode]!['electricity'];
  }

  String? get flight {
    return _localizedValues[locale.languageCode]!['gasbill'];
  }

  String? get dth {
    return _localizedValues[locale.languageCode]!['dth'];
  }

  String? get broadband {
    return _localizedValues[locale.languageCode]!['broadband'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }

  String? get trainBooking {
    return _localizedValues[locale.languageCode]!['trainBooking'];
  }

  String? get youBroadband {
    return _localizedValues[locale.languageCode]!['youBroadband'];
  }

  String? get buyShirt {
    return _localizedValues[locale.languageCode]!['buyShirt'];
  }

  String? get whatReYouLookingFor {
    return _localizedValues[locale.languageCode]!['whatReYouLookingFor'];
  }

  String? get recentSearches {
    return _localizedValues[locale.languageCode]!['recentSearches'];
  }

  String? get quickLinks {
    return _localizedValues[locale.languageCode]!['quickLinks'];
  }

  String? get saveOnBillPayments {
    return _localizedValues[locale.languageCode]!['saveOnBillPayments'];
  }

  String? get transactions {
    return _localizedValues[locale.languageCode]!['transactions'];
  }

  String? get quickPayBalance {
    return _localizedValues[locale.languageCode]!['quickPayBalance'];
  }

  String? get sendToBank {
    return _localizedValues[locale.languageCode]!['sendToBank'];
  }

  String? get payForOrderOnQuickPay {
    return _localizedValues[locale.languageCode]!['payForOrderOnQuickPay'];
  }

  String? get prepaidRecharge {
    return _localizedValues[locale.languageCode]!['prepaidRecharge'];
  }

  String? get payOrSend {
    return _localizedValues[locale.languageCode]!['payOrSend'];
  }

  String? get getPayment {
    return _localizedValues[locale.languageCode]!['getPayment'];
  }

  String? get quickRechargesBillPays {
    return _localizedValues[locale.languageCode]!['quickRechargesBillPays'];
  }

  String? get product1 {
    return _localizedValues[locale.languageCode]!['product1'];
  }

  String? get spywornSuits {
    return _localizedValues[locale.languageCode]!['spywornSuits'];
  }

  String? get selectSize {
    return _localizedValues[locale.languageCode]!['selectSize'];
  }

  String? get xl {
    return _localizedValues[locale.languageCode]!['xl'];
  }

  String? get selectColor {
    return _localizedValues[locale.languageCode]!['selectColor'];
  }

  String? get lightBlue {
    return _localizedValues[locale.languageCode]!['lightBlue'];
  }

  String? get addToCart {
    return _localizedValues[locale.languageCode]!['addToCart'];
  }

  String? get fashion {
    return _localizedValues[locale.languageCode]!['fashion'];
  }

  String? get electronics {
    return _localizedValues[locale.languageCode]!['electronics'];
  }

  String? get phones {
    return _localizedValues[locale.languageCode]!['phones'];
  }

  String? get devices {
    return _localizedValues[locale.languageCode]!['devices'];
  }

  String? get appliances {
    return _localizedValues[locale.languageCode]!['appliances'];
  }

  String? get beauty {
    return _localizedValues[locale.languageCode]!['beauty'];
  }

  String? get sports {
    return _localizedValues[locale.languageCode]!['sports'];
  }

  String? get searchProduct {
    return _localizedValues[locale.languageCode]!['searchProduct'];
  }

  String? get shopByCategories {
    return _localizedValues[locale.languageCode]!['shopByCategories'];
  }

  String? get mensClothing {
    return _localizedValues[locale.languageCode]!['mensClothing'];
  }

  String? get shirts {
    return _localizedValues[locale.languageCode]!['shirts'];
  }

  String? get tShirts {
    return _localizedValues[locale.languageCode]!['tShirts'];
  }

  String? get jeans {
    return _localizedValues[locale.languageCode]!['jeans'];
  }

  String? get trousers {
    return _localizedValues[locale.languageCode]!['trousers'];
  }

  String? get pants {
    return _localizedValues[locale.languageCode]!['pants'];
  }

  String? get shorts {
    return _localizedValues[locale.languageCode]!['shorts'];
  }

  String? get womensClothing {
    return _localizedValues[locale.languageCode]!['womensClothing'];
  }

  String? get kidsClothing {
    return _localizedValues[locale.languageCode]!['kidsClothing'];
  }

  String? get footwear {
    return _localizedValues[locale.languageCode]!['footwear'];
  }

  String? get accessories {
    return _localizedValues[locale.languageCode]!['accessories'];
  }

  String? get jewellery {
    return _localizedValues[locale.languageCode]!['jewellery'];
  }

  String? get cat1 {
    return _localizedValues[locale.languageCode]!['cat1'];
  }

  String? get cat2 {
    return _localizedValues[locale.languageCode]!['cat2'];
  }

  String? get cat3 {
    return _localizedValues[locale.languageCode]!['cat3'];
  }

  String? get cat4 {
    return _localizedValues[locale.languageCode]!['cat4'];
  }

  String? get cat5 {
    return _localizedValues[locale.languageCode]!['cat5'];
  }

  String? get cat6 {
    return _localizedValues[locale.languageCode]!['cat6'];
  }

  String? get myOrders {
    return _localizedValues[locale.languageCode]!['myOrders'];
  }

  String? get all {
    return _localizedValues[locale.languageCode]!['all'];
  }

  String? get tickets {
    return _localizedValues[locale.languageCode]!['tickets'];
  }

  String? get bill {
    return _localizedValues[locale.languageCode]!['bill'];
  }

  String? get rechargeDone {
    return _localizedValues[locale.languageCode]!['rechargeDone'];
  }

  String? get orderedSuccessful {
    return _localizedValues[locale.languageCode]!['orderedSuccessful'];
  }

  String? get electricityBillPaid {
    return _localizedValues[locale.languageCode]!['electricityBillPaid'];
  }

  String? get orderNum {
    return _localizedValues[locale.languageCode]!['orderNum'];
  }

  String? get scanQrCode {
    return _localizedValues[locale.languageCode]!['scanQrCode'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get mall {
    return _localizedValues[locale.languageCode]!['mall'];
  }

  String? get scan {
    return _localizedValues[locale.languageCode]!['scan'];
  }

  String? get orders {
    return _localizedValues[locale.languageCode]!['orders'];
  }

  String? get cashBackEveryHour {
    return _localizedValues[locale.languageCode]!['cashBackEveryHour'];
  }

  String? get getCashbackEveryHour {
    return _localizedValues[locale.languageCode]!['getCashbackEveryHour'];
  }

  String? get knowMore {
    return _localizedValues[locale.languageCode]!['knowMore'];
  }

  String? get quick {
    return _localizedValues[locale.languageCode]!['quick'];
  }

  String? get pay {
    return _localizedValues[locale.languageCode]!['pay'];
  }

  String? get winterSale {
    return _localizedValues[locale.languageCode]!['winterSale'];
  }

  String? get flat50Off {
    return _localizedValues[locale.languageCode]!['flat50Off'];
  }

  String? get shopNow {
    return _localizedValues[locale.languageCode]!['shopNow'];
  }

  String? get spywornCottonShirt {
    return _localizedValues[locale.languageCode]!['spywornCottonShirt'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['englishh'];
  }

  String? get spanishh {
    return _localizedValues[locale.languageCode]!['spanishh'];
  }

  String? get portuguesee {
    return _localizedValues[locale.languageCode]!['portuguesee'];
  }

  String? get frenchh {
    return _localizedValues[locale.languageCode]!['frenchh'];
  }

  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabicc'];
  }

  String? get indonesiann {
    return _localizedValues[locale.languageCode]!['indonesiann'];
  }

  String? get languages {
    return _localizedValues[locale.languageCode]!['languages'];
  }

  String? get selectPreferredLanguage {
    return _localizedValues[locale.languageCode]!['selectPreferredLanguage'];
  }

  String? get save {
    return _localizedValues[locale.languageCode]!['save'];
  }

  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in AppConfig.languagesSupported.keys) {
      toReturn.add(Locale(langCode));
    }
    return toReturn;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppConfig.languagesSupported.keys.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
