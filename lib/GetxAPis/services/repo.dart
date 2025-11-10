


import 'package:dio/dio.dart';
//: single user fetching---------------
class Getrepo {
  final Dio dio=Dio();
  Future<Map<String,dynamic>?> getdata() async {
    try{
      final response = await dio.get('https://dummyjson.com/users/1');
      if(response.statusCode==200|| response.statusCode==201){
        return response.data as Map<String,dynamic>;
      }
    }on DioException catch(e){
      print('Dio error:${e.message}');
    }
    catch(e){
      print('Error occurred: $e');
      return null;
    }
  }
  Future<List<dynamic>?> getalldata()async{
    try {
      final response = await dio.get('https://dummyjson.com/users');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // response.data expected to be a Map with key 'users'
        return response.data['users'] as List<dynamic>;
      }
    } on DioException catch (e) {
      print('Dio error (getAllUsers): ${e.message}');
    } catch (e) {
      print('Error occurred (getAllUsers): $e');
    }
    return null;
  }

}
