import 'package:dartz/dartz.dart';
import 'package:follow_up_task/core/error/failure.dart';
import 'package:follow_up_task/core/services/json_decoder.dart';
import 'package:follow_up_task/features/follow_up/domain/entities/follow_up_entity.dart';

import '../../../../res/assets.dart';
import '../models/follow_up_model.dart';

abstract class BaseFollowUpRemoteDataSource {
  Future<Either<Failure, List<FollowUpEntity>>> getFollowUp();
}

class FollowUpRemoteDataSource extends BaseFollowUpRemoteDataSource {
  @override
  Future<Either<Failure, List<FollowUpModel>>> getFollowUp() async {
    final data = await jsonDecoder(Assets.followUpsJson);
    print(data);
    if (data['success'] == true) {
      final list = List<FollowUpModel>.from(
        data['data'].map((x) => FollowUpModel.fromJson(x)),
      );

      return right(list);
    } else {
      return left(ServerFailure(data['message'] ?? 'Unknown error'));
    }
  }
}
