import 'package:my_personal_personaltrainer/models/trainer_model.dart';

import 'client_model.dart';

class ContractModel {
  int id;
  String startDate;
  String closeDate;
  String createdAt;
  String updatedAt;
  int clientId;
  int trainerId;
  ClientModel client;
  TrainerModel trainer;

  ContractModel(
      {this.id,
      this.startDate,
      this.closeDate,
      this.createdAt,
      this.updatedAt,
      this.clientId,
      this.trainerId,
      this.client,
      this.trainer});

  ContractModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    closeDate = json['close_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    clientId = json['client_id'];
    trainerId = json['trainer_id'];

    if (json['client'] != null) {
      client = ClientModel.fromJson(json['client']);
    }

    if (json['trainer'] != null) {
      trainer = TrainerModel.fromJson(json['trainer']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_date'] = this.startDate;
    data['close_date'] = this.closeDate;
    data['trainer_id'] = this.trainerId;
    return data;
  }
}
