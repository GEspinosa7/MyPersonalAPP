
import 'package:MyPersonal/models/trainer_model.dart';
import 'package:MyPersonal/utils/http.dart';
import 'package:dio/dio.dart';

class TrainerService {
  final _dio = Http.instance;

  Future<TrainerModel> getTrainerProfile(String uid) async {
    final resp = await _dio.get('/trainers/me', options: Options(headers: { 'token': uid }));

    return TrainerModel.fromJson(resp.data);
  }

  Future<List<TrainerModel>> getTrainers() async {
    final resp = await _dio.get('/trainers');

    return List<TrainerModel>.from(resp.data.map((t) => TrainerModel.fromJson(t)));
  } 
}