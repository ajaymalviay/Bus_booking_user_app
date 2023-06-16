import 'package:flutter/material.dart';
import 'package:quick_pay/Auth/login_navigator.dart';
import 'package:quick_pay/BottomNavigation/Account/favourites_page.dart';
import 'package:quick_pay/BottomNavigation/Account/help_page.dart';
import 'package:quick_pay/BottomNavigation/Account/language_choose.dart';
import 'package:quick_pay/BottomNavigation/Account/notifications_page.dart';
import 'package:quick_pay/BottomNavigation/Account/tnc.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/add_money.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/enter_promocode_page.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/get_payment.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/payment_successful.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/phone_recharge.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/search_page.dart';
import 'package:quick_pay/BottomNavigation/Home/Pages/transactions_page.dart';
import 'package:quick_pay/BottomNavigation/Home/home.dart';
import 'package:quick_pay/BottomNavigation/Mall/item_info.dart';
import 'package:quick_pay/BottomNavigation/Mall/mens_clothing.dart';
import 'package:quick_pay/BottomNavigation/Mall/shop_by_categories.dart';
import 'package:quick_pay/BottomNavigation/Orders/my_orders.dart';
import 'package:quick_pay/BottomNavigation/Scan/scan_page.dart';
import 'package:quick_pay/BottomNavigation/bottom_navigation.dart';
import 'package:quick_pay/BottomNavigation/Account/my_profile.dart';

class PageRoutes {
  static const String homePage = 'home_page';
  static const String bottomNavigation = 'bottom_navigation';
  static const String scanPage = 'scan_page';
  static const String addMoneyPage = 'add_money';
  static const String getPaymentPage = 'get_payment';
  static const String phoneRechargePage = 'phone_recharge';
  static const String transactionPage = 'transactions_page';
  static const String enterPromoCodePage = 'enter_promo_code_page';
  // static const String bookTicketPage = 'book_train_ticket';
  static const String paymentSuccessfulPage = 'payment_successful_page';
  static const String shopByCategories = 'shop_by_categories';
  static const String mensClothing = 'mens_clothing';
  static const String itemInfoPage = 'item_info';
  static const String myOrdersPage = 'my_orders_page';
  static const String myProfilePage = 'my_profile_page';
  static const String favouritesPage = 'favourites_page';
  static const String notificationsPage = 'notifications_page';
  static const String helpPage = 'help_page';
  static const String tncPage = 'tnc_page';
  static const String searchPage = 'search_page';
  static const String chooseLanguage = 'choose_language';
  static const String loginNavigator = 'login_navigator';

  Map<String, WidgetBuilder> routes() {
    return {
      homePage: (context) => HomePage(),
      // bottomNavigation: (context) => AppNavigation(),
      scanPage: (context) => ScanQRPage(),
      addMoneyPage: (context) => AddMoneyUI(),
      // getPaymentPage: (context) => GetPaymentPage(),
      phoneRechargePage: (context) => PhoneRechargePage(),
      transactionPage: (context) => TransactionPage(),
      enterPromoCodePage: (context) => EnterPromoCodePage(),
      // bookTicketPage: (context) => BookTicket(),
      paymentSuccessfulPage: (context) => PaymentSuccessfulPage(),
      shopByCategories: (context) => ShopByCategories(),
      mensClothing: (context) => MensClothing(),
      itemInfoPage: (context) => ItemInfoPage(),
      myOrdersPage: (context) => MyOrdersPage(),
      myProfilePage: (context) => MyProfilePage(),
      favouritesPage: (context) => MyBookingsPage(),
      notificationsPage: (context) => NotificationsPage(),
      helpPage: (context) => NeedHelpPage(),
      tncPage: (context) => TncPage(),
      searchPage: (context) => SearchPage(),
      chooseLanguage: (context) => ChooseLanguage(),
      loginNavigator: (context) => LoginNavigator(),
    };
  }
}
