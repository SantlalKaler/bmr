import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../controllers/conectivity_controller.dart';
import '../ui/elements/app_snackbar.dart';
import 'app_urls.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 120000));
  }

  var timeout = 30000;

  //get method supports additional headers & authrization
  Future<Response?> get(String path,
      {bool? isAuthorized,
      Map<String, dynamic>? additionalHeaders,
      bool? customBaseURI}) async {
    ConnectivityController connectivityController = getx.Get.find();
    if (connectivityController.isInternetAvailable.isTrue) {
      final Map<String, dynamic> headers = {};
      if (isAuthorized == true) {
        // var user = await PrefData.getUser();
        // headers['Authorization'] = '${user!.authToken}';
      }
      try {
        final response = await _dio.get(
            customBaseURI == null ? (AppUrls.baseUrl + path) : path,
            options:
                Options(headers: headers, sendTimeout: Duration(minutes: 5)));
        return response;
      } catch (error) {
        _handleError(error);
        rethrow;
      }
    } else {
      AppSnackBar.showSnackBar(
        'No connection available',
      );
      return null;
    }
  }

  //post method supports additional headers & authrization
  Future<Response?> post(String path, dynamic data,
      {bool? isAuthorized,
      bool hasQueryParam = false,
      Map<String, dynamic>? queryParam,
      Map<String, dynamic>? additionalHeaders,
      bool? customBaseURI}) async {
    ConnectivityController connectivityController = getx.Get.find();
    if (connectivityController.isInternetAvailable.isTrue) {
      Map<String, dynamic> headers = {};

      if (isAuthorized == true) {
        // var user = await PrefData.getUser();
        // headers['Authorization'] = '${user!.authToken}';
      }
      if (additionalHeaders != null) {
        headers.addAll(additionalHeaders);
      }

      try {
        /*const contentType = */ /*isFormUrlEncoded
            ? Headers.formUrlEncodedContentType
            :*/ /* Headers.formUrlEncodedContentType;*/

        final options = Options(
          headers: headers,
          // contentType: contentType, // <--- here
          sendTimeout: const Duration(minutes: 5),
        );

        final response = hasQueryParam
            ? await _dio.post(
                customBaseURI == null ? (AppUrls.baseUrl + path) : path,
                queryParameters: queryParam,
                data: data,
                options: options)
            : await _dio.post(
                customBaseURI == null ? (AppUrls.baseUrl + path) : path,
                data: data,
                options: Options(headers: headers));
        return response;
      } catch (error) {
        _handleError(error);
        rethrow;
      }
    } else {
      AppSnackBar.showSnackBar('No connection available');
      return null;
    }
  }

  void _handleError(dynamic error) {
    if (error is DioError) {
      final dioError = error;
      if (dioError.response != null) {
        // Handle DioError with a response (e.g., server returned an error)
        // final errorMessage = dioError.response!.data.toString();
        AppSnackBar.showSnackBar('An unexpected error occurred.');
      } else {
        // Handle DioError without a response (e.g., network connectivity issue)

        AppSnackBar.showSnackBar(
          'Network error. Please check your connection.',
        );
      }
    } else {
      // Handle generic errors (e.g., unexpected errors)
      AppSnackBar.showSnackBar('An unexpected error occurred.');
    }
  }
}
