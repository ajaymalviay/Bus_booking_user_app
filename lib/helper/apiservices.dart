import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://comforttourandtravels.com/api/";
  // static const String baseUrl = "https://developmentalphawizz.com/bus_booking/api/";
  static const String imageUrl = "https://developmentalphawizz.com/bus_booking/";

    static const String userRegister = baseUrl+'user_register';
  static const String login = baseUrl+'login';
  static const String verifyOtp = baseUrl+'v_verify_otp';
  static const String getSlider = baseUrl + 'get_banners';
  static const String getUserProfile = baseUrl+'get_profile';
  static const String getNotification = baseUrl+'get_notifications';
  static const String getSettings = baseUrl+'get_settings';
  static const String getUpdateUser = baseUrl+'user_update';
  static const String getServices = baseUrl+'get_service';
  static const String getPrivacyPolicy = baseUrl+'pages/privacy_policy';
  static const String getLocationSearch = baseUrl+'get_location';
  static const String searchBusAvailable = baseUrl+'search_available_busses';
  static const String busDetail = baseUrl+'bus_details';
  static const String pickupDrop = baseUrl+'pickup_drop_points';
  static const String bookTicket = baseUrl+'ticket_booking';
  static const String bookings = baseUrl+'bookings';
}
