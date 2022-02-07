import 'package:get/get.dart';
import 'package:getx_template/app/constants/api.urls.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    String token = "My token";

    httpClient.baseUrl = ApiUrls.baseUrl;
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);
    /// Maximum number of times the request will be retried if authentication fails
    httpClient.maxAuthRetries = 2;
    httpClient.followRedirects = true;
    httpClient.maxRedirects =2;
    
    
    httpClient.addRequestModifier((dynamic request)  {
     /// This will be called before a request is sent
     /// Make modifications to the request like adding Auth token here
     if(token != ''){
      request.headers['Authorization'] = "Bearer $token";
     }
     return request;
    });

    httpClient.addResponseModifier((request, response)  {
      /// You can postprocess the request as needed before returning it to the main provider
      Map<String,dynamic> res = {
        "status": response.statusCode,
        "data": response.body
      };
      /// We only modify the body of the response and
      /// Return should be of type Response
      Response modResp = Response(
        request: response.request,
        body:res);
     
      return modResp;
    });

    
    httpClient.addAuthenticator((dynamic request)  {
      /// This method will get called when authentication fails
      /// set refresh token here and return the request
      return request;
    });
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
