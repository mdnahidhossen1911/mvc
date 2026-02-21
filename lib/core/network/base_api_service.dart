import 'network_api_service.dart';

abstract class BaseApiService {
  Future<dynamic> getRequest(String url);

  Future<dynamic> postRequest(String url, dynamic data);

  Future<dynamic> postFilesAndDataRequest(
      String url,
      List<FileData> filesData,
      Map<String, dynamic> data,
      );

  Future<dynamic> deleteRequest(String url);

  Future<dynamic> patchRequest(String url, dynamic data);

  Future<dynamic> patchFileRequest(String url, FileData fileData);

  Future<dynamic> putRequest(String url, dynamic data);

  Future<dynamic> patchFileAndDataRequest(
      String url,
      List<FileData>? filesData,
      Map<String, dynamic>? data,
      );
}