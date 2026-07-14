/// Converts a 64-bit SteamID (SteamID64) string to a 32-bit SteamID (Account ID).
int convertSteamId64ToSteamId32(String steamId64) {
  final steamId64_ = int.tryParse(steamId64);
  if (steamId64_ == null) {
    throw ArgumentError('Invalid number.');
  }
  const int steamId64Identifier = 76561197960265728;
  if (steamId64_ < steamId64Identifier) {
    throw ArgumentError('Invalid SteamID64');
  }
  return steamId64_ - steamId64Identifier;
}
