class Contact {
  final String id;
  final bool isFavourite;
  final String name;
  final String email;
  final DateTime dob;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Contact({
    required this.id,
    required this.isFavourite,
    required this.name,
    required this.email,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
  });

  Contact copyWith({
    String? id,
    bool? isFavourite,
    String? name,
    String? email,
    DateTime? dob,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Contact(
      id: id ?? this.id,
      isFavourite: isFavourite ?? this.isFavourite,
      name: name ?? this.name,
      email: email ?? this.email,
      dob: dob ?? this.dob,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "isFavourite": isFavourite,
      "name": name,
      "email": email,
      "dob": dob.millisecondsSinceEpoch,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "updatedAt": updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> json) {
    return Contact(
      id: json['id'] as String,
      isFavourite: json['isFavourite'] as bool,
      name: json['name'] as String,
      email: json['email'] as String,
      dob: DateTime.fromMillisecondsSinceEpoch(json['dob'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
    );
  }
}
