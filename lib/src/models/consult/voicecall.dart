import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pawcastle_datamodels/pawcastle_datamodels.dart';

String _generateCallId() {
  var r = Random();
  var number =
      String.fromCharCodes(List.generate(7, (index) => r.nextInt(9) + 49));
  return "VCC$number";
}

class Voicecall {
  final String id;
  final String caseId;
  final CallDetails details;
  final String status;
  final TreatmentPatient patient;
  final TreatmentDoctor doctor;
  final String timestamp;
  final bool isFollowup;
  final DocumentReference? reference;

  Voicecall({
    required this.id,
    required this.caseId,
    required this.details,
    required this.status,
    required this.patient,
    required this.doctor,
    required this.timestamp,
    required this.isFollowup,
    this.reference,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'caseId': caseId,
      'details': details.toMap(),
      'status': status,
      'patient': patient.toMap(),
      'doctor': doctor.toMap(),
      'timestamp': timestamp,
      'isFollowup': isFollowup,
    };
  }

  factory Voicecall.fromSnapshot(DocumentSnapshot snapshot) {
    return Voicecall.fromMap(snapshot.data() as Map<String, dynamic>,
        reference: snapshot.reference);
  }

  factory Voicecall.fromMap(Map<String, dynamic> map,
      {DocumentReference? reference}) {
    return Voicecall(
        id: map['id'] ?? '',
        caseId: map['caseId'] ?? '',
        details: CallDetails.fromMap(map['details']),
        status: map['status'] ?? '',
        patient: TreatmentPatient.fromMap(map['patient']),
        doctor: TreatmentDoctor.fromMap(map['doctor']),
        timestamp: map['timestamp'] ?? '',
        isFollowup: map['isFollowup'] ?? false,
        reference: reference);
  }

  factory Voicecall.fromTreatment(Treatment treatment,
      {bool isFollowup = false}) {
    var channelId = _generateCallId();
    return Voicecall(
        id: channelId,
        caseId: treatment.id,
        details: _parseCallDetails(channelId, treatment.call),
        status: "dial",
        patient: treatment.patient,
        doctor: treatment.doctor,
        timestamp: "${DateTime.now().microsecondsSinceEpoch}",
        isFollowup: isFollowup);
  }

  static CallDetails _parseCallDetails(String channelId, CallDetails? details) {
    if (details == null) {
      return CallDetails(channelId: channelId);
    } else {
      if (details.channelId.isEmpty) return CallDetails(channelId: channelId);

      return details;
    }
  }

  Voicecall copyWith({
    String? id,
    String? caseId,
    CallDetails? details,
    String? status,
    TreatmentPatient? patient,
    TreatmentDoctor? doctor,
    String? timestamp,
    bool? isFollowup,
    DocumentReference? reference,
  }) {
    return Voicecall(
      id: id ?? this.id,
      caseId: caseId ?? this.caseId,
      details: details ?? this.details,
      status: status ?? this.status,
      patient: patient ?? this.patient,
      doctor: doctor ?? this.doctor,
      timestamp: timestamp ?? this.timestamp,
      isFollowup: isFollowup ?? this.isFollowup,
      reference: reference ?? this.reference,
    );
  }

  @override
  String toString() {
    return 'Voicecall(id: $id, caseId: $caseId, details: $details, status: $status, patient: $patient, doctor: $doctor, timestamp: $timestamp, isFollowup: $isFollowup, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Voicecall &&
        other.id == id &&
        other.caseId == caseId &&
        other.details == details &&
        other.status == status &&
        other.patient == patient &&
        other.doctor == doctor &&
        other.timestamp == timestamp &&
        other.isFollowup == isFollowup &&
        other.reference == reference;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        caseId.hashCode ^
        details.hashCode ^
        status.hashCode ^
        patient.hashCode ^
        doctor.hashCode ^
        timestamp.hashCode ^
        isFollowup.hashCode ^
        reference.hashCode;
  }
}

class CallDetails {
  final String? token;
  final String channelId;
  final int? tokenExpiry;

  CallDetails({
    this.token,
    required this.channelId,
    this.tokenExpiry,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'channelId': channelId,
      'tokenExpiry': tokenExpiry,
    };
  }

  factory CallDetails.fromMap(Map<String, dynamic> map) {
    return CallDetails(
      token: map['token'],
      channelId: map['channelId'] ?? '',
      tokenExpiry: map['tokenExpiry']?.toInt(),
    );
  }

  CallDetails copyWith({
    String? token,
    String? channelId,
    int? tokenExpiry,
  }) {
    return CallDetails(
      token: token ?? this.token,
      channelId: channelId ?? this.channelId,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
    );
  }

  @override
  String toString() =>
      'CallDetails(token: $token, channelId: $channelId, tokenExpiry: $tokenExpiry)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallDetails &&
        other.token == token &&
        other.channelId == channelId &&
        other.tokenExpiry == tokenExpiry;
  }

  @override
  int get hashCode =>
      token.hashCode ^ channelId.hashCode ^ tokenExpiry.hashCode;
}
