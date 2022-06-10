import 'package:pawcastle_datamodels/pawcastle_datamodels.dart';

class AuthUser {
  final String id;
  final String name;
  final String phone;
  final String? image;

  const AuthUser(
      {required this.id, required this.name, required this.phone, this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'image': image,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'],
    );
  }

  factory AuthUser.fromCustomer(Customer customer) {
    return AuthUser(
        id: customer.id, name: customer.name, phone: customer.phone);
  }

  factory AuthUser.fromDoctor(Doctor doctor) {
    return AuthUser(
        id: doctor.id,
        name: doctor.name,
        phone: doctor.phone,
        image: doctor.image);
  }

  factory AuthUser.fromTreatmentPatient(TreatmentPatient patient) {
    return AuthUser(id: patient.id, name: patient.name, phone: patient.phone);
  }

  factory AuthUser.fromTreatmentDoctor(TreatmentDoctor doctor) {
    return AuthUser(
        id: doctor.id,
        name: doctor.name,
        phone: doctor.phone,
        image: doctor.image);
  }
}
