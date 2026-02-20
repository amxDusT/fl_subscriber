import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/{{feature_name}}_model.freezed.dart';
part 'generated/{{feature_name}}_model.g.dart';

@freezed
abstract class {{feature_name.pascalCase()}}Model with _${{feature_name.pascalCase()}}Model {
  const factory {{feature_name.pascalCase()}}Model() = _{{feature_name.pascalCase()}}Model;
  factory {{feature_name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{feature_name.pascalCase()}}ModelFromJson(json);
}
