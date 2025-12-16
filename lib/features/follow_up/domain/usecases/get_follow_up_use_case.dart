import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../entities/follow_up_entity.dart';
import '../repository/base_follow_up_repository.dart';

class GetFollowUpUseCase
    extends BaseUseCase<List<FollowUpEntity>, NoParameters> {
  final BaseFollowUpRepository baseFollowUpRepository;

  GetFollowUpUseCase(this.baseFollowUpRepository);

  @override
  Future<Either<Failure, List<FollowUpEntity>>> call(
    NoParameters parameters,
  ) async {
    return await baseFollowUpRepository.getFollowUp();
  }
}
