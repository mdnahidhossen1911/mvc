import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart' hide Response, MultipartFile;
import 'package:http/http.dart';
import 'package:mvc/view/auth/sign_in_view.dart';
import '../../controller/credential/credential_controller.dart';
import '../constants/app_urls.dart';
import '../error/app_exception.dart';
import '../utils/logger.dart';
import 'base_api_service.dart';

class FileData {
  final File file;
  final String fileName;

  FileData({required this.file, required this.fileName});
}

class NetworkApiService extends BaseApiService {
  final CredentialController _credentialController = CredentialController.to;

  bool _isRefreshing = false;
  int _retryCount = 0;
  static const int _maxRetries = 2;

  // GET request
  @override
  Future getRequest(String url) async {
    logger.i('GET Request to $url with token ${_credentialController.token}');
    try {
      final Response response = await get(
        Uri.parse(url),
        headers: _buildHeaders(),
      ).timeout(const Duration(seconds: 10));
      return await returnJson(response, () => getRequest(url));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    }
  }

  // POST request
  @override
  Future postRequest(String url, dynamic data) async {
    logger.i(
      'POST Request to $url with data: $data and token ${_credentialController.token}',
    );
    try {
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: _buildHeaders(),
      ).timeout(const Duration(seconds: 10));
      return await returnJson(response, () => postRequest(url, data));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    }
  }

  @override
  Future deleteRequest(String url) async {
    logger.i(
      'DELETE Request to $url with token ${_credentialController.token}',
    );
    try {
      final Response response = await delete(
        Uri.parse(url),
        headers: _buildHeaders(),
      ).timeout(const Duration(seconds: 10));
      return await returnJson(response, () => deleteRequest(url));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    }
  }

  @override
  Future postFilesAndDataRequest(
    String url,
    List<FileData> filesData,
    Map<String, dynamic> data,
  ) async {
    logger.i(
      'POST Multipart Request to $url with token ${_credentialController.token}',
    );
    try {
      final request = MultipartRequest('POST', Uri.parse(url));

      request.headers.addAll(_buildHeaders());

      for (var fileData in filesData) {
        request.files.add(
          await MultipartFile.fromPath(fileData.fileName, fileData.file.path),
        );
      }

      request.fields['data'] = jsonEncode(data);

      final streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);

      logger.i('Response Status: ${response.statusCode}');
      logger.i('Response Body: ${response.body}');

      return await returnJson(
        response,
        () => postFilesAndDataRequest(url, filesData, data),
      );
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    } catch (e) {
      rethrow;
    }
  }

  // PATCH request
  @override
  Future patchRequest(String url, dynamic data) async {
    logger.i(
      'PATCH Request to $url with data: $data and token ${_credentialController.token}',
    );
    try {
      final Response response = await patch(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: _buildHeaders(),
      ).timeout(const Duration(seconds: 10));
      return await returnJson(response, () => patchRequest(url, data));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    }
  }

  @override
  Future patchFileRequest(String url, FileData fileData) async {
    logger.i(
      'PATCH Multipart Request to $url with token ${_credentialController.token}',
    );
    try {
      final request = MultipartRequest('PATCH', Uri.parse(url));

      request.headers.addAll(_buildHeaders());

      request.files.add(
        await MultipartFile.fromPath(fileData.fileName, fileData.file.path),
      );

      final streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);

      logger.i('Response Status: ${response.statusCode}');
      logger.i('Response Body: ${response.body}');

      return await returnJson(response, () => patchFileRequest(url, fileData));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future putRequest(String url, data) async {
    logger.i(
      'PUT Request to $url with data: $data and token ${_credentialController.token}',
    );
    try {
      final Response response = await put(
        Uri.parse(url),
        body: jsonEncode(data),
        headers: _buildHeaders(),
      ).timeout(const Duration(seconds: 10));
      return await returnJson(response, () => putRequest(url, data));
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    }
  }

  @override
  Future<dynamic> patchFileAndDataRequest(
    String url,
    List<FileData>? filesData,
    Map<String, dynamic>? data,
  ) async {
    logger.i(
      'PATCH Multipart Request → $url | Token: ${_credentialController.token}',
    );

    try {
      final request = MultipartRequest('PATCH', Uri.parse(url));

      request.headers.addAll(_buildHeaders());

      if (filesData != null && filesData.isNotEmpty) {
        for (var fileData in filesData) {
          if (await fileData.file.exists()) {
            final multipartFile = await MultipartFile.fromPath(
              fileData.fileName,
              fileData.file.path,
            );
            request.files.add(multipartFile);
            logger.i('Attached: ${fileData.file.path}');
          } else {
            logger.w('File not found: ${fileData.file.path}');
          }
        }
      } else {
        logger.i('No image provided. Skipping file upload.');
      }

      if (data != null && data.isNotEmpty) {
        request.fields['data'] = jsonEncode(data);
        logger.i('JSON Data: $data');
      }

      final streamedResponse = await request.send();
      final response = await Response.fromStream(streamedResponse);

      logger.i('PATCH Response: ${response.statusCode}');
      logger.i('Response Body: ${response.body}');

      return await returnJson(
        response,
        () => patchFileAndDataRequest(url, filesData, data),
      );
    } on SocketException {
      throw FetchDataException('No Internet connection');
    } on FileSystemException catch (e) {
      throw FetchDataException('File error: ${e.message}');
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    } catch (e) {
      logger.e('PATCH Request failed: $e');
      rethrow;
    }
  }

  Future<bool> _refreshToken() async {
    if (_isRefreshing) {
      while (_isRefreshing) {
        await Future.delayed(const Duration(milliseconds: 100));
      }
      return _credentialController.token.isNotEmpty;
    }

    _isRefreshing = true;
    try {
      logger.i('Refreshing token...');
      final Response response = await get(
        Uri.parse(AppUrls.refreshToken),
        headers: {
          'Content-Type': 'application/json',
          'token': _credentialController.refreshToken,
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final newToken = jsonDecode(response.body)['data']['accessToken'];
        await _credentialController.updateAccessToken(newToken: newToken);
        logger.i('Token refreshed successfully!');
        return true;
      } else {
        logger.e('Refresh token failed: ${response.body}');
        return false;
      }
    } on TimeoutException {
      throw AppTimeoutException('Request timed out.');
    } catch (e) {
      logger.e('Refresh token error: $e');
      return false;
    } finally {
      _isRefreshing = false;
    }
  }

  Map<String, String> _buildHeaders() {
    final headers = {'Content-Type': 'application/json'};
    if (_credentialController.token.isNotEmpty) {
      headers['Authorization'] = _credentialController.token;
    }
    logger.i('Request Headers: $headers');
    return headers;
  }

  Future<dynamic> returnJson(Response response, Function retry) async {
    switch (response.statusCode) {
      case 200:
      case 201:
        _retryCount = 0;
        return jsonDecode(response.body);

      case 400:
        _retryCount = 0;
        throw BadRequestException(response.body.toString());

      case 404:
        _retryCount = 0;
        throw UnAuthorException(response.body.toString());

      case 401:
        if (_retryCount >= _maxRetries) {
          logger.e('Max retry attempts reached. Logging out.');
          _retryCount = 0;
          _isRefreshing = false;
          await _credentialController.clearUserData();
          Get.offAll(() => SignInView());
          throw UnAuthorException('Session Expired. Please log in again.');
        }

        if (_isRefreshing) {
          logger.w('Token refresh already in progress. Waiting...');
          while (_isRefreshing) {
            await Future.delayed(const Duration(milliseconds: 100));
          }
          if (_credentialController.token.isNotEmpty &&
              _retryCount <= _maxRetries) {
            return await retry();
          } else {
            throw UnAuthorException('Token refresh failed.');
          }
        }

        _retryCount++;
        logger.w(
          'Token expired (401). Attempting refresh... (Attempt $_retryCount/$_maxRetries)',
        );

        final bool refreshed = await _refreshToken();

        if (refreshed && _retryCount < _maxRetries) {
          logger.i(
            'Token refreshed successfully. Retrying original request...',
          );
          return await retry();
        } else {
          _retryCount = 0;
          await _credentialController.clearUserData();
          Get.offAll(() => SignInView());
          throw UnAuthorException('Failed to refresh token. Logging out.');
        }

      case 409:
        _retryCount = 0;
        throw ConflictException(response.body.toString());

      default:
        _retryCount = 0;
        throw UnIdentifyException(response.body.toString());
    }
  }
}
