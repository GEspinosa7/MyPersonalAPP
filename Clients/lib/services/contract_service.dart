import 'package:MyPersonal/models/contract_model.dart';
import 'package:MyPersonal/utils/http.dart';

class ContractService {
  final _dio = Http.instance;

  Future<ContractModel> createContract(ContractModel contract) async {
    final resp = await _dio.post('/contracts', data: contract.toJson());
  
    return ContractModel.fromJson(resp.data);
  }

  Future<ContractModel> getContract() async {
    final resp = await _dio.get('/contracts');
  
    if (resp.data.length > 0)
      return ContractModel.fromJson(resp.data[0]);
    else
      return null;
  }
}