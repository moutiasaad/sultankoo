class UserProfile {
  final int? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? oldPassword;
  final String? password;

  UserProfile({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.oldPassword,
    this.password,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? oldPassword,
    String? password,
  }) {
    return UserProfile(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      oldPassword: oldPassword ?? this.oldPassword,
      password: password ?? this.password,
    );
  }
}
