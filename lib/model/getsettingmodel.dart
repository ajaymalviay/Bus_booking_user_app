/// error : false
/// message : "Settings retrieved successfully"
/// data : {"logo":["https://developmentalphawizz.com/bus_booking/uploads/media/2023/Group_92.png"],"privacy_policy":["<p></p><h2 xss=\"removed\"><strong xss=removed>Lorem Ipsum</strong><span xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </span><br></h2>"],"terms_conditions":["<h2 xss=\"removed\"><strong xss=removed>Lorem Ipsum</strong><span xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </span><br></h2>"],"fcm_server_key":["AAAAT-AJq6Y:APA91bH29rMKi8cVs_nFJBn6mY5jED28OI79tRS1kMMYraADECzGtxEY7Ee_CE88VbnkiShJCPlx2QCknpZFCwHEn4bWHHDoOFEXVy92JpxMsFFQ1fyJPL-rwX9s1QDTIoDwbdzZ_cFQ"],"contact_us":["<h2><b>Online_recharge</b><br></h2>"],"about_us":["<p>About us <br></p>"],"currency":["₹"],"time_slot_config":[{"time_slot_config":"1","is_time_slots_enabled":"1","delivery_starts_from":"4","allowed_days":"7"}],"user_data":[null],"system_settings":[{"system_configurations":"1","system_timezone_gmt":"+05:30","system_configurations_id":"13","app_name":"SubkaWallet","support_number":"9876543210","support_email":"subkawallet@gmail.com","current_version":"1.0.0","current_version_ios":"1.0.0","is_version_system_on":"1","area_wise_delivery_charge":"1","currency":"₹","delivery_charge":"10","min_amount":"200","system_timezone":"Asia/Kolkata","is_refer_earn_on":"0","min_refer_earn_order_amount":"","refer_earn_bonus":"","refer_earn_method":"","max_refer_earn_amount":"","refer_earn_bonus_times":"","minimum_cart_amt":"200","low_stock_limit":"5","max_items_cart":"12","delivery_boy_bonus_percentage":"1","max_product_return_days":"1","is_delivery_boy_otp_setting_on":"1","cart_btn_on_list":"0","expand_product_images":"0","tax_name":"","tax_number":"","company_name":"","company_url":""}],"tags":["Display the name of your company in a creative way with PrintStop’s designer rollup standee banner which you can put up on the stands. The standee banners are an important part of a marketing kit to make your presence felt amongst the prospective clients. Using the roll up standee display you can create a brand identity for your company","especially when placed at a proper location.","Buy 3ft x 1ft Banner for Rs. 135\\n\\nBanners are an effective way to communicate your brand’s products and services to the masses. These vinyl banners can be used to promote almost anything. The advancement in the flex banner printing methods has made it possible for you to depict your ideas more effectively. You can now design and print flex banners without hiring a professional for it.","Add a splash of color to your reports and presentations with our online printing services. Delivering a presentation is usually a stressful and nerve-wracking event","the success of which depends on two major factors: content","and its presentation. At PrintStop","we take care of the latter with superior printing services rendering a fine presentation with an elegant finish. \\nImpress your audience with well-designed reports and presentations. Enjoy the success of your online color report printing and climb the workspace ladder. Our state-of-the-art printing services","coupled with excellent processes","ensure the finest online report printing.","PrintStop","the leading company in flyer printing in India","brings you the best event flyer printing services. Promote a new venture or an important occasion with attractive","colorful","and eye-catching flyers.  Choose from single-sided or double-sided flyers","and optimize the placement of your information and graphics. PrintStop’s high-quality promotional flyer printing services ensure that the vibrant consistency of the flyers is maintained throughout the print run.\\n\\nOnline Flyer Maker\\nPrint marketing flyer online by uploading your own flyer design or by getting a custom-made flyer design. We have an in-house team of professional designers dedicated to help you with all your customization needs. The online business flyers service makes it easy for both SME’s and corporates to print flyers at cost-effective prices. Also","use the Price Calculator tab to keep track of your expenditure while ordering.","Capture the success story of your business with PrintStop’s high-quality custom booklet printing services. Present your company’s journey in a fascinating way by printing booklets","an important part of your marketing kit to showcase your highlights. PrintStop ensures superior color printing","secure binding and varied card stock options. Use PrintStop’s booklets to inform valued clients and staff about the praiseworthy achievements of your business.\\nOnline Booklet Printing Service\\n\\nPrintStop\\'s premium quality printing service is the best option for booklet printing online in India. Make and print booklets online on PrintStop’s booklet maker by uploading your preferred design or getting a customized booklet made by Pehchaan","our partners in designing. You can rest assured that the vibrancy of the booklets is maintained with PrintStop’s online booklet printing. You can also use the Price Calculator to keep a realistic tab on your expenses."]}

