import 'package:steamcommunity/steamcommunity.dart';

Future<void> main() async {
  final aliasesData = await SteamCommunity().aliases('76561198842603734');
  print('aliasesData: $aliasesData');
}
