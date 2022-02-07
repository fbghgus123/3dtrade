import 'package:getx_template/app/constants/api.urls.dart';
import 'package:getx_template/app/data/base.provider.dart';

class UserProvider extends BaseProvider {
 /// This is just a sample so we are passing the id. 
 /// In actual case you probably would have to pass the username and password
 login(String userid) async {
    /// In provider Don't add base url
    String url = ApiUrls.login(id:userid);
    var data = (await get(url)) ;
    return data.body;
  }
}