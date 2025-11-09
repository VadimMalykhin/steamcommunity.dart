import 'package:equatable/equatable.dart';

class Alias extends Equatable {
  const Alias({
    this.newName,
    this.timeChanged,
  });

  factory Alias.fromJson(Map<String, dynamic> json) {
    return Alias(
      newName: json['newname'] ?? '',
      timeChanged: json['timechanged'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'newname': newName,
      'timechanged': timeChanged,
    };
  }

  final String? newName;
  final String? timeChanged;

  @override
  String toString() {
    return 'Alias(newname: $newName, timechanged: $timeChanged)';
  }

  @override
  List<Object?> get props => [
    newName,
    timeChanged,
  ];
}
