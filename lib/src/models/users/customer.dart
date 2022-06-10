import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:pawcastle_datamodels/src/models/order/address.dart';

class Customer {
  final String id;
  final String name;
  final String phone;
  final List<Address> addresses;
  final String? fcmToken;
  final DocumentReference? reference;

  const Customer({
    required this.id,
    required this.name,
    required this.phone,
    required this.addresses,
    this.fcmToken,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'addresses': addresses.map((x) => x.toMap()).toList(),
      '_notification': fcmToken,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Customer(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      fcmToken: map['_notification'],
      reference: reference,
      addresses:
          List<Address>.from(map['addresses']?.map((x) => Address.fromMap(x))),
    );
  }

  factory Customer.fromSnapshot(DocumentSnapshot snapshot) {
    return Customer.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    List<Address>? addresses,
    String? fcmToken,
    DocumentReference? reference,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      addresses: addresses ?? this.addresses,
      fcmToken: fcmToken ?? this.fcmToken,
      reference: reference ?? this.reference,
    );
  }

  @override
  String toString() {
    return 'Customer(id: $id, name: $name, phone: $phone, addresses: $addresses, fcmToken: $fcmToken, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        listEquals(other.addresses, addresses) &&
        other.fcmToken == fcmToken &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        addresses.hashCode ^
        fcmToken.hashCode ^
        reference.hashCode;
  }
}
