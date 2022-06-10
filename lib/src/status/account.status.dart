enum BankAccountStatus {
  // when the razorpay account is verified
  active,
  // default for newly added accounts
  inactive,
  // failed to create bank account
  failed
}

extension BankAccountStatusParser on BankAccountStatus {
  String get value {
    switch (this) {
      case BankAccountStatus.active:
        return 'active';
      case BankAccountStatus.inactive:
        return 'inactive';
      default:
        return 'inactive';
    }
  }

  String toMap() => value;

  BankAccountStatus fromMap(String status) {
    switch (status) {
      case "active":
        return BankAccountStatus.active;

      case "inactive":
        return BankAccountStatus.inactive;

      default:
        return BankAccountStatus.failed;
    }
  }
}
