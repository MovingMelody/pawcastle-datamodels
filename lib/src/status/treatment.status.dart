enum TreatmentStatus {
  // initial status for paid treatments
  created,
  // waiting for payment, default for pet treatments
  awaitingPayment,
  // payment done, default for farm animal treatments
  open,
  // doctor is treating the case
  review,
  // doctor prescribed medicines
  closed
}

extension TreatmentStatusParser on TreatmentStatus {
  String get value {
    switch (this) {
      case TreatmentStatus.awaitingPayment:
        return 'awaiting_payment';
      case TreatmentStatus.created:
        return 'created';
      case TreatmentStatus.open:
        return 'open';
      case TreatmentStatus.review:
        return 'inreview';
      default:
        return 'closed';
    }
  }

  String toMap() => value;

  TreatmentStatus fromMap(String status) {
    switch (status) {
      case 'awaiting_payment':
        return TreatmentStatus.awaitingPayment;
      case 'open':
        return TreatmentStatus.open;
      case 'inreview':
        return TreatmentStatus.review;
      case 'created':
        return TreatmentStatus.created;
      default:
        return TreatmentStatus.closed;
    }
  }
}
