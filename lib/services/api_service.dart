import 'package:dartz/dartz.dart';
import 'package:estatetial/model/launch_model.dart';
import 'package:estatetial/model/rocket_model.dart';
import 'package:estatetial/utills/http.dart';

class ApiService {
  Future<Either<String, List<LaunchModel>>> fetchLaunches() async {
    try {
      final launches = await fetchMethod("launches");
      List<LaunchModel> launchesList =
          LaunchesList.fromData(launches).launchesList;
      return Right(launchesList);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<RocketModel>>> fetchRocket() async {
    try {
      final rockets = await fetchMethod("rockets");
      List<RocketModel> rocketList = RocketList.fromData(rockets).rocketList;
      return Right(rocketList);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LaunchModel>> fetchUpcoming() async {
    try {
      final data = await fetchMethod("launches/next");
      print(data);
      LaunchModel upcoming = LaunchModel.fromData(data);
      return Right(upcoming);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
