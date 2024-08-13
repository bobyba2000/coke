import 'package:coke_platform/constants/service_path.dart';
import 'package:coke_platform/core/service/base_service.dart';
import 'package:coke_platform/core/service/rest_utils.dart';
import 'package:coke_platform/core/service/result.dart';
import 'package:coke_platform/model/data/request/mail/model.dart';
import 'package:coke_platform/model/data/response/void/model.dart';

class MailService extends BaseService {
  Future<Result<VoidResponseModel>> sendMail(MailRequestModel request) async {
    return rest.sendRequest(Method.post, ServicePath.sendMail, data: request);
  }
}
