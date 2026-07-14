import 'dart:io';

import 'package:dio/dio.dart';
import 'package:xml/xml.dart';

import 'models/aliases_data.dart';
import 'models/miniprofile_data.dart';
import 'models/profile_data.dart';
import 'utils.dart';

class SteamCommunity {
  factory SteamCommunity() => _instance;

  SteamCommunity._() : _dio = Dio();

  static final _instance = SteamCommunity._();

  final Dio _dio;

  /// Get the Steam Profile.
  Future<ProfileData?> profile(String steamId) async {
    final response = await _dio.getUri(
      Uri.https('steamcommunity.com', 'profiles/$steamId', {'xml': '1'}),
    );
    if (response.statusCode == HttpStatus.ok) {
      final document = XmlDocument.parse(response.data);
      return ProfileData(
        steamID64: int.parse(document.rootElement.getElement('steamID64')!.innerText),
        steamID: document.rootElement.getElement('steamID')!.innerText,
        onlineState: document.rootElement.getElement('onlineState')!.innerText,
        stateMessage: document.rootElement.getElement('stateMessage')!.innerText,
        privacyState: document.rootElement.getElement('privacyState')!.innerText,
        visibilityState: int.parse(document.rootElement.getElement('visibilityState')!.innerText),
        avatarIcon: document.rootElement.getElement('avatarIcon')!.innerText,
        avatarMedium: document.rootElement.getElement('avatarMedium')!.innerText,
        avatarFull: document.rootElement.getElement('avatarFull')!.innerText,
        vacBanned: int.parse(document.rootElement.getElement('vacBanned')!.innerText),
        tradeBanState: document.rootElement.getElement('tradeBanState')!.innerText,
        isLimitedAccount: int.parse(document.rootElement.getElement('isLimitedAccount')!.innerText),
        inGameServerIP: document.rootElement.getElement('inGameServerIP')?.innerText,
        inGameInfo: InGameInfo(
          gameName: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameName')
              ?.innerText,
          gameLink: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameLink')
              ?.innerText,
          gameIcon: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameIcon')
              ?.innerText,
          gameLogo: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameLogo')
              ?.innerText,
          gameLogoSmall: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameLogoSmall')
              ?.innerText,
          gameJoinLink: document.rootElement
              .getElement('inGameInfo')
              ?.getElement('gameJoinLink')
              ?.innerText,
        ),
        memberSince: document.rootElement.getElement('memberSince')?.innerText,
        hoursPlayed2Wk: document.rootElement.getElement('hoursPlayed2Wk')?.innerText,
        location: document.rootElement.getElement('location')?.innerText,
        realname: document.rootElement.getElement('realname')?.innerText,
      );
    }
    return null;
  }

  /// Get the Steam Profile nicknames history.
  Future<List<Alias>?> aliases(String steamId) async {
    final response = await _dio.getUri(
      Uri.https('steamcommunity.com', 'profiles/$steamId/ajaxaliases', {'l': 'english'}),
    );
    if (response.statusCode == HttpStatus.ok) {
      return List<Alias>.from(response.data.map((json) => Alias.fromJson(json)).toList());
    }
    return null;
  }

  /// Get the Steam Mini Profile.
  Future<SteamMiniProfile?> miniProfile(String steamId64) async {
    final steamId32 = convertSteamId64ToSteamId32(steamId64);
    final response = await _dio.getUri(
      Uri.https('steamcommunity.com', 'miniprofile/$steamId32/json', {'l': 'english'}),
    );
    if (response.statusCode == HttpStatus.ok) {
      return SteamMiniProfile.fromJson(response.data);
    }
    return null;
  }
}
