import 'package:flutter/foundation.dart';

import '../models/user_profile.dart';

class ProfileProvider extends ChangeNotifier {
  ProfileProvider() : _profile = _defaultProfile;

  UserProfile _profile;

  UserProfile get profile => _profile;

  static final UserProfile _defaultProfile = UserProfile(
    name: 'Safius Sifat',
    role: 'Flutter Developer',
    email: 'sifat@example.com',
    phone: '+880 1234 567890',
    location: 'Dhaka, BD',
    bio:
        'Passionate Flutter developer with experience in building '
        'cross-platform mobile applications. I enjoy creating clean, '
        'responsive, and user-friendly interfaces using Column, Row, '
        'and other Flutter layout widgets.',
    skills: const ['Flutter', 'Dart', 'UI/UX', 'Firebase', 'Git'],
  );

  void updateProfile(UserProfile profile) {
    if (_profile == profile) return;
    _profile = profile;
    notifyListeners();
  }
}
