import 'package:steamcommunity/steamcommunity.dart';

Future<void> main() async {
  final miniProfileData = await SteamCommunity().miniProfile('76561198842603734');
  print('miniProfileData: $miniProfileData');
}
