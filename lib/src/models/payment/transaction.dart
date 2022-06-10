import 'package:pawcastle_datamodels/src/status/usertype.enum.dart';

class PaymentTransaction {
  final String id;
  final String userId;
  final UserType userType;
  final String amount;
  final String timestamp;
  final String fundAccount;
  final String? payoutId;
  final String? errorMsg;

  const PaymentTransaction({
    required this.id,
    required this.userId,
    required this.userType,
    required this.amount,
    required this.timestamp,
    required this.fundAccount,
    this.payoutId,
    this.errorMsg,
  });

  PaymentTransaction copyWith({
    String? id,
    String? userId,
    UserType? userType,
    String? amount,
    String? timestamp,
    String? fundAccount,
    String? payoutId,
    String? errorMsg,
  }) {
    return PaymentTransaction(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      userType: userType ?? this.userType,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      fundAccount: fundAccount ?? this.fundAccount,
      payoutId: payoutId ?? this.payoutId,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'userType': userType.toMap(),
      'amount': amount,
      'timestamp': timestamp,
      'fundAccount': fundAccount,
      'payoutId': payoutId,
      'errorMsg': errorMsg,
    };
  }

  factory PaymentTransaction.fromMap(Map<String, dynamic> map) {
    return PaymentTransaction(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      userType: UserType.doctor.fromMap(map['userType']),
      amount: map['amount'] ?? '',
      timestamp: map['timestamp'] ?? '',
      fundAccount: map['fundAccount'] ?? '',
      payoutId: map['payoutId'],
      errorMsg: map['errorMsg'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentTransaction &&
        other.id == id &&
        other.userId == userId &&
        other.userType == userType &&
        other.amount == amount &&
        other.timestamp == timestamp &&
        other.fundAccount == fundAccount &&
        other.payoutId == payoutId &&
        other.errorMsg == errorMsg;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        userType.hashCode ^
        amount.hashCode ^
        timestamp.hashCode ^
        fundAccount.hashCode ^
        payoutId.hashCode ^
        errorMsg.hashCode;
  }

  @override
  String toString() {
    return 'PaymentTransaction(id: $id, userId: $userId, userType: $userType, amount: $amount, timestamp: $timestamp, fundAccount: $fundAccount, payoutId: $payoutId, errorMsg: $errorMsg)';
  }
}
