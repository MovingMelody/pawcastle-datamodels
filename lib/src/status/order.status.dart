enum MedicineOrderStatus {
  // inital status for order
  created,
  // razorpay order is generated
  awaitingPayment,
  // payment done and will be sent to pharmacy
  paid,
  // medicines are packed and delivery will be assigned
  ready,
  // if there are no near by drivers for the pharmacy
  noDrivers,
  // driver gets assigned to current order
  driverAssigned,
  // order handed over to driver
  dispatched,
}

extension OrderStatusParser on MedicineOrderStatus {
  String get value {
    switch (this) {
      case MedicineOrderStatus.created:
        return 'created';
      case MedicineOrderStatus.awaitingPayment:
        return 'awaiting_payment';
      case MedicineOrderStatus.paid:
        return 'paid';
      case MedicineOrderStatus.ready:
        return 'ready';
      case MedicineOrderStatus.driverAssigned:
        return 'driver_assigned';
      case MedicineOrderStatus.noDrivers:
        return 'no_drivers';
      default:
        return 'dispatched';
    }
  }

  String get toMap => value;

  MedicineOrderStatus fromMap(String status) {
    switch (status) {
      case "created":
        return MedicineOrderStatus.created;
      case "awaiting_payment":
        return MedicineOrderStatus.awaitingPayment;
      case "paid":
        return MedicineOrderStatus.paid;
      case "ready":
        return MedicineOrderStatus.ready;
      case "dispatched":
        return MedicineOrderStatus.dispatched;
      case "no_drivers":
        return MedicineOrderStatus.noDrivers;
      default:
        return MedicineOrderStatus.driverAssigned;
    }
  }
}
