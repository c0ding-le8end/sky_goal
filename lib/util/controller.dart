
import 'package:get/get.dart';

import 'json/dart_object.dart';
import 'json/json_util.dart';


class JsonController extends GetxController
{
  List<SectionsObject> sections=[];
  List<DetailsObject> details=[];
  RxBool loading=RxBool(true);
  @override
  void onInit() async{
    sections=await JsonUtil.loadFromJsonAsync();
    loading.value=false;

    super.onInit();
  }

  getDetailsObjects(String index) async{
    loading.value=true;
    details=await JsonUtil.loadFromJsonAsync(file: "details",index: index);
    loading.value=false;
}
}

class JsonBinding extends Bindings
{
  @override
  void dependencies() {
    Get.put<JsonController>(JsonController());
    // TODO: implement dependencies
  }

}