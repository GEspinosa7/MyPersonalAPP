import 'package:dio/dio.dart';
import 'package:my_personal_personaltrainer/models/rating_model.dart';
import 'package:my_personal_personaltrainer/utils/http.dart';

class RatingService {
  final _dio = Http.instance;

  Future<RatingModel> createRating(RatingModel rating, String uid) async {
    final resp = await _dio.post('/ratings',
        data: rating.toJson(), options: Options(headers: {'token': uid}));

    return RatingModel.fromJson(resp.data);
  }

  Future<List<RatingModel>> getRatings(String uid) async {
    final resp =
        await _dio.get('/ratings', options: Options(headers: {'token': uid}));

    return List<RatingModel>.from(
        resp.data.map((r) => RatingModel.fromJson(r)));
  }

  Future<RatingModel> getRating(String uid) async {
    final resp =
        await _dio.get('/ratings', options: Options(headers: {'token': uid}));

    if (resp.data.length > 0)
      return RatingModel.fromJson(resp.data[0]);
    else
      return null;
  }
}
