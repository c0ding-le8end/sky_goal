class SectionsObject {
  String? title;
  String? description;
  String? number;
  String? type;
  String? contentId;
  String? image;

  SectionsObject(
      {this.title,
        this.description,
        this.number,
        this.type,
        this.contentId,
        this.image});

  SectionsObject.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    number = json['number'];
    type = json['type'];
    contentId = json['content_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['number'] = this.number;
    data['type'] = this.type;
    data['content_id'] = this.contentId;
    data['image'] = this.image;
    return data;
  }
}
class DetailsObject {
  String? name;
  String? image1;
  String? image2;
  String? descSmall;
  String? descMedium;
  String? descLarge;
  String? trivia;
  String? rating;
  List<String>? hostelImages;
  String? location;
  Facilities? facilities;
  List<Reviews>? reviews;

  DetailsObject(
      {this.name,
        this.image1,
        this.image2,
        this.descSmall,
        this.descMedium,
        this.descLarge,
        this.trivia,
        this.rating,
        this.hostelImages,
        this.location,
        this.facilities,
        this.reviews});

  DetailsObject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image1 = json['image1'];
    image2 = json['image2'];
    descSmall = json['desc_small'];
    descMedium = json['desc_medium'];
    descLarge = json['desc_large'];
    trivia = json['trivia'];
    rating = json['rating'];
    hostelImages = json['hostel_images'].cast<String>();
    location = json['location'];
    facilities = json['facilities'] != null
        ? Facilities.fromJson(json['facilities'])
        : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['desc_small'] = this.descSmall;
    data['desc_medium'] = this.descMedium;
    data['desc_large'] = this.descLarge;
    data['trivia'] = this.trivia;
    data['rating'] = this.rating;
    data['hostel_images'] = this.hostelImages;
    data['location'] = this.location;
    if (this.facilities != null) {
      data['facilities'] = this.facilities!.toJson();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Facilities {
  String? distance;
  String? bathrooms;

  Facilities({this.distance, this.bathrooms});

  Facilities.fromJson(Map<String, dynamic> json) {
    distance = json['distance'];
    bathrooms = json['Bathrooms'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['distance'] = this.distance;
    data['Bathrooms'] = this.bathrooms;
    return data;
  }
}

class Reviews {
  String? name;
  String? review;
  int? fullStars;
  int? halfStars;
  String? image;

  Reviews({this.name, this.review, this.fullStars, this.halfStars, this.image});

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    review = json['review'];
    fullStars = json['full_stars'];
    halfStars = json['half_stars'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['review'] = this.review;
    data['full_stars'] = this.fullStars;
    data['half_stars'] = this.halfStars;
    data['image'] = this.image;
    return data;
  }
}
