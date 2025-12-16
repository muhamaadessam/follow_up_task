import '../../domain/entities/follow_up_entity.dart';

class FollowUpModel extends FollowUpEntity {
  const FollowUpModel({
    required super.id,
    required super.title,
    required super.description,
    required super.type,
    super.status,
    super.customerName,
  });

  factory FollowUpModel.fromJson(Map<String, dynamic> json) => FollowUpModel(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    type: _parseType(json['type']),
    status: _parseStatus(json['status']),
    customerName: json['customerName'],
  );

  static FollowUpType _parseType(String value) {
    return FollowUpType.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => FollowUpType.call,
    );
  }

  static FollowUpStatus _parseStatus(String? value) {
    if (value == null || value.toLowerCase() == 'none') {
      return FollowUpStatus.none;
    }
    return FollowUpStatus.values.firstWhere(
      (e) => e.name.toLowerCase() == value.toLowerCase(),
      orElse: () => FollowUpStatus.none,
    );
  }
}
