import 'package:dio/dio.dart';
import 'package:my_personal_personaltrainer/models/contract_model.dart';
import 'package:my_personal_personaltrainer/utils/http.dart';

class ContractService {
  final _dio = Http.instance;

  Future<ContractModel> createContract(
      ContractModel contract, String uid) async {
    final resp = await _dio.post('/contracts',
        data: contract.toJson(), options: Options(headers: {'token': uid}));

    return ContractModel.fromJson(resp.data);
  }

  Future<ContractModel> getContract(String uid) async {
    final resp =
        await _dio.get('/contracts', options: Options(headers: {'token': uid}));

    if (resp.data.length > 0)
      return ContractModel.fromJson(resp.data[0]);
    else
      return null;
  }
}
