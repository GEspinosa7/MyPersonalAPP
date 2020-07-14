import 'package:dio/dio.dart';
import 'package:my_personal_personaltrainer/models/client_model.dart';
import 'package:my_personal_personaltrainer/utils/http.dart';

class ClientService {
  final _dio = Http.instance;

  Future<ClientModel> getClientProfile(String uid) async {
    final resp = await _dio.get('/clients/me',
        options: Options(headers: {'token': uid}));

    return ClientModel.fromJson(resp.data);
  }

  Future<List<ClientModel>> getClients(String uid) async {
    final resp =
        await _dio.get('/clients', options: Options(headers: {'token': uid}));

    return List<ClientModel>.from(
        resp.data.map((t) => ClientModel.fromJson(t)));
  }
}
