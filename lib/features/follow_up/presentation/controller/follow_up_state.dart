part of 'follow_up_cubit.dart';

enum StatusFilter { all, completed, scheduled, none }

enum FollowUpCubitStatus { initial, loading, loaded, error }

class FollowUpState {
  final FollowUpCubitStatus status;
  final List<FollowUpEntity> all;
  final List<FollowUpEntity> filtered;
  final String query;
  final StatusFilter filter;
  final String? error;

  const FollowUpState({
    this.status = FollowUpCubitStatus.initial,
    this.all = const [],
    this.filtered = const [],
    this.query = '',
    this.filter = StatusFilter.all,
    this.error,
  });

  FollowUpState copyWith({
    FollowUpCubitStatus? status,
    List<FollowUpEntity>? all,
    List<FollowUpEntity>? filtered,
    String? query,
    StatusFilter? filter,
    String? error,
  }) {
    return FollowUpState(
      status: status ?? this.status,
      all: all ?? this.all,
      filtered: filtered ?? this.filtered,
      query: query ?? this.query,
      filter: filter ?? this.filter,
      error: error ?? this.error,
    );
  }
}
