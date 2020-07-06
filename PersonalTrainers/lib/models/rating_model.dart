import 'client_model.dart';

class RatingModel {
  int id;
  String ratingDate;
  double ratingValue;
  String textRating;
  String fullRating;
  String createdAt;
  String updatedAt;
  int clientId;
  int trainerId;
  ClientModel client;

  RatingModel(
      {this.id,
      this.ratingDate,
      this.ratingValue,
      this.textRating,
      this.fullRating,
      this.createdAt,
      this.updatedAt,
      this.clientId,
      this.trainerId,
      this.client});

  RatingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ratingDate = json['rating_date'];
    ratingValue = json['rating_value'];
    textRating = json['text_rating'];
    fullRating = json['full_rating'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    trainerId = json['trainer_id'];

    if (json['client'] != null) {
      client = ClientModel.fromJson(json['client']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating_date'] = this.ratingDate;
    data['rating_value'] = this.ratingValue;
    data['text_rating'] = this.textRating;
    data['full_rating'] = this.fullRating;
    data['client_id'] = this.clientId;
    data['trainer_id'] = this.trainerId;
    return data;
  }
}
