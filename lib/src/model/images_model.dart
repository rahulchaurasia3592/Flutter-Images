class ImageModel {
  int id;
  String url;
  String title;

  ImageModel (this.id, this.url, this.title);

  ImageModel.parsedJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }

}