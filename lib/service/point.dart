import 'package:coke_platform/constants/service_path.dart';
import 'package:coke_platform/core/service/base_service.dart';
import 'package:coke_platform/core/service/rest_utils.dart';
import 'package:coke_platform/core/service/result.dart';
import 'package:coke_platform/model/data/request/point/model.dart';
import 'package:coke_platform/model/data/response/point/model.dart';

class PointService extends BaseService {
  Future<Result<PointResponseModel>> calcSkillPoint(PointRequestModel request) async {
    return rest.sendRequest(Method.post, ServicePath.calcSkillPoint, data: request);
  }
}
