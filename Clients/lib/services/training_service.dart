import 'package:MyPersonal/models/training_model.dart';

import '../utils/http.dart';

class TrainingService {
  final _dio = Http.instance;

  Future<TrainingModel> createTraining(TrainingModel training) async {
    final resp = await _dio.post('/trainings', data: training.toJson());

    return TrainingModel.fromJson(resp.data);
  }

  Future<TrainingModel> getTraining() async {
    final resp = await _dio.get('/trainings');

    if (resp.data.length > 0)
      return TrainingModel.fromJson(resp.data[0]);
    else
      return null;
  }
}
