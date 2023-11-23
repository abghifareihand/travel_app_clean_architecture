import 'package:travel_app/features/destination/domain/entities/destination_entity.dart';

class DestinationModel extends DestinationEntity {
  const DestinationModel({
    required super.id,
    required super.name,
    required super.category,
    required super.cover,
    required super.rate,
    required super.rateCount,
    required super.location,
    required super.description,
    required super.images,
    required super.facilities,
  });

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      DestinationModel(
          id: json["id_user"],
          name: json["name"],
          category: json["category"],
          cover: json["cover"],
          rate: double.parse(json[
              "rate"]), // dari api String, diubah ke double saat di tampilan
          rateCount: int.parse(json[
              "rate_count"]), // dari api String, diubah ke int saat di tampilan
          location: json["location"],
          description: json["description"],
          images: (json["images"] as String).split(", "),
          facilities: (json["facilities"] as String).split(", "));

  // kalo untuk ngepost data ke api, gunakan ini karena saya tidak post ke api jadi tidak berlaku
  Map<String, dynamic> toJson() => {
        "id_user": id,
        "name": name,
        "category": category,
        "cover": cover,
        "rate":
            rate.toString(), // dari double diubah ke String saat di post ke api
        "rate_count": rateCount
            .toString(), // dari int diubah ke String saat di post ke api
        "location": location,
        "description": description,
        "images": images.join(
            ", "), // dari List<String> diubah ke String saat di post ke api
        "facilities": facilities.join(
            ", "), // dari List<String> diubah ke String saat di post ke api
      };

  DestinationEntity toEntity() => DestinationEntity(
        id: id,
        name: name,
        category: category,
        cover: cover,
        rate: rate,
        rateCount: rateCount,
        location: location,
        description: description,
        images: images,
        facilities: facilities,
      );
}
