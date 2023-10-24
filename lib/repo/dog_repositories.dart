import 'dart:convert';

import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/models/random_dog_image_response_model.dart';
import 'package:http/http.dart';

class DogRepositories {
  String getDogBreedsListEndpoint = 'https://dog.ceo/api/breeds/list/all';

  Future<BreedsResponseModel> getDogBreeds() async {
    Response response = await get(Uri.parse(getDogBreedsListEndpoint));

    if (response.statusCode == 200) {
      final result = BreedsResponseModel.fromJson(jsonDecode(response.body));
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<String> getRandomDogImage(String breedName) async {
    Response response = await get(Uri.parse("https://dog.ceo/api/breed/$breedName/images/random"));

    if (response.statusCode == 200) {
      final result = RandomDogImageResponseModel.fromJson(jsonDecode(response.body));
      if (result.status == "success" && result.message != null) {
        return result.message!;
      } else {
        throw Exception(result.status);
      }
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
