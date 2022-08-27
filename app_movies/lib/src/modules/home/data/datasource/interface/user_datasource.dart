abstract class UserDatasource {
  Future<Map<String, dynamic>> getUser();

  Future<void> saveUser(Map<String, dynamic> user);
}
