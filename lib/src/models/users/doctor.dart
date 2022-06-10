import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'package:pawcastle_datamodels/src/models/misc/document.dart';
import 'package:pawcastle_datamodels/src/status/verification.status.dart';

class DoctorProfile {
  final String about;
  final String designation;
  final String? timings;
  final int? rating;
  final List<String> languages;
  final List<String> species;
  final double? appointmentFee;
  // --documents--
  final FileDocument bvsc;
  final FileDocument license;
  final FileDocument? mvsc;

  const DoctorProfile(
      {required this.about,
      required this.designation,
      required this.languages,
      required this.species,
      required this.bvsc,
      required this.license,
      this.timings,
      this.rating,
      this.mvsc,
      this.appointmentFee});

  DoctorProfile copyWith(
      {String? about,
      String? designation,
      String? timings,
      int? rating,
      List<String>? languages,
      List<String>? species,
      FileDocument? bvsc,
      FileDocument? license,
      FileDocument? mvsc,
      double? appointmentFee}) {
    return DoctorProfile(
      about: about ?? this.about,
      designation: designation ?? this.designation,
      timings: timings ?? this.timings,
      rating: rating ?? this.rating,
      languages: languages ?? this.languages,
      species: species ?? this.species,
      bvsc: bvsc ?? this.bvsc,
      license: license ?? this.license,
      mvsc: mvsc ?? this.mvsc,
      appointmentFee: appointmentFee ?? this.appointmentFee,
    );
  }

  @override
  String toString() {
    return 'DoctorProfile(about: $about, designation: $designation, timings: $timings, rating: $rating, languages: $languages, species: $species, appointmentFee: $appointmentFee, bvsc: $bvsc, license: $license, mvsc: $mvsc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoctorProfile &&
        other.about == about &&
        other.designation == designation &&
        other.timings == timings &&
        other.rating == rating &&
        listEquals(other.languages, languages) &&
        listEquals(other.species, species) &&
        other.appointmentFee == appointmentFee &&
        other.bvsc == bvsc &&
        other.license == license &&
        other.mvsc == mvsc;
  }

  @override
  int get hashCode {
    return about.hashCode ^
        designation.hashCode ^
        timings.hashCode ^
        rating.hashCode ^
        languages.hashCode ^
        species.hashCode ^
        appointmentFee.hashCode ^
        bvsc.hashCode ^
        license.hashCode ^
        mvsc.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      'about': about,
      'designation': designation,
      'timings': timings,
      'rating': rating,
      'languages': languages,
      'species': species,
      'appointmentFee': appointmentFee,
      'bvsc': bvsc.toMap(),
      'license': license.toMap(),
      'mvsc': mvsc?.toMap(),
    };
  }

  factory DoctorProfile.fromMap(Map<String, dynamic> map) {
    return DoctorProfile(
      about: map['about'] ?? '',
      designation: map['designation'] ?? '',
      timings: map['timings'],
      rating: map['rating']?.toInt(),
      languages: List<String>.from(map['languages']),
      species: List<String>.from(map['species']),
      appointmentFee: double.parse(map['appointmentFee'] == null
          ? "-1"
          : map['appointmentFee'].toString()),
      bvsc: FileDocument.fromMap(map['bvsc']),
      license: FileDocument.fromMap(map['license']),
      mvsc: map['mvsc'] != null ? FileDocument.fromMap(map['mvsc']) : null,
    );
  }
}

class Doctor {
  final String id;
  final String name;
  final String phone;
  final String image;
  final VerificationStatus verified;
  final bool online;
  final DoctorProfile profile;
  final DocumentReference? reference;
  final String? fcmToken;
  final String? createdAt;
  final String? razorpayId;

  const Doctor({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    required this.verified,
    required this.online,
    required this.profile,
    this.reference,
    this.fcmToken,
    this.createdAt,
    this.razorpayId,
  });

  Doctor copyWith({
    String? id,
    String? name,
    String? phone,
    String? image,
    VerificationStatus? verified,
    bool? online,
    DoctorProfile? profile,
    DocumentReference? reference,
    String? fcmToken,
    String? createdAt,
    String? razorpayId,
  }) {
    return Doctor(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      image: image ?? this.image,
      verified: verified ?? this.verified,
      online: online ?? this.online,
      profile: profile ?? this.profile,
      reference: reference ?? this.reference,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt ?? this.createdAt,
      razorpayId: razorpayId ?? this.razorpayId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
      'verified': verified.toMap,
      'online': online,
      'profile': profile.toMap(),
      '_notification': fcmToken,
      '_createdAt': createdAt,
      '_razorpayId': razorpayId,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Doctor(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        phone: map['phone'] ?? '',
        image: map['image'] ?? '',
        verified: VerificationStatus.approved.fromMap(map['verified']),
        online: map['online'] ?? false,
        fcmToken: map['_notification'],
        createdAt: map['_createdAt'],
        razorpayId: map['_razorpayId'],
        profile: DoctorProfile.fromMap(map['profile']),
        reference: reference);
  }

  factory Doctor.fromSnapshot(DocumentSnapshot snapshot) {
    return Doctor.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, phone: $phone, image: $image, verified: $verified, online: $online, profile: $profile, reference: $reference, fcmToken: $fcmToken, createdAt: $createdAt, razorpayId: $razorpayId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Doctor &&
        other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.image == image &&
        other.verified == verified &&
        other.online == online &&
        other.profile == profile &&
        other.reference == reference &&
        other.fcmToken == fcmToken &&
        other.createdAt == createdAt &&
        other.razorpayId == razorpayId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        image.hashCode ^
        verified.hashCode ^
        online.hashCode ^
        profile.hashCode ^
        reference.hashCode ^
        fcmToken.hashCode ^
        createdAt.hashCode ^
        razorpayId.hashCode;
  }
}
