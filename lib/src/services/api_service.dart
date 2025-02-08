import 'package:dio/dio.dart';
import 'package:zaag_recruitment_task/src/models/user_list_model.dart';


class ApiService {
  static const String baseUrl = 'https://reqres.in/api/users';
  static final Dio _dio = Dio();

  static Future<List<User>?> fetchUsers({int page = 1}) async {
    try {
      final response = await _dio.get('$baseUrl?page=$page');
      if (response.statusCode == 200) {
        final jsonData = response.data;
        UserListModel userList = UserListModel.fromJson(jsonData);
        return userList.data;
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
    return null;
  }
}
