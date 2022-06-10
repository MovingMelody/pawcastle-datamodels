enum UserType { doctor, merchant, driver }

extension UserTypeParser on UserType {
  String get value {
    switch (this) {
      case UserType.doctor:
        return 'doctor';
      case UserType.merchant:
        return 'merchant';
      case UserType.driver:
      default:
        return 'driver';
    }
  }

  String toMap() => value;

  UserType fromMap(String status) {
    switch (status) {
      case "doctor":
        return UserType.doctor;
      case "merchant":
        return UserType.merchant;
      default:
        return UserType.driver;
    }
  }
}