class Getsettingmodel {
  Getsettingmodel({
      bool? error, 
      String? message, 
      Data? data,}){
    _error = error;
    _message = message;
    _data = data;
}

  Getsettingmodel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _error;
  String? _message;
  Data? _data;
Getsettingmodel copyWith({  bool? error,
  String? message,
  Data? data,
}) => Getsettingmodel(  error: error ?? _error,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// logo : ["https://developmentalphawizz.com/bus_booking/uploads/media/2023/Group_92.png"]
/// privacy_policy : ["<p></p><h2 xss=\"removed\"><strong xss=removed>Lorem Ipsum</strong><span xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </span><br></h2>"]
/// terms_conditions : ["<h2 xss=\"removed\"><strong xss=removed>Lorem Ipsum</strong><span xss=removed> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </span><br></h2>"]
/// fcm_server_key : ["AAAAT-AJq6Y:APA91bH29rMKi8cVs_nFJBn6mY5jED28OI79tRS1kMMYraADECzGtxEY7Ee_CE88VbnkiShJCPlx2QCknpZFCwHEn4bWHHDoOFEXVy92JpxMsFFQ1fyJPL-rwX9s1QDTIoDwbdzZ_cFQ"]
/// contact_us : ["<h2><b>Online_recharge</b><br></h2>"]
/// about_us : ["<p>About us <br></p>"]
/// currency : ["₹"]
/// time_slot_config : [{"time_slot_config":"1","is_time_slots_enabled":"1","delivery_starts_from":"4","allowed_days":"7"}]
/// user_data : [null]
/// system_settings : [{"system_configurations":"1","system_timezone_gmt":"+05:30","system_configurations_id":"13","app_name":"SubkaWallet","support_number":"9876543210","support_email":"subkawallet@gmail.com","current_version":"1.0.0","current_version_ios":"1.0.0","is_version_system_on":"1","area_wise_delivery_charge":"1","currency":"₹","delivery_charge":"10","min_amount":"200","system_timezone":"Asia/Kolkata","is_refer_earn_on":"0","min_refer_earn_order_amount":"","refer_earn_bonus":"","refer_earn_method":"","max_refer_earn_amount":"","refer_earn_bonus_times":"","minimum_cart_amt":"200","low_stock_limit":"5","max_items_cart":"12","delivery_boy_bonus_percentage":"1","max_product_return_days":"1","is_delivery_boy_otp_setting_on":"1","cart_btn_on_list":"0","expand_product_images":"0","tax_name":"","tax_number":"","company_name":"","company_url":""}]
/// tags : ["Display the name of your company in a creative way with PrintStop’s designer rollup standee banner which you can put up on the stands. The standee banners are an important part of a marketing kit to make your presence felt amongst the prospective clients. Using the roll up standee display you can create a brand identity for your company","especially when placed at a proper location.","Buy 3ft x 1ft Banner for Rs. 135\\n\\nBanners are an effective way to communicate your brand’s products and services to the masses. These vinyl banners can be used to promote almost anything. The advancement in the flex banner printing methods has made it possible for you to depict your ideas more effectively. You can now design and print flex banners without hiring a professional for it.","Add a splash of color to your reports and presentations with our online printing services. Delivering a presentation is usually a stressful and nerve-wracking event","the success of which depends on two major factors: content","and its presentation. At PrintStop","we take care of the latter with superior printing services rendering a fine presentation with an elegant finish. \\nImpress your audience with well-designed reports and presentations. Enjoy the success of your online color report printing and climb the workspace ladder. Our state-of-the-art printing services","coupled with excellent processes","ensure the finest online report printing.","PrintStop","the leading company in flyer printing in India","brings you the best event flyer printing services. Promote a new venture or an important occasion with attractive","colorful","and eye-catching flyers.  Choose from single-sided or double-sided flyers","and optimize the placement of your information and graphics. PrintStop’s high-quality promotional flyer printing services ensure that the vibrant consistency of the flyers is maintained throughout the print run.\\n\\nOnline Flyer Maker\\nPrint marketing flyer online by uploading your own flyer design or by getting a custom-made flyer design. We have an in-house team of professional designers dedicated to help you with all your customization needs. The online business flyers service makes it easy for both SME’s and corporates to print flyers at cost-effective prices. Also","use the Price Calculator tab to keep track of your expenditure while ordering.","Capture the success story of your business with PrintStop’s high-quality custom booklet printing services. Present your company’s journey in a fascinating way by printing booklets","an important part of your marketing kit to showcase your highlights. PrintStop ensures superior color printing","secure binding and varied card stock options. Use PrintStop’s booklets to inform valued clients and staff about the praiseworthy achievements of your business.\\nOnline Booklet Printing Service\\n\\nPrintStop\\'s premium quality printing service is the best option for booklet printing online in India. Make and print booklets online on PrintStop’s booklet maker by uploading your preferred design or getting a customized booklet made by Pehchaan","our partners in designing. You can rest assured that the vibrancy of the booklets is maintained with PrintStop’s online booklet printing. You can also use the Price Calculator to keep a realistic tab on your expenses."]

class Data {
  Data({
      List<String>? logo, 
      List<String>? privacyPolicy, 
      List<String>? termsConditions, 
      List<String>? fcmServerKey, 
      List<String>? contactUs, 
      List<String>? aboutUs, 
      List<String>? currency, 
      List<TimeSlotConfig>? timeSlotConfig, 
      List<dynamic>? userData, 
      List<SystemSettings>? systemSettings, 
      List<String>? tags,}){
    _logo = logo;
    _privacyPolicy = privacyPolicy;
    _termsConditions = termsConditions;
    _fcmServerKey = fcmServerKey;
    _contactUs = contactUs;
    _aboutUs = aboutUs;
    _currency = currency;
    _timeSlotConfig = timeSlotConfig;
    _userData = userData;
    _systemSettings = systemSettings;
    _tags = tags;
}

  Data.fromJson(dynamic json) {
    _logo = json['logo'] != null ? json['logo'].cast<String>() : [];
    _privacyPolicy = json['privacy_policy'] != null ? json['privacy_policy'].cast<String>() : [];
    _termsConditions = json['terms_conditions'] != null ? json['terms_conditions'].cast<String>() : [];
    _fcmServerKey = json['fcm_server_key'] != null ? json['fcm_server_key'].cast<String>() : [];
    _contactUs = json['contact_us'] != null ? json['contact_us'].cast<String>() : [];
    _aboutUs = json['about_us'] != null ? json['about_us'].cast<String>() : [];
    _currency = json['currency'] != null ? json['currency'].cast<String>() : [];
    if (json['time_slot_config'] != null) {
      _timeSlotConfig = [];
      json['time_slot_config'].forEach((v) {
        _timeSlotConfig?.add(TimeSlotConfig.fromJson(v));
      });
    }
    if (json['user_data'] != null) {
      _userData = [];
      json['user_data'].forEach((v) {
        _userData?.add(v.fromJson(v));
      });
    }
    if (json['system_settings'] != null) {
      _systemSettings = [];
      json['system_settings'].forEach((v) {
        _systemSettings?.add(SystemSettings.fromJson(v));
      });
    }
    _tags = json['tags'] != null ? json['tags'].cast<String>() : [];
  }
  List<String>? _logo;
  List<String>? _privacyPolicy;
  List<String>? _termsConditions;
  List<String>? _fcmServerKey;
  List<String>? _contactUs;
  List<String>? _aboutUs;
  List<String>? _currency;
  List<TimeSlotConfig>? _timeSlotConfig;
  List<dynamic>? _userData;
  List<SystemSettings>? _systemSettings;
  List<String>? _tags;
Data copyWith({  List<String>? logo,
  List<String>? privacyPolicy,
  List<String>? termsConditions,
  List<String>? fcmServerKey,
  List<String>? contactUs,
  List<String>? aboutUs,
  List<String>? currency,
  List<TimeSlotConfig>? timeSlotConfig,
  List<dynamic>? userData,
  List<SystemSettings>? systemSettings,
  List<String>? tags,
}) => Data(  logo: logo ?? _logo,
  privacyPolicy: privacyPolicy ?? _privacyPolicy,
  termsConditions: termsConditions ?? _termsConditions,
  fcmServerKey: fcmServerKey ?? _fcmServerKey,
  contactUs: contactUs ?? _contactUs,
  aboutUs: aboutUs ?? _aboutUs,
  currency: currency ?? _currency,
  timeSlotConfig: timeSlotConfig ?? _timeSlotConfig,
  userData: userData ?? _userData,
  systemSettings: systemSettings ?? _systemSettings,
  tags: tags ?? _tags,
);
  List<String>? get logo => _logo;
  List<String>? get privacyPolicy => _privacyPolicy;
  List<String>? get termsConditions => _termsConditions;
  List<String>? get fcmServerKey => _fcmServerKey;
  List<String>? get contactUs => _contactUs;
  List<String>? get aboutUs => _aboutUs;
  List<String>? get currency => _currency;
  List<TimeSlotConfig>? get timeSlotConfig => _timeSlotConfig;
  List<dynamic>? get userData => _userData;
  List<SystemSettings>? get systemSettings => _systemSettings;
  List<String>? get tags => _tags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['logo'] = _logo;
    map['privacy_policy'] = _privacyPolicy;
    map['terms_conditions'] = _termsConditions;
    map['fcm_server_key'] = _fcmServerKey;
    map['contact_us'] = _contactUs;
    map['about_us'] = _aboutUs;
    map['currency'] = _currency;
    if (_timeSlotConfig != null) {
      map['time_slot_config'] = _timeSlotConfig?.map((v) => v.toJson()).toList();
    }
    if (_userData != null) {
      map['user_data'] = _userData?.map((v) => v.toJson()).toList();
    }
    if (_systemSettings != null) {
      map['system_settings'] = _systemSettings?.map((v) => v.toJson()).toList();
    }
    map['tags'] = _tags;
    return map;
  }

}

/// system_configurations : "1"
/// system_timezone_gmt : "+05:30"
/// system_configurations_id : "13"
/// app_name : "SubkaWallet"
/// support_number : "9876543210"
/// support_email : "subkawallet@gmail.com"
/// current_version : "1.0.0"
/// current_version_ios : "1.0.0"
/// is_version_system_on : "1"
/// area_wise_delivery_charge : "1"
/// currency : "₹"
/// delivery_charge : "10"
/// min_amount : "200"
/// system_timezone : "Asia/Kolkata"
/// is_refer_earn_on : "0"
/// min_refer_earn_order_amount : ""
/// refer_earn_bonus : ""
/// refer_earn_method : ""
/// max_refer_earn_amount : ""
/// refer_earn_bonus_times : ""
/// minimum_cart_amt : "200"
/// low_stock_limit : "5"
/// max_items_cart : "12"
/// delivery_boy_bonus_percentage : "1"
/// max_product_return_days : "1"
/// is_delivery_boy_otp_setting_on : "1"
/// cart_btn_on_list : "0"
/// expand_product_images : "0"
/// tax_name : ""
/// tax_number : ""
/// company_name : ""
/// company_url : ""

class SystemSettings {
  SystemSettings({
      String? systemConfigurations, 
      String? systemTimezoneGmt, 
      String? systemConfigurationsId, 
      String? appName, 
      String? supportNumber, 
      String? supportEmail, 
      String? currentVersion, 
      String? currentVersionIos, 
      String? isVersionSystemOn, 
      String? areaWiseDeliveryCharge, 
      String? currency, 
      String? deliveryCharge, 
      String? minAmount, 
      String? systemTimezone, 
      String? isReferEarnOn, 
      String? minReferEarnOrderAmount, 
      String? referEarnBonus, 
      String? referEarnMethod, 
      String? maxReferEarnAmount, 
      String? referEarnBonusTimes, 
      String? minimumCartAmt, 
      String? lowStockLimit, 
      String? maxItemsCart, 
      String? deliveryBoyBonusPercentage, 
      String? maxProductReturnDays, 
      String? isDeliveryBoyOtpSettingOn, 
      String? cartBtnOnList, 
      String? expandProductImages, 
      String? taxName, 
      String? taxNumber, 
      String? companyName, 
      String? companyUrl,}){
    _systemConfigurations = systemConfigurations;
    _systemTimezoneGmt = systemTimezoneGmt;
    _systemConfigurationsId = systemConfigurationsId;
    _appName = appName;
    _supportNumber = supportNumber;
    _supportEmail = supportEmail;
    _currentVersion = currentVersion;
    _currentVersionIos = currentVersionIos;
    _isVersionSystemOn = isVersionSystemOn;
    _areaWiseDeliveryCharge = areaWiseDeliveryCharge;
    _currency = currency;
    _deliveryCharge = deliveryCharge;
    _minAmount = minAmount;
    _systemTimezone = systemTimezone;
    _isReferEarnOn = isReferEarnOn;
    _minReferEarnOrderAmount = minReferEarnOrderAmount;
    _referEarnBonus = referEarnBonus;
    _referEarnMethod = referEarnMethod;
    _maxReferEarnAmount = maxReferEarnAmount;
    _referEarnBonusTimes = referEarnBonusTimes;
    _minimumCartAmt = minimumCartAmt;
    _lowStockLimit = lowStockLimit;
    _maxItemsCart = maxItemsCart;
    _deliveryBoyBonusPercentage = deliveryBoyBonusPercentage;
    _maxProductReturnDays = maxProductReturnDays;
    _isDeliveryBoyOtpSettingOn = isDeliveryBoyOtpSettingOn;
    _cartBtnOnList = cartBtnOnList;
    _expandProductImages = expandProductImages;
    _taxName = taxName;
    _taxNumber = taxNumber;
    _companyName = companyName;
    _companyUrl = companyUrl;
}

