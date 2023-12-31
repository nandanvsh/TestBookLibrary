import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio dio = Dio();

//auth
  Future<Response> registerUser(Map<String, dynamic> dataUser) async {
    print(dataUser);
    final response = await dio.post(
        'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/register',
        data: dataUser,
        options: Options(headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        }));

    return response;
  }

  Future<Response> loginUser(Map<String, dynamic> bareToken) async {
    final response = await dio.post(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/login',
      data: bareToken,
      options: Options(headers: {'Authorization': 'Bearer $bareToken'}),
    );
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('authToken', response.data["token"]);
    final authToken = await sharedPreferences.getString("authToken");

    print(authToken);
    return response;
  }

  Future<Response> getUserProfile(String authToken) async {
    final response = await dio.get(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user',
      options: Options(headers: {'Authorization': 'Bearer $authToken'}),
    );
    return response;
  }

  Future<Response> logoutUser(String authToken) async {
    final response = await dio.delete(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/user/logout',
      options: Options(headers: {'Authorization': 'Bearer $authToken'}),
    );
    return response;
  }

//book
  Future<Response> getAllBooks() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("authToken");
    final response = await dio.get(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json'
      }),
    );
    print(token);
    print(response);
    return response;
  }

  Future<Response> addBook(
      String authToken, Map<String, dynamic> bookData) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("authToken");
    final response = await dio.post(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/add',
      data: bookData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }

  Future<Response> updateBook(
      String authToken, int bookId, Map<String, dynamic> bookData) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("authToken");
    final response = await dio.put(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/${bookId.toString()}/edit',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: bookData,
    );
    return response;
  }

  Future<Response> getBook(String authToken, String bookId) async {
    final response = await dio.get(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$bookId',
      options: Options(headers: {'Authorization': 'Bearer $authToken'}),
    );
    return response;
  }

  Future<Response> deleteBook(String authToken, String bookId) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.getString("authToken");
    final response = await dio.delete(
      'https://book-crud-service-6dmqxfovfq-et.a.run.app/api/books/$bookId',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return response;
  }
}
