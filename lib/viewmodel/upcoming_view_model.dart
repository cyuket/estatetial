import 'package:dartz/dartz.dart';
import 'package:estatetial/locator.dart';
import 'package:estatetial/model/launch_model.dart';
import 'package:estatetial/services/api_service.dart';
import 'package:estatetial/viewmodel/base_model.dart';

class UpcomingViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();

  LaunchModel _launchModel;

  LaunchModel get upcoming => _launchModel;

  Future<Either<String, LaunchModel>> fetchUpcoming() async {
    setBusy(true);

    final response = await _apiService.fetchUpcoming();

    response.fold((l) => print(l), (r) {
      _launchModel = r;
    });

    setBusy(false);
    return response;
  }
}
