import 'package:dartz/dartz.dart';
import 'package:estatetial/locator.dart';
import 'package:estatetial/model/launch_model.dart';
import 'package:estatetial/services/api_service.dart';
import 'package:estatetial/viewmodel/base_model.dart';

class LaunchesViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();

  List<LaunchModel> _list = [];

  List<LaunchModel> get launches => _list;

  Future<Either<String, List<LaunchModel>>> fetchLaunches() async {
    setBusy(true);

    final response = await _apiService.fetchLaunches();

    response.fold((l) => print(l), (r) {
      _list = r;
    });

    setBusy(false);
    return response;
  }
}
