import 'package:equatable/equatable.dart';

class InGameInfo extends Equatable {
  const InGameInfo({
    this.gameName,
    this.gameLink,
    this.gameIcon,
    this.gameLogo,
    this.gameLogoSmall,
    this.gameJoinLink,
  });

  final String? gameName;
  final String? gameLink;
  final String? gameIcon;
  final String? gameLogo;
  final String? gameLogoSmall;
  final String? gameJoinLink;

  @override
  List<Object?> get props => [
        gameName,
        gameLink,
        gameIcon,
        gameLogo,
        gameLogoSmall,
        gameJoinLink,
      ];
}

class ProfileData extends Equatable {
  const ProfileData({
    required this.steamID64,
    required this.steamID,
    required this.onlineState,
    required this.stateMessage,
    required this.privacyState,
    required this.visibilityState,
    required this.avatarIcon,
    required this.avatarMedium,
    required this.avatarFull,
    required this.vacBanned,
    required this.tradeBanState,
    required this.isLimitedAccount,
    this.inGameServerIP,
    this.inGameInfo,
    this.memberSince,
    this.hoursPlayed2Wk,
    this.location,
    this.realname,
  });

  final int steamID64;
  final String steamID;
  final String onlineState;
  final String stateMessage;
  final String privacyState;
  final int visibilityState;
  final String avatarIcon;
  final String avatarMedium;
  final String avatarFull;
  final int vacBanned;
  final String tradeBanState;
  final int isLimitedAccount;
  final String? inGameServerIP;
  final InGameInfo? inGameInfo;
  final String? memberSince;
  final String? hoursPlayed2Wk;
  final String? location;
  final String? realname;

  @override
  List<Object?> get props => [
        steamID64,
        steamID,
        onlineState,
        stateMessage,
        privacyState,
        visibilityState,
        avatarIcon,
        avatarMedium,
        avatarFull,
        vacBanned,
        tradeBanState,
        isLimitedAccount,
        inGameServerIP,
        inGameInfo,
        memberSince,
        hoursPlayed2Wk,
        location,
        realname,
      ];
}
