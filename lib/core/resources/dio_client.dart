import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.example.com',
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.jsonContentType,
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          print('Dio Error: ${error.error}');
          handler.next(error);
        },
        onRequest: (options, handler) {
          print('Dio Request: ${options.method} ${options.path}');
          handler.next(options);
        },
      ),
    );
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  Exception _handleDioException(DioException e) {
    switch (e.type) {
      case .connectionTimeout:
      case .sendTimeout:
      case .receiveTimeout:
        return Exception(
          'La richiesta è andata in timeout. Riprova più tardi.',
        );
      case .connectionError:
        return Exception(
          'Nessuna connessione di rete. Verifica la tua connessione.',
        );
      case .badResponse:
        final statusCode = e.response?.statusCode;
        if (statusCode == 401) {
          return Exception('Accesso non autorizzato. Effettua il login.');
        }
        return Exception(
          e.response?.data?['message'] ??
              'Abbiamo un problema con i nostri servizi. Riprova più tardi.',
        );
      default:
        return Exception(
          e.message ??
              'Problema nel processare la richiesta. Riprova più tardi.',
        );
    }
  }
}
