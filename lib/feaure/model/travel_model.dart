import 'package:vexana/vexana.dart';

class TravelModel extends INetworkModel<TravelModel> {
  String? job;
  String? name;
  String? photo;
  String? rentDay;
  String? rentPrice;
  String? upcomingBackground;
  String? upcomingFlag;
  String? upcomingPlace;

  TravelModel(
      {this.job,
      this.name,
      this.photo,
      this.rentDay,
      this.rentPrice,
      this.upcomingBackground,
      this.upcomingFlag,
      this.upcomingPlace});

  TravelModel.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    name = json['name'];
    photo = json['photo'];
    rentDay = json['rentDay'];
    rentPrice = json['rentPrice'];
    upcomingBackground = json['upcomingBackground'];
    upcomingFlag = json['upcomingFlag'];
    upcomingPlace = json['upcomingPlace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job'] = this.job;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['rentDay'] = this.rentDay;
    data['rentPrice'] = this.rentPrice;
    data['upcomingBackground'] = this.upcomingBackground;
    data['upcomingFlag'] = this.upcomingFlag;
    data['upcomingPlace'] = this.upcomingPlace;
    return data;
  }

  @override
  TravelModel fromJson(Map<String, dynamic> json) {
    return TravelModel.fromJson(json);
  }
}
