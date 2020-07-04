import 'package:MyPersonal/models/client_profile_model.dart';
import 'package:MyPersonal/utils/http.dart';
import 'package:dio/dio.dart';

class ClientService {
  final _dio = Http.instance;

  Future<ClientModel> createClientProfile(ClientModel clientProfile) async {
    final resp = await _dio.post('/clients', data: clientProfile.toJson());

    return ClientModel.fromJson(resp.data);
  }

  Future<ClientModel> getClientProfile(String uid) async {
    final resp = await _dio.get('/clients/me',
        options: Options(headers: {'token': uid}));

    return ClientModel.fromJson(resp.data);
  }
}
