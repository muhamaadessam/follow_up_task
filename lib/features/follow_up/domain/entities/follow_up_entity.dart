import 'package:equatable/equatable.dart';

enum FollowUpType { call, meeting, visit }

enum FollowUpStatus { completed, scheduled, none }

class FollowUpEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final FollowUpType type;
  final FollowUpStatus? status;
  final String? customerName;

  const FollowUpEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    this.status = FollowUpStatus.none,
    this.customerName,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    type,
    status,
    customerName,
  ];
}
