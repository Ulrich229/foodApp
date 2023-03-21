import 'dart:convert';

class User {
  final String id;
  final String name;
  final String profilePictureUrl;
  User({
    required this.id,
    required this.name,
    required this.profilePictureUrl,
  });

  User copyWith({
    String? id,
    String? name,
    String? profilePictureUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      profilePictureUrl: map['profilePictureUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(id: $id, name: $name, profilePictureUrl: $profilePictureUrl)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.profilePictureUrl == profilePictureUrl;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ profilePictureUrl.hashCode;
}

final User user1 = User(
  id: "1",
  name: "Gray",
  profilePictureUrl: "assets/images/profile_2.png",
);
final User user2 = User(
  id: "2",
  name: "MIcheal",
  profilePictureUrl: "assets/images/profile_3.png",
);
final User user3 = User(
  id: "3",
  name: "Gift",
  profilePictureUrl: "assets/images/profile_4.png",
);
final User user4 = User(
  id: "4",
  name: "Sammie",
  profilePictureUrl: "assets/images/profile_5.png",
);
final User user5 = User(
  id: "5",
  name: "Gray",
  profilePictureUrl: "assets/images/profile_2.png",
);
final User user6 = User(
  id: "6",
  name: "MIcheal",
  profilePictureUrl: "assets/images/profile_3.png",
);
final User user7 = User(
  id: "7",
  name: "Gift",
  profilePictureUrl: "assets/images/profile_4.png",
);
final User user8 = User(
  id: "8",
  name: "Sammie",
  profilePictureUrl: "assets/images/profile_5.png",
);
final User user9 = User(
  id: "9",
  name: "Grace Goldberg",
  profilePictureUrl: "assets/images/profile_1.png",
);
final List<User> topchefs = [
  user1,
  user2,
  user3,
  user4,
  user5,
  user6,
  user7,
  user8,
];
