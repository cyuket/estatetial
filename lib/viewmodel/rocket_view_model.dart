import 'package:dartz/dartz.dart';
import 'package:estatetial/locator.dart';
import 'package:estatetial/model/rocket_model.dart';
import 'package:estatetial/services/api_service.dart';
import 'package:estatetial/viewmodel/base_model.dart';

class RocketViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();

  List<RocketModel> _list = [];

  List<RocketModel> get rockets => _list;

  Future<Either<String, List<RocketModel>>> fetchRockets() async {
    setBusy(true);

    final response = await _apiService.fetchRocket();

    response.fold((l) => print(l), (r) {
      _list = r;
    });

    setBusy(false);
    return response;
  }
}
