import 'package:{{packageName}}/core/resources/dio_client.dart';


abstract class {{feature_name.pascalCase()}}Datasource {}

class {{feature_name.pascalCase()}}DatasourceImpl extends {{feature_name.pascalCase()}}Datasource {
  // Implementazione del datasource
  {{feature_name.pascalCase()}}DatasourceImpl(this._dioClient);

  final DioClient _dioClient;

  void someMethod() {
    _dioClient; // Utilizzo di DioClient
  }
}