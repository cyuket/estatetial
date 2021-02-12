import 'package:flutter/material.dart';

class LaunchesList {
  final List<LaunchModel> launchesList;
  LaunchesList({this.launchesList});

  factory LaunchesList.fromData(List data) {
    var list = data;
    List<LaunchModel> newList =
        list.map((i) => LaunchModel.fromData(i)).toList();
    return LaunchesList(launchesList: newList);
  }
}

class LaunchModel {
  final String rocket;
  final String launchDate;
  final String launchSiteShort;
  final String launchSiteLong;
  final bool launchStatus;
  final String detail;
  final bool upcoming;
  final String rocketSummary;
  final String rocketType;
  final int firstStage;
  final dynamic secondStage;
  final String youtubeLink;
  final String reddit;
  final String image;
  final String name;
  final List<dynamic> images;

  LaunchModel({
    this.detail,
    this.firstStage,
    this.name,
    this.image,
    this.images,
    this.launchDate,
    this.launchSiteShort,
    this.launchSiteLong,
    this.launchStatus,
    this.reddit,
    this.rocket,
    this.rocketSummary,
    this.rocketType,
    this.secondStage,
    this.upcoming,
    this.youtubeLink,
  });

  factory LaunchModel.fromData(Map<String, dynamic> data) {
    if (data == null) return null;
    return LaunchModel(
      detail: data["details"],
      firstStage: data["rocket"]["first_stage"]["cores"][0]["flight"],
      image: data["links"]['mission_patch'],
      images: data["links"]['flickr_images'],
      launchDate: data["launch_date_local"],
      launchSiteShort: data["launch_site"]["site_name"],
      launchSiteLong: data["launch_site"]["site_name_long"],
      launchStatus: data["launch_success"],
      reddit: data["links"]["reddit_campaign"],
      rocket: data["rocket"]["rocket_name"],
      rocketSummary: data["rocket"]["rocket_name"],
      rocketType: data["rocket"]["rocket_type"],
      secondStage: data["rocket"]["second_stage"]['payloads'][0]
          ["payload_mass_kg"],
      upcoming: data["upcoming"],
      youtubeLink: data["links"]["video_link"],
      name: data["mission_name"],
    );
  }
}
