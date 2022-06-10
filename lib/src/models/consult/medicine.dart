class GlobalMedicine {
  final int key;
  final String id;
  final String name;
  final String package;
  final String category;
  final String composition;
  final double mrp;
  final int minMargin;

  const GlobalMedicine({
    required this.id,
    required this.key,
    required this.name,
    required this.package,
    required this.category,
    required this.mrp,
    this.composition = '',
    this.minMargin = 3,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': key,
      'medicine_id': id,
      'name': name,
      'package': package,
      'category': category,
      'composition': composition,
      'mrp': mrp,
      'minMargin': minMargin,
    };
  }

  factory GlobalMedicine.fromMap(Map<String, dynamic> map) {
    return GlobalMedicine(
      id: map['medicine_id'] ?? '',
      key: int.parse(map['id'] == null ? "0" : map['id'].toString()),
      name: map['name'] ?? '',
      package: map['package'] ?? '',
      category: map['category'] ?? '',
      composition: map['composition'] ?? '',
      mrp: double.parse(map['mrp'].toString()),
      minMargin: map['minMargin'],
    );
  }

  GlobalMedicine copyWith({
    String? id,
    String? name,
    String? package,
    String? category,
    String? composition,
    double? mrp,
    int? key,
    int? minMargin,
  }) {
    return GlobalMedicine(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      package: package ?? this.package,
      category: category ?? this.category,
      composition: composition ?? this.composition,
      mrp: mrp ?? this.mrp,
      minMargin: minMargin ?? this.minMargin,
    );
  }

  @override
  String toString() {
    return 'GlobalMedicine(key: $key, id: $id, name: $name, package: $package, category: $category, composition: $composition, mrp: $mrp, minMargin: $minMargin)';
  }
}

class PharmacyMedicine extends GlobalMedicine {
  final bool inStock;
  final double margin;
  final double? price;
  final double? discount;

  const PharmacyMedicine({
    // GlobalMedicine
    required String id,
    required int key,
    required String name,
    required String package,
    required String category,
    required double mrp,
    String composition = '',
    int minMargin = 3,
    // Pharmacy medicine
    required this.margin,
    required this.inStock,
    this.price,
    this.discount,
  }) : super(
            id: id,
            key: key,
            name: name,
            package: package,
            category: category,
            mrp: mrp,
            minMargin: minMargin,
            composition: composition);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    return {
      ...map,
      'margin': margin,
      'inStock': inStock,
      'price': price,
      'discount': discount,
    };
  }

  factory PharmacyMedicine.fromMedicine(
    GlobalMedicine medicine, {
    required double margin,
    required bool inStock,
    double? price,
    double? discount,
  }) {
    return PharmacyMedicine(
        id: medicine.id,
        key: medicine.key,
        name: medicine.name,
        package: medicine.package,
        category: medicine.category,
        minMargin: medicine.minMargin,
        mrp: medicine.mrp,
        price: price,
        discount: discount,
        margin: margin,
        inStock: inStock);
  }

  factory PharmacyMedicine.fromMap(Map<String, dynamic> map) {
    return PharmacyMedicine(
      id: map['medicine_id'],
      name: map['name'],
      package: map['package'],
      category: map['category'],
      mrp: double.parse(map['mrp'].toString()),
      minMargin: map['minMargin'],
      inStock: map['inStock'],
      margin: double.parse(map['margin'].toString()),
      key: int.parse(map['id'] == null ? "0" : map['id'].toString()),
      price:
          map['price'] == null ? null : double.parse(map['price'].toString()),
      discount: map['discount'] == null
          ? null
          : double.parse(map['discount'].toString()),
    );
  }

  PharmacyMedicine copyWithData({
    double? margin,
    bool? inStock,
    double? price,
    double? discount,
  }) {
    return PharmacyMedicine(
      id: id,
      key: key,
      name: name,
      package: package,
      category: category,
      minMargin: minMargin,
      mrp: mrp,
      margin: margin ?? this.margin,
      inStock: inStock ?? this.inStock,
      price: price ?? this.price,
      discount: discount ?? this.discount,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PharmacyMedicine &&
        other.margin == margin &&
        other.inStock == inStock &&
        other.price == price &&
        other.discount == discount;
  }

  @override
  int get hashCode {
    return margin.hashCode ^
        inStock.hashCode ^
        price.hashCode ^
        discount.hashCode;
  }

  @override
  String toString() {
    return 'PharmacyMedicine(margin: $margin, inStock: $inStock, price: $price, discount: $discount)';
  }
}

class Medicine extends PharmacyMedicine {
  final int quantity;

  const Medicine({
    // GlobalMedicine
    required String id,
    required int key,
    required String name,
    required String package,
    required String category,
    required double mrp,
    String composition = '',
    int minMargin = 3,
    // Pharmacy medicine
    required double margin,
    required bool inStock,
    double? price,
    double? discount,
    // Medicine
    required this.quantity,
  }) : super(
            id: id,
            key: key,
            name: name,
            package: package,
            category: category,
            mrp: mrp,
            minMargin: minMargin,
            inStock: inStock,
            margin: margin,
            composition: composition,
            discount: discount,
            price: price);

  @override
  Map<String, dynamic> toMap() {
    var map = super.toMap();
    return {...map, 'quantity': quantity};
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
        id: map['medicine_id'],
        key: int.parse(map['id'] == null ? "0" : map['id'].toString()),
        name: map['name'],
        package: map['package'],
        category: map['category'],
        mrp: double.parse(map['mrp'].toString()),
        minMargin: map['minMargin'],
        inStock: map['inStock'],
        margin: double.parse(map['margin'].toString()),
        price:
            map['price'] == null ? null : double.parse(map['price'].toString()),
        discount: map['discount'] == null
            ? null
            : double.parse(map['discount'].toString()),
        quantity: map['quantity']);
  }

  @override
  String toString() => 'Medicine(quantity: $quantity)';

  Medicine copyWithQty({
    int? quantity,
  }) {
    return Medicine(
      id: id,
      name: name,
      key: key,
      package: package,
      category: category,
      minMargin: minMargin,
      mrp: mrp,
      margin: margin,
      inStock: inStock,
      price: price,
      discount: discount,
      quantity: quantity ?? this.quantity,
    );
  }

  factory Medicine.fromPharmacyMedicine(
    PharmacyMedicine medicine, {
    required int qty,
  }) {
    return Medicine(
        id: medicine.id,
        key: medicine.key,
        name: medicine.name,
        package: medicine.package,
        category: medicine.category,
        minMargin: medicine.minMargin,
        mrp: medicine.mrp,
        price: medicine.price,
        discount: medicine.discount,
        margin: medicine.margin,
        quantity: qty,
        inStock: medicine.inStock);
  }
}
