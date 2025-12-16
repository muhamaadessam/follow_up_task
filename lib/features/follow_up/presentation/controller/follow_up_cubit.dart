import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:follow_up_task/features/follow_up/domain/entities/follow_up_entity.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../domain/usecases/get_follow_up_use_case.dart';

part 'follow_up_state.dart';

class FollowUpCubit extends Cubit<FollowUpState> {
  final GetFollowUpUseCase getFollowUpUseCase;
  Timer? _debounce;

  FollowUpCubit(this.getFollowUpUseCase) : super(FollowUpState());

  Future<void> load() async {
    final result = await getFollowUpUseCase.call(NoParameters());
    result.fold(
      (failure) => emit(state.copyWith(error: failure.message)),
      (data) => emit(state.copyWith(all: data, filtered: data)),
    );
  }

  void search(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _apply(query: value.toLowerCase());
    });
  }

  void filterBy(StatusFilter filter) {
    _apply(filter: filter);
  }

  void _apply({String? query, StatusFilter? filter}) {
    final activeQuery = query ?? state.query;
    final activeFilter = filter ?? state.filter;

    final result = state.all.where((f) {
      final matchesSearch =
          f.title.toLowerCase().contains(activeQuery) ||
          (f.customerName?.toLowerCase().contains(activeQuery) ?? false);

      final matchesStatus =
          activeFilter == StatusFilter.all ||
          (activeFilter == StatusFilter.completed &&
              f.status == FollowUpStatus.completed) ||
          (activeFilter == StatusFilter.scheduled &&
              f.status == FollowUpStatus.scheduled) ||
          (activeFilter == StatusFilter.none &&
              f.status == FollowUpStatus.none);

      return matchesSearch && matchesStatus;
    }).toList();

    emit(
      state.copyWith(
        query: activeQuery,
        filter: activeFilter,
        filtered: result,
      ),
    );
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
