import 'package:pawcastle_datamodels/src/status/account.status.dart';
import 'package:pawcastle_datamodels/src/status/usertype.enum.dart';

class BankAccount {
  final String id;
  final UserType userType;
  final String name;
  final String ifsc;
  final String accountNumber;
  final String? contactId;
  final String? fundAccount;
  final String? errorMsg;
  final BankAccountStatus status;

  const BankAccount({
    required this.id,
    required this.userType,
    required this.name,
    required this.ifsc,
    required this.accountNumber,
    required this.status,
    this.contactId,
    this.fundAccount,
    this.errorMsg,
  });

  BankAccount copyWith({
    String? id,
    UserType? userType,
    String? name,
    String? ifsc,
    String? accountNumber,
    String? contactId,
    String? fundAccount,
    String? errorMsg,
    BankAccountStatus? status,
  }) {
    return BankAccount(
      id: id ?? this.id,
      userType: userType ?? this.userType,
      name: name ?? this.name,
      ifsc: ifsc ?? this.ifsc,
      accountNumber: accountNumber ?? this.accountNumber,
      contactId: contactId ?? this.contactId,
      fundAccount: fundAccount ?? this.fundAccount,
      errorMsg: errorMsg ?? this.errorMsg,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userType': userType.toMap(),
      'name': name,
      'ifsc': ifsc,
      'accountNumber': accountNumber,
      'contactId': contactId,
      'fundAccount': fundAccount,
      'errorMsg': errorMsg,
      'status': status.toMap(),
    };
  }

  factory BankAccount.fromMap(Map<String, dynamic> map) {
    return BankAccount(
      id: map['id'] ?? '',
      userType: UserType.doctor.fromMap(map['userType']),
      name: map['name'] ?? '',
      ifsc: map['ifsc'] ?? '',
      accountNumber: map['accountNumber'] ?? '',
      contactId: map['contactId'],
      fundAccount: map['fundAccount'],
      errorMsg: map['errorMsg'],
      status: BankAccountStatus.active.fromMap(map['status']),
    );
  }
  @override
  String toString() {
    return 'BankAccount(id: $id, userType: $userType, name: $name, ifsc: $ifsc, accountNumber: $accountNumber, contactId: $contactId, fundAccount: $fundAccount, errorMsg: $errorMsg, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankAccount &&
        other.id == id &&
        other.userType == userType &&
        other.name == name &&
        other.ifsc == ifsc &&
        other.accountNumber == accountNumber &&
        other.contactId == contactId &&
        other.fundAccount == fundAccount &&
        other.errorMsg == errorMsg &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userType.hashCode ^
        name.hashCode ^
        ifsc.hashCode ^
        accountNumber.hashCode ^
        contactId.hashCode ^
        fundAccount.hashCode ^
        errorMsg.hashCode ^
        status.hashCode;
  }
}
