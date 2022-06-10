class TreatmentDiagnosis {
  final String id; //points to caseId of treatment
  final Pet pet;
  final CaseHistory history;
  final String? symptoms;
  final String diagnosis;

  const TreatmentDiagnosis({
    required this.id,
    required this.pet,
    required this.history,
    this.symptoms,
    required this.diagnosis,
  });

  TreatmentDiagnosis copyWith({
    String? id,
    Pet? pet,
    CaseHistory? history,
    String? symptoms,
    String? diagnosis,
  }) {
    return TreatmentDiagnosis(
      id: id ?? this.id,
      pet: pet ?? this.pet,
      history: history ?? this.history,
      symptoms: symptoms ?? this.symptoms,
      diagnosis: diagnosis ?? this.diagnosis,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pet': pet.toMap(),
      'history': history.toMap(),
      'symptoms': symptoms,
      'diagnosis': diagnosis,
    };
  }

  factory TreatmentDiagnosis.fromMap(Map<String, dynamic> map) {
    return TreatmentDiagnosis(
      id: map['id'] ?? '',
      pet: Pet.fromMap(map['pet']),
      history: CaseHistory.fromMap(map['history']),
      symptoms: map['symptoms'],
      diagnosis: map['diagnosis'] ?? '',
    );
  }

  @override
  String toString() {
    return 'TreatmentDiagnosis(id: $id, pet: $pet, history: $history, symptoms: $symptoms, diagnosis: $diagnosis)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TreatmentDiagnosis &&
        other.id == id &&
        other.pet == pet &&
        other.history == history &&
        other.symptoms == symptoms &&
        other.diagnosis == diagnosis;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pet.hashCode ^
        history.hashCode ^
        symptoms.hashCode ^
        diagnosis.hashCode;
  }
}

class CaseHistory {
  final String temperature;
  final String respiration;
  final String rumination;
  final String feeding;
  final String drinkingWater;
  final String deworming;
  final String vaccination;

  const CaseHistory({
    required this.temperature,
    required this.respiration,
    required this.rumination,
    required this.feeding,
    required this.drinkingWater,
    required this.deworming,
    required this.vaccination,
  });

  CaseHistory copyWith({
    String? temperature,
    String? respiration,
    String? rumination,
    String? feeding,
    String? drinkingWater,
    String? deworming,
    String? vaccination,
  }) {
    return CaseHistory(
      temperature: temperature ?? this.temperature,
      respiration: respiration ?? this.respiration,
      rumination: rumination ?? this.rumination,
      feeding: feeding ?? this.feeding,
      drinkingWater: drinkingWater ?? this.drinkingWater,
      deworming: deworming ?? this.deworming,
      vaccination: vaccination ?? this.vaccination,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'temperature': temperature,
      'respiration': respiration,
      'rumination': rumination,
      'feeding': feeding,
      'drinkingWater': drinkingWater,
      'deworming': deworming,
      'vaccination': vaccination,
    };
  }

  factory CaseHistory.fromMap(Map<String, dynamic> map) {
    return CaseHistory(
      temperature: map['temperature'] ?? '',
      respiration: map['respiration'] ?? '',
      rumination: map['rumination'] ?? '',
      feeding: map['feeding'] ?? '',
      drinkingWater: map['drinkingWater'] ?? '',
      deworming: map['deworming'] ?? '',
      vaccination: map['vaccination'] ?? '',
    );
  }

  @override
  String toString() {
    return 'CaseHistory(temperature: $temperature, respiration: $respiration, rumination: $rumination, feeding: $feeding, drinkingWater: $drinkingWater, deworming: $deworming, vaccination: $vaccination)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaseHistory &&
        other.temperature == temperature &&
        other.respiration == respiration &&
        other.rumination == rumination &&
        other.feeding == feeding &&
        other.drinkingWater == drinkingWater &&
        other.deworming == deworming &&
        other.vaccination == vaccination;
  }

  @override
  int get hashCode {
    return temperature.hashCode ^
        respiration.hashCode ^
        rumination.hashCode ^
        feeding.hashCode ^
        drinkingWater.hashCode ^
        deworming.hashCode ^
        vaccination.hashCode;
  }
}

class Pet {
  final String name;
  final String species;
  final String? breed;
  final String? age;
  final String? sex;

  const Pet({
    required this.name,
    required this.species,
    this.breed,
    this.age,
    this.sex,
  });

  Pet copyWith({
    String? name,
    String? species,
    String? breed,
    String? age,
    String? sex,
  }) {
    return Pet(
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      age: age ?? this.age,
      sex: sex ?? this.sex,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'species': species,
      'breed': breed,
      'age': age,
      'sex': sex,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      name: map['name'] ?? '',
      species: map['species'] ?? '',
      breed: map['breed'],
      age: map['age'],
      sex: map['sex'],
    );
  }

  @override
  String toString() {
    return 'Pet(name: $name, species: $species, breed: $breed, age: $age, sex: $sex)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Pet &&
        other.name == name &&
        other.species == species &&
        other.breed == breed &&
        other.age == age &&
        other.sex == sex;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        species.hashCode ^
        breed.hashCode ^
        age.hashCode ^
        sex.hashCode;
  }
}
