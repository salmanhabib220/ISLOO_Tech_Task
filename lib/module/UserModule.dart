class UserModel {
  var id;
  var price;
  var title;
  var image;
  var description;

  UserModel(this.id, this.title,  this.price, this.image, this.description);
}

class PlaceSearch {
  final String description;
  final String placeId;

  PlaceSearch({required this.description, required this.placeId});

  factory PlaceSearch.fromJson(Map<String, dynamic> json) {
    return PlaceSearch(description: json['description'], 
    placeId: json['place_id']
    );
  }
}