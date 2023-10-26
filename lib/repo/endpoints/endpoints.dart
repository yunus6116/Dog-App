/// Endpoints with base url for the API
enum Endpoints {
  baseEndpoint("https://dog.ceo/api"),
  getDogBreedsListEndpoint("https://dog.ceo/api/breeds/list/all");

  const Endpoints(this.url);
  final String url;
}
