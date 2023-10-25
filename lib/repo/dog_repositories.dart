import 'dart:convert';

import 'package:dog_app/models/breeds_response_model.dart';
import 'package:dog_app/models/random_dog_image_response_model.dart';
import 'package:dog_app/repo/endpoints/endpoints.dart';
import 'package:http/http.dart';

/// DogRepositories is a class that manages the api calls of the dog app.
class DogRepositories {
  /// Get all dog breeds
  Future<BreedsResponseModel> getDogBreeds() async {
    try {
      Response response = await get(Uri.parse(Endpoints.getDogBreedsListEndpoint.url));

      if (response.statusCode == 200) {
        final result = BreedsResponseModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  /// Get random dog image
  Future<String> getRandomDogImage(String breedName) async {
    try {
      Response response = await get(Uri.parse("${Endpoints.baseEndpoint.url}/breed/$breedName/images/random"));

      if (response.statusCode == 200) {
        final result = RandomDogImageResponseModel.fromJson(jsonDecode(response.body));
        if (result.status == "success" && result.imageUrl != null) {
          return result.imageUrl!;
        } else {
          throw Exception(result.status);
        }
      } else {
        throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
