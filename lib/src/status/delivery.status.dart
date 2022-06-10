enum MedicineDeliveryStatus {
  // delivery request via notification
  created,
  // assigned to pharmacy
  assigned,
  // picked order from pharmacy
  pickedup,
  // delivered order to customer
  delivered
}

extension DeliveryStatusParser on MedicineDeliveryStatus {
  String get value {
    switch (this) {
      case MedicineDeliveryStatus.created:
        return 'created';
      case MedicineDeliveryStatus.assigned:
        return 'assigned';
      case MedicineDeliveryStatus.pickedup:
        return 'pickedup';
      default:
        return 'delivered';
    }
  }

  String toMap() => value;

  MedicineDeliveryStatus fromMap(String status) {
    switch (status) {
      case "created":
        return MedicineDeliveryStatus.created;
      case "assigned":
        return MedicineDeliveryStatus.assigned;
      case "pickedup":
        return MedicineDeliveryStatus.pickedup;
      default:
        return MedicineDeliveryStatus.delivered;
    }
  }
}
