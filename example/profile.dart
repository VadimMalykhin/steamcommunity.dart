import 'package:steamcommunity/steamcommunity.dart';

Future<void> main() async {
  final profileData = await SteamCommunity().profile('76561198842603734');
  print('profileData: $profileData');
}
