
import 'package:dartz/dartz.dart';
import 'package:follow_up_task/core/error/failure.dart';
import 'package:follow_up_task/features/follow_up/domain/entities/follow_up_entity.dart';

abstract class BaseFollowUpRepository {
  Future<Either<Failure, List<FollowUpEntity>>> getFollowUp();

}
