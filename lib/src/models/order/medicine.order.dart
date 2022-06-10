import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pawcastle_datamodels/src/models/consult/medicine.dart';
import 'package:pawcastle_datamodels/src/models/payment/order.dart';
import 'package:pawcastle_datamodels/src/models/users/user.dart';
import 'package:pawcastle_datamodels/src/status/order.status.dart';

class MedicineOrder {
  final String id;
  final String caseId;
  final AuthUser customer;
  final AuthUser doctor;
  final AuthUser merchant;

  /// driver will be assigned when status changed to `ready`
  final AuthUser? driver;
  final List<Medicine> items;
  final RazorpayOrder? payment;
  final MedicineOrderStatus status;
  final MedicineOrderAmount? amount;
  final String timestamp;
  final bool isCod;
  final bool isPickup;
  final DocumentReference? reference;

  const MedicineOrder({
    required this.id,
    required this.caseId,
    required this.customer,
    required this.doctor,
    required this.merchant,
    this.driver,
    required this.items,
    this.payment,
    required this.status,
    this.amount,
    this.reference,
    required this.timestamp,
    this.isCod = false,
    this.isPickup = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caseId': caseId,
      'customer': customer.toMap(),
      'doctor': doctor.toMap(),
      'merchant': merchant.toMap(),
      'driver': driver?.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
      'payment': payment?.toMap(),
      'status': status.toMap,
      'amount': amount?.toMap(),
      'timestamp': timestamp,
      'isCod': isCod,
      'isPickup': isPickup,
    };
  }

  factory MedicineOrder.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return MedicineOrder(
        id: map['id'] ?? '',
        caseId: map['caseId'] ?? '',
        customer: AuthUser.fromMap(map['customer']),
        doctor: AuthUser.fromMap(map['doctor']),
        merchant: AuthUser.fromMap(map['merchant']),
        driver: map['driver'] != null ? AuthUser.fromMap(map['driver']) : null,
        items:
            List<Medicine>.from(map['items']?.map((x) => Medicine.fromMap(x))),
        payment: map['payment'] != null
            ? RazorpayOrder.fromMap(map['payment'])
            : null,
        status: MedicineOrderStatus.created.fromMap(map['status']),
        amount: map['amount'] != null
            ? MedicineOrderAmount.fromMap(map['amount'])
            : null,
        timestamp: map['timestamp'] ?? '',
        isCod: map['isCod'] ?? false,
        isPickup: map['isPickup'] ?? false,
        reference: reference);
  }

  MedicineOrder copyWith({
    String? id,
    String? caseId,
    AuthUser? customer,
    AuthUser? doctor,
    AuthUser? merchant,
    AuthUser? driver,
    List<Medicine>? items,
    RazorpayOrder? payment,
    MedicineOrderStatus? status,
    MedicineOrderAmount? amount,
    String? timestamp,
    bool? isCod,
    bool? isPickup,
    DocumentReference? reference,
  }) {
    return MedicineOrder(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      customer: customer ?? this.customer,
      doctor: doctor ?? this.doctor,
      merchant: merchant ?? this.merchant,
      driver: driver ?? this.driver,
      items: items ?? this.items,
      payment: payment ?? this.payment,
      status: status ?? this.status,
      amount: amount ?? this.amount,
      timestamp: timestamp ?? this.timestamp,
      isCod: isCod ?? this.isCod,
      isPickup: isPickup ?? this.isPickup,
      reference: reference ?? this.reference,
    );
  }

  factory MedicineOrder.fromSnapshot(DocumentSnapshot snapshot) {
    return MedicineOrder.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  @override
  String toString() {
    return 'MedicineOrder(id: $id, caseId: $caseId, customer: $customer, doctor: $doctor, merchant: $merchant, driver: $driver, items: $items, payment: $payment, status: $status, amount: $amount, timestamp: $timestamp, isCod: $isCod, isPickup: $isPickup, reference: $reference)';
  }
}

class MedicineOrderAmount {
  final String pharmacy;
  final String doctor;
  final String delivery;
  final String org;

  const MedicineOrderAmount({
    required this.pharmacy,
    required this.doctor,
    required this.delivery,
    required this.org,
  });

  Map<String, dynamic> toMap() {
    return {
      'pharmacy': pharmacy,
      'doctor': doctor,
      'delivery': delivery,
      'org': org,
    };
  }

  factory MedicineOrderAmount.fromMap(Map<String, dynamic> map) {
    return MedicineOrderAmount(
      pharmacy: map['pharmacy'] ?? '',
      doctor: map['doctor'] ?? '',
      delivery: map['delivery'] ?? '',
      org: map['org'] ?? '',
    );
  }

  MedicineOrderAmount copyWith({
    String? pharmacy,
    String? doctor,
    String? delivery,
    String? org,
  }) {
    return MedicineOrderAmount(
      pharmacy: pharmacy ?? this.pharmacy,
      doctor: doctor ?? this.doctor,
      delivery: delivery ?? this.delivery,
      org: org ?? this.org,
    );
  }

  @override
  String toString() {
    return 'MedicineOrderAmount(pharmacy: $pharmacy, doctor: $doctor, delivery: $delivery, org: $org)';
  }
}
