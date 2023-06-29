import 'package:single_salon/application_layer/utils/statusrequst.dart';

handlingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
