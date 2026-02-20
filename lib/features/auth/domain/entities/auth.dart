import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/auth.freezed.dart';
part 'generated/auth.g.dart';

@freezed
abstract class AuthData with _$AuthData {
  const factory AuthData({
    required String token,
    required String refreshToken,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}
