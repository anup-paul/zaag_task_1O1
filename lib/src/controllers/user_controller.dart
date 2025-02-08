import 'package:get/get.dart';
import 'package:zaag_recruitment_task/src/models/user_list_model.dart';
import '../services/api_service.dart';

class UserController extends GetxController {
  var userList = <User>[].obs;
  var filteredList = <User>[].obs;
  var favoriteList = <User>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var currentPage = 1.obs;
  var hasMore = true.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    searchQuery.listen((_) => filterUsers());
  }


  ///fetch all users

  void fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      isRefreshing.value = true;
      userList.clear();
      currentPage.value = 1;
      hasMore.value = true;
    }
    if (!hasMore.value || isLoading.value) return;
    isLoading.value = true;
    var users = await ApiService.fetchUsers(page: currentPage.value);
    isLoading.value = false;
    if (users != null && users.isNotEmpty) {
      userList.addAll(users);
      currentPage.value++;
    } else {
      hasMore.value = false;
    }
    filterUsers();
    isRefreshing.value = false;
  }



  ///filter users

  void filterUsers() {
    String query = searchQuery.value.trim().toLowerCase();
    if (query.isEmpty) {
      filteredList.assignAll(userList);
    } else {
      filteredList.assignAll(userList.where((user) {
        String fullName = "${user.firstName} ${user.lastName}".toLowerCase();
        List<String> queryWords = query.split(' ');
        return queryWords.every((word) => fullName.contains(word));
      }).toList());
    }
  }




  ///toggle favorite
  void toggleFavorite(User user) {
    favoriteList.contains(user) ? favoriteList.remove(user) : favoriteList.add(user);
  }
}
