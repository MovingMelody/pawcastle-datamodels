import 'package:pawcastle_datamodels/pawcastle_datamodels.dart';

class Payout {
  final String id;
  final String userId;
  final String status;
  final int amount;
  final int timestamp;

  const Payout({
    required this.id,
    required this.userId,
    required this.status,
    required this.amount,
    required this.timestamp,
  });

  Payout copyWith({
    String? id,
    String? userId,
    String? status,
    int? amount,
    int? timestamp,
  }) {
    return Payout(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reference_id': userId,
      'status': status,
      'amount': amount,
      'created_at': timestamp,
    };
  }

  factory Payout.fromMap(Map<String, dynamic> map) {
    return Payout(
      id: map['id'] ?? '',
      userId: map['reference_id'] ?? '',
      status: map['status'] ?? '',
      amount: map['amount'] ?? '',
      timestamp: map['created_at'] ?? '',
    );
  }

  factory Payout.fromSettlement(PaymentTransaction transaction,
      {String? status}) {
    return Payout(
      id: transaction.id,
      userId: transaction.userId,
      status: status ?? "failed",
      amount: int.parse(transaction.amount),
      timestamp: int.parse(transaction.timestamp),
    );
  }

  @override
  String toString() {
    return 'Payout(id: $id, userId: $userId, status: $status, amount: $amount, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Payout &&
        other.id == id &&
        other.userId == userId &&
        other.status == status &&
        other.amount == amount &&
        other.timestamp == timestamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        status.hashCode ^
        amount.hashCode ^
        timestamp.hashCode;
  }
}
