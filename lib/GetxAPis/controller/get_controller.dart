

import 'package:get/get.dart';
import 'package:stat1proj/GetxAPis/services/repo.dart';
// get controller---------
class Getdata extends GetxController{
  final Getrepo getrepo=Get.put(Getrepo());

  final RxMap<String,dynamic> user=RxMap();
  final RxList<dynamic>alluser=RxList();
  final RxBool Loaging=true.obs;
  void onInit(){
    super.onInit();
    getxfetchusers();
    getxallusers();
  }

  Future<void> getxfetchusers()async{
    Loaging(true);
    final data= await getrepo.getdata();
    if(data!=null){
      user.assignAll(data);
    }
    Loaging(false);
  }
  Future<void> getxallusers()async{
    Loaging(true);
    final data= await getrepo.getalldata();
    if(data!=null){
      alluser.assignAll(data);
    }
    Loaging(false);
  }


}