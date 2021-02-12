class RocketList {
  final List<RocketModel> rocketList;
  RocketList({this.rocketList});

  factory RocketList.fromData(List data) {
    var list = data;
    List<RocketModel> newList =
        list.map((i) => RocketModel.fromData(i)).toList();
    return RocketList(rocketList: newList);
  }
}

class RocketModel {
  final String name;
  final bool active;

  RocketModel({this.active, this.name});

  factory RocketModel.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    return RocketModel(
      name: data["rocket_name"],
      active: data["active"],
    );
  }
}
