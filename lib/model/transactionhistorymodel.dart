/// error : false
/// message : "Transactions Retrieved Successfully"
/// total : "5"
/// data : [{"id":"63","transaction_type":"transaction","user_id":"7","order_id":"85","type":"razorpay","txn_id":"pay_InVMDgFStLcHIA","payu_txn_id":null,"amount":"890","status":"Success","currency_code":null,"service_type":"DTH Bill","payer_email":null,"message":"Order Placed Successfully","transaction_date":"2022-01-24 13:27:42","date_created":"2022-03-29"},{"id":"59","transaction_type":"transaction","user_id":"7","order_id":"84","type":"razorpay","txn_id":"pay_InURevyi1fYglf","payu_txn_id":null,"amount":"150","status":"Success","currency_code":null,"service_type":"DTH Bill","payer_email":null,"message":"Order Placed Successfully","transaction_date":"2022-01-24 12:34:10","date_created":"2022-03-29"},{"id":"58","transaction_type":"transaction","user_id":"7","order_id":"83","type":"razorpay","txn_id":"pay_InU1mlJvtMQgq3","payu_txn_id":null,"amount":"657","status":"Success","currency_code":null,"service_type":"Gas Bill","payer_email":null,"message":"Order Placed Successfully","transaction_date":"2022-01-24 12:09:39","date_created":"2022-03-29"},{"id":"57","transaction_type":"transaction","user_id":"7","order_id":"82","type":"razorpay","txn_id":"pay_InU0uKHo0ueG8z","payu_txn_id":null,"amount":"1130.56","status":"Success","currency_code":null,"service_type":"DTH Bill","payer_email":null,"message":"Order Placed Successfully","transaction_date":"2022-01-24 12:08:50","date_created":"2022-03-29"},{"id":"56","transaction_type":"transaction","user_id":"7","order_id":"81","type":"razorpay","txn_id":"pay_InTyGP3XBhys7Q","payu_txn_id":null,"amount":"762.56","status":"Success","currency_code":null,"service_type":"Gas Bill","payer_email":null,"message":"Order Placed Successfully","transaction_date":"2022-01-24 12:06:20","date_created":"2022-01-24"}]

class Transactionhistorymodel {
  Transactionhistorymodel({
      bool? error, 
      String? message, 
      String? total, 
      List<Data>? data,}){
    _error = error;
    _message = message;
    _total = total;
    _data = data;
}

  Transactionhistorymodel.fromJson(dynamic json) {
    _error = json['error'];
    _message = json['message'];
    _total = json['total'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _error;
  String? _message;
  String? _total;
  List<Data>? _data;
Transactionhistorymodel copyWith({  bool? error,
  String? message,
  String? total,
  List<Data>? data,
}) => Transactionhistorymodel(  error: error ?? _error,
  message: message ?? _message,
  total: total ?? _total,
  data: data ?? _data,
);
  bool? get error => _error;
  String? get message => _message;
  String? get total => _total;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    map['message'] = _message;
    map['total'] = _total;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "63"
/// transaction_type : "transaction"
/// user_id : "7"
/// order_id : "85"
/// type : "razorpay"
/// txn_id : "pay_InVMDgFStLcHIA"
/// payu_txn_id : null
/// amount : "890"
/// status : "Success"
/// currency_code : null
/// service_type : "DTH Bill"
/// payer_email : null
/// message : "Order Placed Successfully"
/// transaction_date : "2022-01-24 13:27:42"
/// date_created : "2022-03-29"

class Data {
  Data({
      String? id, 
      String? transactionType, 
      String? userId, 
      String? orderId, 
      String? type, 
      String? txnId, 
      dynamic payuTxnId, 
      String? amount, 
      String? status, 
      dynamic currencyCode, 
      String? serviceType, 
      dynamic payerEmail, 
      String? message, 
      String? transactionDate, 
      String? dateCreated,}){
    _id = id;
    _transactionType = transactionType;
    _userId = userId;
    _orderId = orderId;
    _type = type;
    _txnId = txnId;
    _payuTxnId = payuTxnId;
    _amount = amount;
    _status = status;
    _currencyCode = currencyCode;
    _serviceType = serviceType;
    _payerEmail = payerEmail;
    _message = message;
    _transactionDate = transactionDate;
    _dateCreated = dateCreated;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _transactionType = json['transaction_type'];
    _userId = json['user_id'];
    _orderId = json['order_id'];
    _type = json['type'];
    _txnId = json['txn_id'];
    _payuTxnId = json['payu_txn_id'];
    _amount = json['amount'];
    _status = json['status'];
    _currencyCode = json['currency_code'];
    _serviceType = json['service_type'];
    _payerEmail = json['payer_email'];
    _message = json['message'];
    _transactionDate = json['transaction_date'];
    _dateCreated = json['date_created'];
  }
  String? _id;
  String? _transactionType;
  String? _userId;
  String? _orderId;
  String? _type;
  String? _txnId;
  dynamic _payuTxnId;
  String? _amount;
  String? _status;
  dynamic _currencyCode;
  String? _serviceType;
  dynamic _payerEmail;
  String? _message;
  String? _transactionDate;
  String? _dateCreated;
Data copyWith({  String? id,
  String? transactionType,
  String? userId,
  String? orderId,
  String? type,
  String? txnId,
  dynamic payuTxnId,
  String? amount,
  String? status,
  dynamic currencyCode,
  String? serviceType,
  dynamic payerEmail,
  String? message,
  String? transactionDate,
  String? dateCreated,
}) => Data(  id: id ?? _id,
  transactionType: transactionType ?? _transactionType,
  userId: userId ?? _userId,
  orderId: orderId ?? _orderId,
  type: type ?? _type,
  txnId: txnId ?? _txnId,
  payuTxnId: payuTxnId ?? _payuTxnId,
  amount: amount ?? _amount,
  status: status ?? _status,
  currencyCode: currencyCode ?? _currencyCode,
  serviceType: serviceType ?? _serviceType,
  payerEmail: payerEmail ?? _payerEmail,
  message: message ?? _message,
  transactionDate: transactionDate ?? _transactionDate,
  dateCreated: dateCreated ?? _dateCreated,
);
  String? get id => _id;
  String? get transactionType => _transactionType;
  String? get userId => _userId;
  String? get orderId => _orderId;
  String? get type => _type;
  String? get txnId => _txnId;
  dynamic get payuTxnId => _payuTxnId;
  String? get amount => _amount;
  String? get status => _status;
  dynamic get currencyCode => _currencyCode;
  String? get serviceType => _serviceType;
  dynamic get payerEmail => _payerEmail;
  String? get message => _message;
  String? get transactionDate => _transactionDate;
  String? get dateCreated => _dateCreated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['transaction_type'] = _transactionType;
    map['user_id'] = _userId;
    map['order_id'] = _orderId;
    map['type'] = _type;
    map['txn_id'] = _txnId;
    map['payu_txn_id'] = _payuTxnId;
    map['amount'] = _amount;
    map['status'] = _status;
    map['currency_code'] = _currencyCode;
    map['service_type'] = _serviceType;
    map['payer_email'] = _payerEmail;
    map['message'] = _message;
    map['transaction_date'] = _transactionDate;
    map['date_created'] = _dateCreated;
    return map;
  }

}