  SystemSettings.fromJson(dynamic json) {
    _systemConfigurations = json['system_configurations'];
    _systemTimezoneGmt = json['system_timezone_gmt'];
    _systemConfigurationsId = json['system_configurations_id'];
    _appName = json['app_name'];
    _supportNumber = json['support_number'];
    _supportEmail = json['support_email'];
    _currentVersion = json['current_version'];
    _currentVersionIos = json['current_version_ios'];
    _isVersionSystemOn = json['is_version_system_on'];
    _areaWiseDeliveryCharge = json['area_wise_delivery_charge'];
    _currency = json['currency'];
    _deliveryCharge = json['delivery_charge'];
    _minAmount = json['min_amount'];
    _systemTimezone = json['system_timezone'];
    _isReferEarnOn = json['is_refer_earn_on'];
    _minReferEarnOrderAmount = json['min_refer_earn_order_amount'];
    _referEarnBonus = json['refer_earn_bonus'];
    _referEarnMethod = json['refer_earn_method'];
    _maxReferEarnAmount = json['max_refer_earn_amount'];
    _referEarnBonusTimes = json['refer_earn_bonus_times'];
    _minimumCartAmt = json['minimum_cart_amt'];
    _lowStockLimit = json['low_stock_limit'];
    _maxItemsCart = json['max_items_cart'];
    _deliveryBoyBonusPercentage = json['delivery_boy_bonus_percentage'];
    _maxProductReturnDays = json['max_product_return_days'];
    _isDeliveryBoyOtpSettingOn = json['is_delivery_boy_otp_setting_on'];
    _cartBtnOnList = json['cart_btn_on_list'];
    _expandProductImages = json['expand_product_images'];
    _taxName = json['tax_name'];
    _taxNumber = json['tax_number'];
    _companyName = json['company_name'];
    _companyUrl = json['company_url'];
  }
  String? _systemConfigurations;
  String? _systemTimezoneGmt;
  String? _systemConfigurationsId;
  String? _appName;
  String? _supportNumber;
  String? _supportEmail;
  String? _currentVersion;
  String? _currentVersionIos;
  String? _isVersionSystemOn;
  String? _areaWiseDeliveryCharge;
  String? _currency;
  String? _deliveryCharge;
  String? _minAmount;
  String? _systemTimezone;
  String? _isReferEarnOn;
  String? _minReferEarnOrderAmount;
  String? _referEarnBonus;
  String? _referEarnMethod;
  String? _maxReferEarnAmount;
  String? _referEarnBonusTimes;
  String? _minimumCartAmt;
  String? _lowStockLimit;
  String? _maxItemsCart;
  String? _deliveryBoyBonusPercentage;
  String? _maxProductReturnDays;
  String? _isDeliveryBoyOtpSettingOn;
  String? _cartBtnOnList;
  String? _expandProductImages;
  String? _taxName;
  String? _taxNumber;
  String? _companyName;
  String? _companyUrl;
SystemSettings copyWith({  String? systemConfigurations,
  String? systemTimezoneGmt,
  String? systemConfigurationsId,
  String? appName,
  String? supportNumber,
  String? supportEmail,
  String? currentVersion,
  String? currentVersionIos,
  String? isVersionSystemOn,
  String? areaWiseDeliveryCharge,
  String? currency,
  String? deliveryCharge,
  String? minAmount,
  String? systemTimezone,
  String? isReferEarnOn,
  String? minReferEarnOrderAmount,
  String? referEarnBonus,
  String? referEarnMethod,
  String? maxReferEarnAmount,
  String? referEarnBonusTimes,
  String? minimumCartAmt,
  String? lowStockLimit,
  String? maxItemsCart,
  String? deliveryBoyBonusPercentage,
  String? maxProductReturnDays,
  String? isDeliveryBoyOtpSettingOn,
  String? cartBtnOnList,
  String? expandProductImages,
  String? taxName,
  String? taxNumber,
  String? companyName,
  String? companyUrl,
}) => SystemSettings(  systemConfigurations: systemConfigurations ?? _systemConfigurations,
  systemTimezoneGmt: systemTimezoneGmt ?? _systemTimezoneGmt,
  systemConfigurationsId: systemConfigurationsId ?? _systemConfigurationsId,
  appName: appName ?? _appName,
  supportNumber: supportNumber ?? _supportNumber,
  supportEmail: supportEmail ?? _supportEmail,
  currentVersion: currentVersion ?? _currentVersion,
  currentVersionIos: currentVersionIos ?? _currentVersionIos,
  isVersionSystemOn: isVersionSystemOn ?? _isVersionSystemOn,
  areaWiseDeliveryCharge: areaWiseDeliveryCharge ?? _areaWiseDeliveryCharge,
  currency: currency ?? _currency,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  minAmount: minAmount ?? _minAmount,
  systemTimezone: systemTimezone ?? _systemTimezone,
  isReferEarnOn: isReferEarnOn ?? _isReferEarnOn,
  minReferEarnOrderAmount: minReferEarnOrderAmount ?? _minReferEarnOrderAmount,
  referEarnBonus: referEarnBonus ?? _referEarnBonus,
  referEarnMethod: referEarnMethod ?? _referEarnMethod,
  maxReferEarnAmount: maxReferEarnAmount ?? _maxReferEarnAmount,
  referEarnBonusTimes: referEarnBonusTimes ?? _referEarnBonusTimes,
  minimumCartAmt: minimumCartAmt ?? _minimumCartAmt,
  lowStockLimit: lowStockLimit ?? _lowStockLimit,
  maxItemsCart: maxItemsCart ?? _maxItemsCart,
  deliveryBoyBonusPercentage: deliveryBoyBonusPercentage ?? _deliveryBoyBonusPercentage,
  maxProductReturnDays: maxProductReturnDays ?? _maxProductReturnDays,
  isDeliveryBoyOtpSettingOn: isDeliveryBoyOtpSettingOn ?? _isDeliveryBoyOtpSettingOn,
  cartBtnOnList: cartBtnOnList ?? _cartBtnOnList,
  expandProductImages: expandProductImages ?? _expandProductImages,
  taxName: taxName ?? _taxName,
  taxNumber: taxNumber ?? _taxNumber,
  companyName: companyName ?? _companyName,
  companyUrl: companyUrl ?? _companyUrl,
);
  String? get systemConfigurations => _systemConfigurations;
  String? get systemTimezoneGmt => _systemTimezoneGmt;
  String? get systemConfigurationsId => _systemConfigurationsId;
  String? get appName => _appName;
  String? get supportNumber => _supportNumber;
  String? get supportEmail => _supportEmail;
  String? get currentVersion => _currentVersion;
  String? get currentVersionIos => _currentVersionIos;
  String? get isVersionSystemOn => _isVersionSystemOn;
  String? get areaWiseDeliveryCharge => _areaWiseDeliveryCharge;
  String? get currency => _currency;
  String? get deliveryCharge => _deliveryCharge;
  String? get minAmount => _minAmount;
  String? get systemTimezone => _systemTimezone;
  String? get isReferEarnOn => _isReferEarnOn;
  String? get minReferEarnOrderAmount => _minReferEarnOrderAmount;
  String? get referEarnBonus => _referEarnBonus;
  String? get referEarnMethod => _referEarnMethod;
  String? get maxReferEarnAmount => _maxReferEarnAmount;
  String? get referEarnBonusTimes => _referEarnBonusTimes;
  String? get minimumCartAmt => _minimumCartAmt;
  String? get lowStockLimit => _lowStockLimit;
  String? get maxItemsCart => _maxItemsCart;
  String? get deliveryBoyBonusPercentage => _deliveryBoyBonusPercentage;
  String? get maxProductReturnDays => _maxProductReturnDays;
  String? get isDeliveryBoyOtpSettingOn => _isDeliveryBoyOtpSettingOn;
  String? get cartBtnOnList => _cartBtnOnList;
  String? get expandProductImages => _expandProductImages;
  String? get taxName => _taxName;
  String? get taxNumber => _taxNumber;
  String? get companyName => _companyName;
  String? get companyUrl => _companyUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['system_configurations'] = _systemConfigurations;
    map['system_timezone_gmt'] = _systemTimezoneGmt;
    map['system_configurations_id'] = _systemConfigurationsId;
    map['app_name'] = _appName;
    map['support_number'] = _supportNumber;
    map['support_email'] = _supportEmail;
    map['current_version'] = _currentVersion;
    map['current_version_ios'] = _currentVersionIos;
    map['is_version_system_on'] = _isVersionSystemOn;
    map['area_wise_delivery_charge'] = _areaWiseDeliveryCharge;
    map['currency'] = _currency;
    map['delivery_charge'] = _deliveryCharge;
    map['min_amount'] = _minAmount;
    map['system_timezone'] = _systemTimezone;
    map['is_refer_earn_on'] = _isReferEarnOn;
    map['min_refer_earn_order_amount'] = _minReferEarnOrderAmount;
    map['refer_earn_bonus'] = _referEarnBonus;
    map['refer_earn_method'] = _referEarnMethod;
    map['max_refer_earn_amount'] = _maxReferEarnAmount;
    map['refer_earn_bonus_times'] = _referEarnBonusTimes;
    map['minimum_cart_amt'] = _minimumCartAmt;
    map['low_stock_limit'] = _lowStockLimit;
    map['max_items_cart'] = _maxItemsCart;
    map['delivery_boy_bonus_percentage'] = _deliveryBoyBonusPercentage;
    map['max_product_return_days'] = _maxProductReturnDays;
    map['is_delivery_boy_otp_setting_on'] = _isDeliveryBoyOtpSettingOn;
    map['cart_btn_on_list'] = _cartBtnOnList;
    map['expand_product_images'] = _expandProductImages;
    map['tax_name'] = _taxName;
    map['tax_number'] = _taxNumber;
    map['company_name'] = _companyName;
    map['company_url'] = _companyUrl;
    return map;
  }

}

