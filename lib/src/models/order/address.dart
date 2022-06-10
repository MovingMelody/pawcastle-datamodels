import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  final String name;
  final String phone;
  final String city;
  final String state;
  final String street;
  final String? district;
  final int zipcode;
  final UserPosition position;
  final String? directions;

  const Address({
    required this.name,
    required this.phone,
    required this.city,
    required this.state,
    required this.street,
    this.district,
    required this.zipcode,
    required this.position,
    this.directions,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'city': city,
      'state': state,
      'street': street,
      'district': district,
      'zipcode': zipcode,
      'position': position.toMap(),
      'directions': directions,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      street: map['street'] ?? '',
      district: map['district'],
      zipcode: map['zipcode']?.toInt() ?? 0,
      position: UserPosition.fromMap(map['position']),
      directions: map['directions'],
    );
  }

  @override
  String toString() {
    return 'Address(name: $name, phone: $phone, city: $city, state: $state, street: $street, district: $district, zipcode: $zipcode, position: $position, directions: $directions)';
  }

  String get formatted => '$street\n$city\n$district\n$state\n$zipcode';

  Address copyWith({
    String? name,
    String? phone,
    String? city,
    String? state,
    String? street,
    String? district,
    int? zipcode,
    UserPosition? position,
    String? directions,
  }) {
    return Address(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      state: state ?? this.state,
      street: street ?? this.street,
      district: district ?? this.district,
      zipcode: zipcode ?? this.zipcode,
      position: position ?? this.position,
      directions: directions ?? this.directions,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Address &&
        other.name == name &&
        other.phone == phone &&
        other.city == city &&
        other.state == state &&
        other.street == street &&
        other.district == district &&
        other.zipcode == zipcode &&
        other.position == position &&
        other.directions == directions;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phone.hashCode ^
        city.hashCode ^
        state.hashCode ^
        street.hashCode ^
        district.hashCode ^
        zipcode.hashCode ^
        position.hashCode ^
        directions.hashCode;
  }
}

class UserPosition {
  final String geohash;
  final GeoPoint geopoint;

  const UserPosition({
    required this.geohash,
    required this.geopoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'geohash': geohash,
      'geopoint': geopoint,
    };
  }

  factory UserPosition.fromMap(Map<String, dynamic> map) {
    return UserPosition(
      geohash: map['geohash'] ?? '',
      geopoint: map['geopoint'] ?? '',
    );
  }

  @override
  String toString() => 'UserPosition(geohash: $geohash, geopoint: $geopoint)';

  UserPosition copyWith({
    String? geohash,
    GeoPoint? geopoint,
  }) {
    return UserPosition(
      geohash: geohash ?? this.geohash,
      geopoint: geopoint ?? this.geopoint,
    );
  }
}
