import 'package:fl_subscriber/core/resources/dio_client.dart';

abstract class AuthLocalDatasource {}

class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  // Implementazione del datasource locale
  AuthLocalDatasourceImpl(this._dioClient);

  final DioClient _dioClient;

  void someMethod() {
    _dioClient; // Utilizzo di DioClient
  }
}
