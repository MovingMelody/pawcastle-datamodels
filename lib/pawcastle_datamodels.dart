library databook;

/// Data Models
/// ----
/// Users
export 'src/models/users/customer.dart';
export 'src/models/users/doctor.dart';
export 'src/models/users/user.dart';

/// Consult
export 'src/models/consult/medicine.dart';
export 'src/models/consult/treatment.dart';
export 'src/models/consult/diagnosis.dart';
export 'src/models/consult/voicecall.dart';

/// Order
export 'src/models/order/address.dart';
export 'src/models/order/medicine.order.dart';

/// Payment
export 'src/models/payment/order.dart';
export 'src/models/payment/transaction.dart';
export 'src/models/payment/bankaccount.dart';
export 'src/models/payment/payout.dart';
export 'src/models/payment/repayment.dart';

export 'src/models/misc/document.dart';

/// ---
/// Status
export 'src/status/delivery.status.dart';
export 'src/status/order.status.dart';
export 'src/status/treatment.status.dart';
export 'src/status/verification.status.dart';
export 'src/status/repayment.status.dart';
export 'src/status/account.status.dart';
export 'src/status/usertype.enum.dart';
export 'src/constants/keys.dart';
