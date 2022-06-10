import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pawcastle_datamodels/pawcastle_datamodels.dart';

class Repayment {
  final String id;
  final String userId;
  final String amount;
  final String timestamp;
  final RepaymentStatus status;
  final String? orderId;
  final String? paymentId; // if true, payment is done

  final DocumentReference? reference;

  const Repayment({
    required this.id,
    required this.userId,
    required this.amount,
    required this.timestamp,
    required this.status,
    this.orderId,
    this.paymentId,
    this.reference,
  });

  Repayment copyWith({
    String? id,
    String? userId,
    String? amount,
    String? timestamp,
    String? orderId,
    String? paymentId,
    RepaymentStatus? status,
    DocumentReference? reference,
  }) {
    return Repayment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      orderId: orderId ?? this.orderId,
      paymentId: paymentId ?? this.paymentId,
      reference: reference ?? this.reference,
    );
  }

  factory Repayment.fromSnapshot(DocumentSnapshot snapshot) {
    return Repayment.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'timestamp': timestamp,
      'orderId': orderId,
      'paymentId': paymentId,
      'status': status.toMap()
    };
  }

  factory Repayment.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Repayment(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      amount: map['amount'] ?? '',
      timestamp: map['timestamp'] ?? '',
      orderId: map['orderId'],
      paymentId: map['paymentId'],
      status: RepaymentStatus.paid.fromMap(map['status']),
      reference: reference,
    );
  }

  @override
  String toString() {
    return 'Repayment(id: $id, userId: $userId, amount: $amount, timestamp: $timestamp, status: $status, orderId: $orderId, paymentId: $paymentId)';
  }
}
