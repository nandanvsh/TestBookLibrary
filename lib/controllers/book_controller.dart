import 'dart:developer';

import 'package:get/get.dart';
import 'package:library_books_nus/models/book_model.dart';
import 'package:library_books_nus/service/api_service.dart';

class BookController extends GetxController {
  final ApiService apiService = Get.put(ApiService());
  var books = <BookModel>[].obs;
  var isLoading = false.obs;
  var authToken = ''.obs;
  //'979|lwiV3tFoIzHR8Bvcc7md2sH6scAoPwCNmGrjhpHo'

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getBooks() async {
    try {
      isLoading(true);
      final response = await apiService.getAllBooks();
      final data = response.data["data"];
      List<BookModel> bookData = [
        for (var item in data) BookModel.fromJson(item)
      ];

      books.assignAll(bookData);

    } catch (error) {
      throw Exception('Failed to fetch books: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> addBook(Map<String, dynamic> bookData) async {
    try {
      isLoading(true);
      await apiService.addBook(authToken.value, bookData);
      await getBooks();
    } catch (error) {
      throw Exception('Failed to add book: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateBook(int bookId, Map<String, dynamic> bookData) async {
    try {
      isLoading(true);
      await apiService.updateBook(authToken.value, bookId, bookData);
      await getBooks();
    } catch (error) {
      throw Exception('Failed to update book: $error');
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteBook(String bookId) async {
    try {
      isLoading(true);
      await apiService.deleteBook(authToken.value, bookId);
      await getBooks();
    } catch (error) {
      throw Exception('Failed to delete book: $error');
    } finally {
      isLoading(false);
    }
  }
}
