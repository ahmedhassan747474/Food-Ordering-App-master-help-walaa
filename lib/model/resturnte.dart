class Restaurants {
  int id;
  String name;
  String city;
  String lat;
  String lng;
  String phone;
  String image;
  int rating;

  Restaurants(
      {this.id,
      this.name,
      this.city,
      this.lat,
      this.lng,
      this.phone,
      this.image,
      this.rating});

  Restaurants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    lat = json['lat'];
    lng = json['lng'];
    phone = json['phone'];
    image = json['image'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['rating'] = this.rating;
    return data;
  }
}
