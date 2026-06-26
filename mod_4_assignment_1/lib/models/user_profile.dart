class UserProfile {
  const UserProfile({
    required this.name,
    required this.role,
    required this.email,
    required this.phone,
    required this.location,
    required this.bio,
    required this.skills,
  });

  final String name;
  final String role;
  final String email;
  final String phone;
  final String location;
  final String bio;
  final List<String> skills;

  UserProfile copyWith({
    String? name,
    String? role,
    String? email,
    String? phone,
    String? location,
    String? bio,
    List<String>? skills,
  }) {
    return UserProfile(
      name: name ?? this.name,
      role: role ?? this.role,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      bio: bio ?? this.bio,
      skills: skills ?? this.skills,
    );
  }
}
