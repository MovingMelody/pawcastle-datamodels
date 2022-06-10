enum RepaymentStatus { created, awaitingPayment, paid }

extension RepaymentStatusParser on RepaymentStatus {
  String get value {
    switch (this) {
      case RepaymentStatus.created:
        return 'created';
      case RepaymentStatus.awaitingPayment:
        return 'awaiting_payment';
      default:
        return 'paid';
    }
  }

  String toMap() => value;

  RepaymentStatus fromMap(String status) {
    switch (status) {
      case "created":
        return RepaymentStatus.created;

      case "awaiting_payment":
        return RepaymentStatus.awaitingPayment;

      default:
        return RepaymentStatus.paid;
    }
  }
}
