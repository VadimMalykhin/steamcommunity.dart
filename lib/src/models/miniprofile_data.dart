import 'package:equatable/equatable.dart';

class SteamMiniProfile extends Equatable {
  const SteamMiniProfile({
    required this.level,
    required this.levelClass,
    required this.avatarUrl,
    required this.personaName,
    this.favoriteBadge,
    this.profileBackground,
    this.avatarFrame,
    this.inGame,
  });

  factory SteamMiniProfile.fromJson(Map<String, dynamic> json) {
    return SteamMiniProfile(
      level: json['level'] as int? ?? 0,
      levelClass: json['level_class'] as String? ?? '',
      avatarUrl: json['avatar_url'] as String? ?? '',
      personaName: json['persona_name'] as String? ?? '',
      favoriteBadge: json['favorite_badge'] != null
          ? FavoriteBadge.fromJson(json['favorite_badge'] as Map<String, dynamic>)
          : null,
      profileBackground: json['profile_background'] != null
          ? ProfileBackground.fromJson(json['profile_background'] as Map<String, dynamic>)
          : null,
      avatarFrame: json['avatar_frame'] as String?,
      inGame: json['in_game'] != null
          ? InGame.fromJson(json['in_game'] as Map<String, dynamic>)
          : null,
    );
  }

  final int level;
  final String levelClass;
  final String avatarUrl;
  final String personaName;
  final FavoriteBadge? favoriteBadge;
  final ProfileBackground? profileBackground;
  final String? avatarFrame;
  final InGame? inGame;

  Map<String, dynamic> toJson() {
    return {
      'level': level,
      'level_class': levelClass,
      'avatar_url': avatarUrl,
      'persona_name': personaName,
      if (favoriteBadge != null) 'favorite_badge': favoriteBadge!.toJson(),
      if (profileBackground != null) 'profile_background': profileBackground!.toJson(),
      if (avatarFrame != null) 'avatar_frame': avatarFrame,
      if (inGame != null) 'in_game': inGame!.toJson(),
    };
  }

  @override
  List<Object?> get props => [
    level,
    levelClass,
    avatarUrl,
    personaName,
    favoriteBadge,
    profileBackground,
    avatarFrame,
    inGame,
  ];
}

class FavoriteBadge extends Equatable {
  const FavoriteBadge({
    required this.name,
    required this.xp,
    required this.level,
    required this.description,
    required this.icon,
  });

  factory FavoriteBadge.fromJson(Map<String, dynamic> json) {
    return FavoriteBadge(
      name: json['name'] as String? ?? '',
      xp: json['xp']?.toString() ?? '0',
      level: json['level'] as int? ?? 0,
      description: json['description'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );
  }
  final String name;
  final String xp;
  final int level;
  final String description;
  final String icon;

  int get xpAsInt {
    final cleanXp = xp.replaceAll(',', '');
    return int.tryParse(cleanXp) ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'xp': xp,
      'level': level,
      'description': description,
      'icon': icon,
    };
  }

  @override
  List<Object?> get props => [name, xp, level, description, icon];
}

class ProfileBackground extends Equatable {
  const ProfileBackground({
    required this.videoWebm,
    required this.videoMp4,
  });

  factory ProfileBackground.fromJson(Map<String, dynamic> json) {
    return ProfileBackground(
      videoWebm: json['video/webm'] as String? ?? '',
      videoMp4: json['video/mp4'] as String? ?? '',
    );
  }
  final String videoWebm;
  final String videoMp4;

  Map<String, dynamic> toJson() {
    return {
      'video/webm': videoWebm,
      'video/mp4': videoMp4,
    };
  }

  @override
  List<Object?> get props => [videoWebm, videoMp4];
}

class InGame extends Equatable {
  const InGame({
    required this.name,
    required this.isNonSteam,
    required this.logo,
    required this.richPresence,
  });

  factory InGame.fromJson(Map<String, dynamic> json) {
    return InGame(
      name: json['name'] as String? ?? '',
      isNonSteam: json['is_non_steam'] as bool? ?? false,
      logo: json['logo'] as String? ?? '',
      richPresence: json['rich_presence'] as String? ?? '',
    );
  }
  final String name;
  final bool isNonSteam;
  final String logo;
  final String richPresence;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'is_non_steam': isNonSteam,
      'logo': logo,
      'rich_presence': richPresence,
    };
  }

  @override
  List<Object?> get props => [name, isNonSteam, logo, richPresence];
}
