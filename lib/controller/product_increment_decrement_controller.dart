import 'package:get/get.dart';

class ProductIncDecController extends GetxController{
  var count=1.obs;
  void countIncrement(){
    count.value++;
    update();
  }
  void countDecrement(){
    if(count.value == 1){
      Get.snackbar("Notification", "Please add product");
    }else{
      count.value--;
      update();
    }
  }
}