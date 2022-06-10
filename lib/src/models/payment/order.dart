class RazorpayOrder {
  final String amount;
  final String? orderId;
  final String? paymentId;

  const RazorpayOrder({
    required this.amount,
    this.orderId,
    this.paymentId,
  });

  RazorpayOrder copyWith({
    String? amount,
    String? orderId,
    String? paymentId,
  }) {
    return RazorpayOrder(
      amount: amount ?? this.amount,
      orderId: orderId ?? this.orderId,
      paymentId: paymentId ?? this.paymentId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'orderId': orderId,
      'paymentId': paymentId,
    };
  }

  factory RazorpayOrder.fromMap(Map<String, dynamic> map) {
    return RazorpayOrder(
      amount: map['amount'] ?? '',
      orderId: map['orderId'],
      paymentId: map['paymentId'],
    );
  }

  @override
  String toString() =>
      'RazorpayOrder(amount: $amount, orderId: $orderId, paymentId: $paymentId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RazorpayOrder &&
        other.amount == amount &&
        other.orderId == orderId &&
        other.paymentId == paymentId;
  }

  @override
  int get hashCode => amount.hashCode ^ orderId.hashCode ^ paymentId.hashCode;
}
