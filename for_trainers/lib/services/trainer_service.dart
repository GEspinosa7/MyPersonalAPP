
import 'package:dio/dio.dart';
import 'package:my_personal_personaltrainer/models/trainer_model.dart';
import 'package:my_personal_personaltrainer/utils/http.dart';

class TrainerService {
  final _dio = HttpClient.instance;


  Future<TrainerModel> createTrainerProfile(TrainerModel trainerProfile) async {
    final resp = await _dio.post('/trainers', data: trainerProfile.toJson());
  
    return TrainerModel.fromJson(resp.data);
  }

    Future<TrainerModel> getTrainerProfile(String uid) async {
      final resp = await _dio.get('/trainers/me', options: Options(headers: { 'token': uid }));
  
      return TrainerModel.fromJson(resp.data);
  } 
}

