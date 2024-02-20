import 'package:api_request/api_request.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

class CreateSessionAction extends ApiRequestAction<CheckoutSession> {
  CreateSessionAction({required this.api, required this.host});
  final String api;
  final String host;

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  String get path => '/api/v2/checkout';

  @override
  ResponseBuilder<CheckoutSession> get responseBuilder => (response) => CheckoutSession.fromJson(response);
}
