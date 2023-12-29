class DoubanTopModel {
  int? count = 20;
  int? start;
  int? total;
  List<Subjects>? subjects;
  String? title;

  DoubanTopModel(
      {this.count, this.start, this.total, this.subjects, this.title});

  DoubanTopModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(Subjects.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['start'] = start;
    data['total'] = total;
    if (subjects != null) {
      data['subjects'] = subjects!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    return data;
  }
}

class Subjects {
  Rating? rating;
  List<String>? genres;
  String? title;
  List<Casts>? casts;
  List<String>? durations;
  int? collectCount;
  String? mainlandPubdate;
  bool? hasVideo;
  String? originalTitle;
  String? subtype;
  List<Casts>? directors;
  List<String>? pubdates;
  String? year;
  Avatars? images;
  String? alt;
  String? id;

  Subjects(
      {this.rating,
      this.genres,
      this.title,
      this.casts,
      this.durations,
      this.collectCount,
      this.mainlandPubdate,
      this.hasVideo,
      this.originalTitle,
      this.subtype,
      this.directors,
      this.pubdates,
      this.year,
      this.images,
      this.alt,
      this.id});

  Subjects.fromJson(Map<String, dynamic> json) {
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    genres = json['genres'].cast<String>();
    title = json['title'];
    if (json['casts'] != null) {
      casts = <Casts>[];
      json['casts'].forEach((v) {
        casts!.add(Casts.fromJson(v));
      });
    }
    durations = json['durations'].cast<String>();
    collectCount = json['collect_count'];
    mainlandPubdate = json['mainland_pubdate'];
    hasVideo = json['has_video'];
    originalTitle = json['original_title'];
    subtype = json['subtype'];
    if (json['directors'] != null) {
      directors = <Casts>[];
      json['directors'].forEach((v) {
        directors!.add(Casts.fromJson(v));
      });
    }
    pubdates = json['pubdates'].cast<String>();
    year = json['year'];
    images = json['images'] != null ? Avatars.fromJson(json['images']) : null;
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    data['genres'] = genres;
    data['title'] = title;
    if (casts != null) {
      data['casts'] = casts!.map((v) => v.toJson()).toList();
    }
    data['durations'] = durations;
    data['collect_count'] = collectCount;
    data['mainland_pubdate'] = mainlandPubdate;
    data['has_video'] = hasVideo;
    data['original_title'] = originalTitle;
    data['subtype'] = subtype;
    if (directors != null) {
      data['directors'] = directors!.map((v) => v.toJson()).toList();
    }
    data['pubdates'] = pubdates;
    data['year'] = year;
    if (images != null) {
      data['images'] = images!.toJson();
    }
    data['alt'] = alt;
    data['id'] = id;
    return data;
  }
}

class Rating {
  int? max;
  double? average;
  Details? details;
  String? stars;
  int? min;

  Rating({this.max, this.average, this.details, this.stars, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    average = json['average'];
    details =
        json['details'] != null ? Details.fromJson(json['details']) : null;
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['max'] = max;
    data['average'] = average;
    if (details != null) {
      data['details'] = details!.toJson();
    }
    data['stars'] = stars;
    data['min'] = min;
    return data;
  }
}

class Details {
  int? i1;
  int? i2;
  int? i3;
  int? i4;
  int? i5;

  Details({this.i1, this.i2, this.i3, this.i4, this.i5});

  Details.fromJson(Map<String, dynamic> json) {
    i1 = json['1'];
    i2 = json['2'];
    i3 = json['3'];
    i4 = json['4'];
    i5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = i1;
    data['2'] = i2;
    data['3'] = i3;
    data['4'] = i4;
    data['5'] = i5;
    return data;
  }
}

class Casts {
  Avatars? avatars;
  String? nameEn;
  String? name;
  String? alt;
  String? id;

  Casts({this.avatars, this.nameEn, this.name, this.alt, this.id});

  Casts.fromJson(Map<String, dynamic> json) {
    avatars =
        json['avatars'] != null ? Avatars.fromJson(json['avatars']) : null;
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (avatars != null) {
      data['avatars'] = avatars!.toJson();
    }
    data['name_en'] = nameEn;
    data['name'] = name;
    data['alt'] = alt;
    data['id'] = id;
    return data;
  }
}

class Avatars {
  String? small;
  String? large;
  String? medium;

  Avatars({this.small, this.large, this.medium});

  Avatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['small'] = small;
    data['large'] = large;
    data['medium'] = medium;
    return data;
  }
}
