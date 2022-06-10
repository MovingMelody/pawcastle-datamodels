import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:pawcastle_datamodels/pawcastle_datamodels.dart';

class TreatmentPatient {
  final String id;
  final String name;
  final String location;
  final String species;
  final String phone;
  final String fcmToken;
  final UserPosition position;

  const TreatmentPatient({
    required this.id,
    required this.name,
    required this.location,
    required this.species,
    required this.phone,
    required this.fcmToken,
    required this.position,
  });

  factory TreatmentPatient.fromUser(Customer user) {
    return TreatmentPatient(
      id: user.id,
      name: user.name,
      location:
          "${user.addresses.first.city}, ${user.addresses.first.district}",
      species: user.id,
      position: user.addresses[0].position,
      phone: user.phone,
      fcmToken: user.fcmToken ?? "",
    );
  }

  TreatmentPatient copyWith({
    String? id,
    String? name,
    String? location,
    String? species,
    String? phone,
    String? fcmToken,
    UserPosition? position,
  }) {
    return TreatmentPatient(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      species: species ?? this.species,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'species': species,
      'phone': phone,
      'fcmToken': fcmToken,
      'position': position.toMap(),
    };
  }

  factory TreatmentPatient.fromMap(Map<String, dynamic> map) {
    return TreatmentPatient(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      species: map['species'] ?? '',
      phone: map['phone'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
      position: UserPosition.fromMap(map['position']),
    );
  }

  @override
  String toString() {
    return 'TreatmentPatient(id: $id, name: $name, location: $location, species: $species, phone: $phone, fcmToken: $fcmToken, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TreatmentPatient &&
        other.id == id &&
        other.name == name &&
        other.location == location &&
        other.species == species &&
        other.phone == phone &&
        other.fcmToken == fcmToken &&
        other.position == position;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        location.hashCode ^
        species.hashCode ^
        phone.hashCode ^
        fcmToken.hashCode ^
        position.hashCode;
  }
}

class TreatmentDoctor {
  final String id;
  final String name;
  final String image;
  final String designation;
  final String phone;
  final String fcmToken;

  const TreatmentDoctor({
    required this.id,
    required this.name,
    required this.image,
    required this.designation,
    required this.phone,
    required this.fcmToken,
  });

  factory TreatmentDoctor.fromDoctor(Doctor doctor) {
    return TreatmentDoctor(
        id: doctor.id,
        name: doctor.name,
        phone: doctor.phone,
        image: doctor.image,
        fcmToken: doctor.fcmToken ?? "",
        designation: doctor.profile.designation);
  }

  TreatmentDoctor copyWith({
    String? id,
    String? name,
    String? image,
    String? designation,
    String? phone,
    String? fcmToken,
  }) {
    return TreatmentDoctor(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      designation: designation ?? this.designation,
      phone: phone ?? this.phone,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'designation': designation,
      'phone': phone,
      'fcmToken': fcmToken,
    };
  }

  factory TreatmentDoctor.fromMap(Map<String, dynamic> map) {
    return TreatmentDoctor(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      designation: map['designation'] ?? '',
      phone: map['phone'] ?? '',
      fcmToken: map['fcmToken'] ?? '',
    );
  }

  @override
  String toString() {
    return 'TreatmentDoctor(id: $id, name: $name, image: $image, designation: $designation, phone: $phone, fcmToken: $fcmToken)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TreatmentDoctor &&
        other.id == id &&
        other.name == name &&
        other.image == image &&
        other.designation == designation &&
        other.phone == phone &&
        other.fcmToken == fcmToken;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        image.hashCode ^
        designation.hashCode ^
        phone.hashCode ^
        fcmToken.hashCode;
  }
}

class Treatment {
  final String id;
  final TreatmentPatient patient;
  final TreatmentDoctor doctor;
  final RazorpayOrder? payment;
  final List<FileDocument> images;
  final List<Medicine> medicines;
  final TreatmentStatus status;
  final String timestamp;
  final CallDetails? call;
  final DocumentReference? reference;

  const Treatment({
    required this.id,
    required this.patient,
    required this.doctor,
    required this.images,
    required this.medicines,
    required this.status,
    required this.timestamp,
    this.payment,
    this.call,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'patient': patient.toMap(),
      'doctor': doctor.toMap(),
      'payment': payment?.toMap(),
      'images': images.map((x) => x.toMap()).toList(),
      'medicines': medicines.map((x) => x.toMap()).toList(),
      'status': status.toMap(),
      'timestamp': timestamp,
      'call': call?.toMap(),
    };
  }

  Treatment copyWith({
    String? id,
    TreatmentPatient? patient,
    TreatmentDoctor? doctor,
    RazorpayOrder? payment,
    List<FileDocument>? images,
    List<Medicine>? medicines,
    TreatmentStatus? status,
    String? timestamp,
    CallDetails? call,
    DocumentReference? reference,
  }) {
    return Treatment(
      id: id ?? this.id,
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      payment: payment ?? this.payment,
      images: images ?? this.images,
      medicines: medicines ?? this.medicines,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      call: call ?? this.call,
      reference: reference ?? this.reference,
    );
  }

  factory Treatment.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Treatment(
        id: map['id'] ?? '',
        patient: TreatmentPatient.fromMap(map['patient']),
        doctor: TreatmentDoctor.fromMap(map['doctor']),
        payment: map['payment'] != null
            ? RazorpayOrder.fromMap(map['payment'])
            : null,
        images: List<FileDocument>.from(
            map['images']?.map((x) => FileDocument.fromMap(x))),
        medicines: _getMedicinesFromMap(map),
        status: TreatmentStatus.review.fromMap(map['status']),
        timestamp: map['timestamp'] ?? '',
        call: map['call'] != null ? CallDetails.fromMap(map['call']) : null,
        reference: reference);
  }

  static List<Medicine> _getMedicinesFromMap(map) {
    var list = map;

    if (list == null || list.isEmpty) return [];

    return List<Medicine>.from(
        map['medicines'].map((x) => Medicine.fromMap(x)));
  }

  factory Treatment.fromSnapshot(DocumentSnapshot snapshot) {
    return Treatment.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  @override
  String toString() {
    return 'Treatment(id: $id, patient: $patient, doctor: $doctor, payment: $payment, images: $images, medicines: $medicines, status: $status, timestamp: $timestamp, call: $call, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Treatment &&
        other.id == id &&
        other.patient == patient &&
        other.doctor == doctor &&
        other.payment == payment &&
        listEquals(other.images, images) &&
        listEquals(other.medicines, medicines) &&
        other.status == status &&
        other.timestamp == timestamp &&
        other.call == call &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        patient.hashCode ^
        doctor.hashCode ^
        payment.hashCode ^
        images.hashCode ^
        medicines.hashCode ^
        status.hashCode ^
        timestamp.hashCode ^
        call.hashCode ^
        reference.hashCode;
  }
}
