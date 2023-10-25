/// Model class for Random Dog Image Response
class RandomDogImageResponseModel {
  String? imageUrl;
  String? status;

  RandomDogImageResponseModel({this.imageUrl, this.status});

  RandomDogImageResponseModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = imageUrl;
    data['status'] = status;
    return data;
  }
}
