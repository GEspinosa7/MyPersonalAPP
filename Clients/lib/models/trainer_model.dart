import 'package:MyPersonal/models/rating_model.dart';

class TrainerModel {
  int id;
  String name;
  String lastname;
  String birthDate;
  String timeActing;
  String qualifications;
  String availability;
  String price;
  String uid;
  String createdAt;
  String updatedAt;
  List<RatingModel> ratings;

  TrainerModel(
      {this.id,
      this.name,
      this.lastname,
      this.birthDate,
      this.timeActing,
      this.qualifications,
      this.availability,
      this.price,
      this.uid,
      this.createdAt,
      this.updatedAt,
      this.ratings});

  TrainerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    birthDate = json['birth_date'];
    timeActing = json['time_acting'];
    qualifications = json['qualifications'];
    availability = json['availability'];
    price = json['price'];
    uid = json['uid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['ratings'] != null) {
      ratings = new List<RatingModel>();
      json['ratings'].forEach((v) {
        ratings.add(new RatingModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['birth_date'] = this.birthDate;
    data['time_acting'] = this.timeActing;
    data['qualifications'] = this.qualifications;
    data['availability'] = this.availability;
    data['price'] = this.price;
    data['uid'] = this.uid;
    return data;
  }
}

// class Rating {
//   int id;
//   String ratingDate;
//   double ratingValue;
//   String textRating;
//   String fullRating;
//   String createdAt;
//   String updatedAt;
//   int clientId;
//   int trainerId;
//   ClientModel client;

//   Rating(
//       {this.id,
//       this.ratingDate,
//       this.ratingValue,
//       this.textRating,
//       this.fullRating,
//       this.createdAt,
//       this.updatedAt,
//       this.clientId,
//       this.trainerId,
//       this.client});

//   Rating.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     ratingDate = json['rating_date'];
//     ratingValue = json['rating_value'];
//     textRating = json['text_rating'];
//     fullRating = json['full_rating'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     clientId = json['client_id'];
//     trainerId = json['trainer_id'];

//     if (json['client'] != null) {
//       client = ClientModel.fromJson(json['client']);
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['rating_date'] = this.ratingDate;
//     data['rating_value'] = this.ratingValue;
//     data['text_rating'] = this.textRating;
//     data['full_rating'] = this.fullRating;
//     data['client_id'] = this.clientId;
//     data['trainer_id'] = this.trainerId;
//     return data;
//   }
// }
