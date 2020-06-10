import 'package:MyPersonal/models/student_profile_model.dart';
import 'package:MyPersonal/utils/http.dart';
import 'package:dio/dio.dart';

class ProfileSService {
  final _dio = HttpClient.instance;

  Future<StudentProfileModel> criarProfile(StudentProfileModel profile) async {
    final resp = await _dio.post('/sprofiles', data: profile.toJson());

    return StudentProfileModel.fromJson(resp.data);
  }

  Future<StudentProfileModel> getProfile(String uid) async {
    final resp = await _dio.get('/sprofiles/me', options: Options(headers: { 'token': uid }));

    return StudentProfileModel.fromJson(resp.data);
  }
}