enum VerificationStatus { approved, declined, review }

extension VerificationStatusParser on VerificationStatus {
  String get value {
    switch (this) {
      case VerificationStatus.approved:
        return 'approved';
      case VerificationStatus.declined:
        return 'declined';
      default:
        return 'review';
    }
  }

  String get toMap => value;

  VerificationStatus fromMap(String status) {
    switch (status) {
      case "approved":
        return VerificationStatus.approved;
      case "declined":
        return VerificationStatus.declined;
      default:
        return VerificationStatus.review;
    }
  }
}
