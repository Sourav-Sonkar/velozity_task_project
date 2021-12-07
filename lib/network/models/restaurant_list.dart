
class RestaurantList {
  List<Result>? result;

  RestaurantList({this.result});

  RestaurantList.fromJson(Map<String, dynamic> json) {
    if(json["result"] is List) {
      result = json["result"]==null ? null : (json["result"] as List).map((e)=>Result.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(result != null) {
      data["result"] = result!.map((e)=>e.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? id;
  String? name;
  Location? location;
  List<OpenHours>? openHours;
  List<String> ?tags;
  String? address;
  String? searchResultType;
  List<int>? phoneNumber;
  List<String>? images;
  List<String>? menuImages;
  List<String>? features;
  AverageRatings? averageRatings;
  LatestOffer? latestOffer;
  int? averagePrice;
  int? averagePricePerMembers;
  Distance? distance;
  EstimatedDeliveryTime? estimatedDeliveryTime;

  Result({this.id, this.name, this.location, this.openHours, this.tags, this.address, this.searchResultType, this.phoneNumber, this.images, this.menuImages, this.features, this.averageRatings, this.latestOffer, this.averagePrice, this.averagePricePerMembers, this.distance, this.estimatedDeliveryTime});

  Result.fromJson(Map<String, dynamic> json) {
    if(json["_id"] is String) {
      id = json["_id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["location"] is Map) {
      location = json["location"] == null ? null : Location.fromJson(json["location"]);
    }
    if(json["openHours"] is List) {
      openHours = json["openHours"]==null ? null : (json["openHours"] as List).map((e)=>OpenHours.fromJson(e)).toList();
    }
    if(json["tags"] is List) {
      tags = json["tags"]==null ? null : List<String>.from(json["tags"]);
    }
    if(json["address"] is String) {
      address = json["address"];
    }
    if(json["searchResultType"] is String) {
      searchResultType = json["searchResultType"];
    }
    if(json["phoneNumber"] is List) {
      phoneNumber = json["phoneNumber"]==null ? null : List<int>.from(json["phoneNumber"]);
    }
    if(json["images"] is List) {
      images = json["images"]==null ? null : List<String>.from(json["images"]);
    }
    if(json["menuImages"] is List) {
      menuImages = json["menuImages"]==null ? null : List<String>.from(json["menuImages"]);
    }
    if(json["features"] is List) {
      features = json["features"]==null ? null : List<String>.from(json["features"]);
    }
    if(json["averageRatings"] is Map) {
      averageRatings = json["averageRatings"] == null ? null : AverageRatings.fromJson(json["averageRatings"]);
    }
    if(json["latestOffer"] is Map) {
      latestOffer = json["latestOffer"] == null ? null : LatestOffer.fromJson(json["latestOffer"]);
    }
    if(json["averagePrice"] is int) {
      averagePrice = json["averagePrice"];
    }
    if(json["averagePricePerMembers"] is int) {
      averagePricePerMembers = json["averagePricePerMembers"];
    }
    if(json["distance"] is Map) {
      distance = json["distance"] == null ? null : Distance.fromJson(json["distance"]);
    }
    if(json["estimatedDeliveryTime"] is Map) {
      estimatedDeliveryTime = json["estimatedDeliveryTime"] == null ? null : EstimatedDeliveryTime.fromJson(json["estimatedDeliveryTime"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["name"] = name;
    if(location != null) {
      data["location"] = location!.toJson();
    }
    if(openHours != null) {
      data["openHours"] = openHours!.map((e)=>e.toJson()).toList();
    }
    if(tags != null) {
      data["tags"] = tags;
    }
    data["address"] = address;
    data["searchResultType"] = searchResultType;
    if(phoneNumber != null) {
      data["phoneNumber"] = phoneNumber;
    }
    if(images != null) {
      data["images"] = images;
    }
    if(menuImages != null) {
      data["menuImages"] = menuImages;
    }
    if(features != null) {
      data["features"] = features;
    }
    if(averageRatings != null) {
      data["averageRatings"] = averageRatings!.toJson();
    }
    if(latestOffer != null) {
      data["latestOffer"] = latestOffer!.toJson();
    }
    data["averagePrice"] = averagePrice;
    data["averagePricePerMembers"] = averagePricePerMembers;
    if(distance != null) {
      data["distance"] = distance!.toJson();
    }
    if(estimatedDeliveryTime != null) {
      data["estimatedDeliveryTime"] = estimatedDeliveryTime!.toJson();
    }
    return data;
  }
}

class EstimatedDeliveryTime {
  int? value;
  String? unit;

  EstimatedDeliveryTime({this.value, this.unit});

  EstimatedDeliveryTime.fromJson(Map<String, dynamic> json) {
    if(json["value"] is int) {
      value = json["value"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["unit"] = unit;
    return data;
  }
}

class Distance {
  Calculated? calculated;

  Distance({this.calculated});

  Distance.fromJson(Map<String, dynamic> json) {
    if(json["calculated"] is Map) {
      calculated = json["calculated"] == null ? null : Calculated.fromJson(json["calculated"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(calculated != null) {
      data["calculated"] = calculated!.toJson();
    }
    return data;
  }
}

class Calculated {
  double? value;
  String? unit;

  Calculated({this.value, this.unit});

  Calculated.fromJson(Map<String, dynamic> json) {
    if(json["value"] is double) {
      value = json["value"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["unit"] = unit;
    return data;
  }
}

class LatestOffer {
  String? promoCode;
  int? percentage;
  int? maxDeduction;
  int? minOrderAmount;
  String? expiresAt;
  String? label;
  String? description;

  LatestOffer({this.promoCode, this.percentage, this.maxDeduction, this.minOrderAmount, this.expiresAt, this.label, this.description});

  LatestOffer.fromJson(Map<String, dynamic> json) {
    if(json["promoCode"] is String) {
      promoCode = json["promoCode"];
    }
    if(json["percentage"] is int) {
      percentage = json["percentage"];
    }
    if(json["maxDeduction"] is int) {
      maxDeduction = json["maxDeduction"];
    }
    if(json["minOrderAmount"] is int) {
      minOrderAmount = json["minOrderAmount"];
    }
    if(json["expiresAt"] is String) {
      expiresAt = json["expiresAt"];
    }
    if(json["label"] is String) {
      label = json["label"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["promoCode"] = promoCode;
    data["percentage"] = percentage;
    data["maxDeduction"] = maxDeduction;
    data["minOrderAmount"] = minOrderAmount;
    data["expiresAt"] = expiresAt;
    data["label"] = label;
    data["description"] = description;
    return data;
  }
}

class AverageRatings {
  Delivery? delivery;
  Dining? dining;
  TakeAway? takeAway;

  AverageRatings({this.delivery, this.dining, this.takeAway});

  AverageRatings.fromJson(Map<String, dynamic> json) {
    if(json["DELIVERY"] is Map) {
      delivery = json["DELIVERY"] == null ? null : Delivery.fromJson(json["DELIVERY"]);
    }
    if(json["DINING"] is Map) {
      dining = json["DINING"] == null ? null : Dining.fromJson(json["DINING"]);
    }
    if(json["TAKE_AWAY"] is Map) {
      takeAway = json["TAKE_AWAY"] == null ? null : TakeAway.fromJson(json["TAKE_AWAY"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(delivery != null) {
      data["DELIVERY"] = delivery!.toJson();
    }
    if(dining != null) {
      data["DINING"] = dining?.toJson();
    }
    if(takeAway != null) {
      data["TAKE_AWAY"] = takeAway?.toJson();
    }
    return data;
  }
}

class TakeAway {
  String? mode;
  int? value;
  int? totalRatings;
  String? id;

  TakeAway({this.mode, this.value, this.totalRatings, this.id});

  TakeAway.fromJson(Map<String, dynamic> json) {
    if(json["mode"] is String) {
      mode = json["mode"];
    }
    if(json["value"] is int) {
      value = json["value"];
    }
    if(json["totalRatings"] is int) {
      totalRatings = json["totalRatings"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mode"] = mode;
    data["value"] = value;
    data["totalRatings"] = totalRatings;
    data["_id"] = id;
    return data;
  }
}

class Dining {
  String? mode;
  int? value;
  int? totalRatings;
  String? id;

  Dining({this.mode, this.value, this.totalRatings, this.id});

  Dining.fromJson(Map<String, dynamic> json) {
    if(json["mode"] is String) {
      mode = json["mode"];
    }
    if(json["value"] is int) {
      value = json["value"];
    }
    if(json["totalRatings"] is int) {
      totalRatings = json["totalRatings"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mode"] = mode;
    data["value"] = value;
    data["totalRatings"] = totalRatings;
    data["_id"] = id;
    return data;
  }
}

class Delivery {
  String? mode;
  int? value;
  int? totalRatings;
  String? id;

  Delivery({this.mode, this.value, this.totalRatings, this.id});

  Delivery.fromJson(Map<String, dynamic> json) {
    if(json["mode"] is String) {
      mode = json["mode"];
    }
    if(json["value"] is int) {
      value = json["value"];
    }
    if(json["totalRatings"] is int) {
      totalRatings = json["totalRatings"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["mode"] = mode;
    data["value"] = value;
    data["totalRatings"] = totalRatings;
    data["_id"] = id;
    return data;
  }
}

class OpenHours {
  String? dayLabel;
  String? timingLabel;
  String? openingTime;
  String? closingTime;
  String? id;

  OpenHours({this.dayLabel, this.timingLabel, this.openingTime, this.closingTime, this.id});

  OpenHours.fromJson(Map<String, dynamic> json) {
    if(json["dayLabel"] is String) {
      dayLabel = json["dayLabel"];
    }
    if(json["timingLabel"] is String) {
      timingLabel = json["timingLabel"];
    }
    if(json["openingTime"] is String) {
      openingTime = json["openingTime"];
    }
    if(json["closingTime"] is String) {
      closingTime = json["closingTime"];
    }
    if(json["_id"] is String) {
      id = json["_id"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["dayLabel"] = dayLabel;
    data["timingLabel"] = timingLabel;
    data["openingTime"] = openingTime;
    data["closingTime"] = closingTime;
    data["_id"] = id;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["coordinates"] is List) {
      coordinates = json["coordinates"]==null ? null : List<double>.from(json["coordinates"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["type"] = type;
    if(coordinates != null) {
      data["coordinates"] = coordinates;
    }
    return data;
  }
}