class UserModel {
  final String id;
  final String email;
  final String name;
  final bool isOnline;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.isOnline,
    required this.updatedAt,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "name": name,
      "isOnline": isOnline,
      "createdAt": createdAt.millisecondsSinceEpoch,
      "updatedAt": createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      isOnline: map['isOnline'] ?? false,
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  UserModel copyWith({bool? isOnline, DateTime? updatedAt}) {
    return UserModel(
      id: id,
      email: email,
      name: name,
      isOnline: isOnline ?? this.isOnline,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt,
    );
  }
}
