import 'package:hive_flutter/hive_flutter.dart';

part 'vaccine_model.g.dart';

@HiveType(typeId: 2)
class VaccineModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(3)
  final String? description;

  VaccineModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory VaccineModel.fromJson(Map<String, dynamic> json) {
    return VaccineModel(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'name': name, 'description': description};
  }
}