/// time_slot_config : "1"
/// is_time_slots_enabled : "1"
/// delivery_starts_from : "4"
/// allowed_days : "7"

class TimeSlotConfig {
  TimeSlotConfig({
      String? timeSlotConfig, 
      String? isTimeSlotsEnabled, 
      String? deliveryStartsFrom, 
      String? allowedDays,}){
    _timeSlotConfig = timeSlotConfig;
    _isTimeSlotsEnabled = isTimeSlotsEnabled;
    _deliveryStartsFrom = deliveryStartsFrom;
    _allowedDays = allowedDays;
}

  TimeSlotConfig.fromJson(dynamic json) {
    _timeSlotConfig = json['time_slot_config'];
    _isTimeSlotsEnabled = json['is_time_slots_enabled'];
    _deliveryStartsFrom = json['delivery_starts_from'];
    _allowedDays = json['allowed_days'];
  }
  String? _timeSlotConfig;
  String? _isTimeSlotsEnabled;
  String? _deliveryStartsFrom;
  String? _allowedDays;
TimeSlotConfig copyWith({  String? timeSlotConfig,
  String? isTimeSlotsEnabled,
  String? deliveryStartsFrom,
  String? allowedDays,
}) => TimeSlotConfig(  timeSlotConfig: timeSlotConfig ?? _timeSlotConfig,
  isTimeSlotsEnabled: isTimeSlotsEnabled ?? _isTimeSlotsEnabled,
  deliveryStartsFrom: deliveryStartsFrom ?? _deliveryStartsFrom,
  allowedDays: allowedDays ?? _allowedDays,
);
  String? get timeSlotConfig => _timeSlotConfig;
  String? get isTimeSlotsEnabled => _isTimeSlotsEnabled;
  String? get deliveryStartsFrom => _deliveryStartsFrom;
  String? get allowedDays => _allowedDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time_slot_config'] = _timeSlotConfig;
    map['is_time_slots_enabled'] = _isTimeSlotsEnabled;
    map['delivery_starts_from'] = _deliveryStartsFrom;
    map['allowed_days'] = _allowedDays;
    return map;
  }

}