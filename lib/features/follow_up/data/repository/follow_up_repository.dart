import 'package:dartz/dartz.dart';
import 'package:follow_up_task/core/error/failure.dart';
import 'package:follow_up_task/features/follow_up/domain/entities/follow_up_entity.dart';

import '../../domain/repository/base_follow_up_repository.dart';
import '../datasource/follow_up_remote_data_source.dart';

class FollowUpRepository extends BaseFollowUpRepository {
  final BaseFollowUpRemoteDataSource baseFollowUpRemoteDataSource;

  FollowUpRepository(this.baseFollowUpRemoteDataSource);

  @override
  Future<Either<Failure, List<FollowUpEntity>>> getFollowUp() async {
    return await baseFollowUpRemoteDataSource.getFollowUp();
  }
}
