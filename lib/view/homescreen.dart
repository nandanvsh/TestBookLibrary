import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books_nus/controllers/auth_controller.dart';
import 'package:library_books_nus/controllers/book_controller.dart';
import 'package:library_books_nus/view/login_screen.dart';
import 'package:library_books_nus/view/more_detail.dart';

class HomeScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());
  final AuthController authController = Get.put(AuthController());

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      bookController.getBooks();
    });
    return Container(
      color: const Color(0xffAFB4FF),
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Color(0xff9C9EFE),
          actions: [
            IconButton(
              onPressed: () {
                authController.logoutUser();
                Get.offAll(LoginScreen());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        child: const Text(
                          'Kumpulan Buku',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff2B4865),
                              shadows: <Shadow>[
                                Shadow(
                                    color: Color.fromARGB(64, 0, 0, 0),
                                    offset: Offset(0, 4),
                                    blurRadius: 4)
                              ]),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Divider(
                              color: Colors.blueGrey,
                              thickness: 1,
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05),
                          Container(
                            child: Text(
                              'macam-macam buku',
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff9C9EFE)),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Divider(
                              color: Colors.blueGrey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xff9C9EFE),
                        height: MediaQuery.of(context).size.height * 0.7,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Expanded(child: Obx(() {
                              if (bookController.isLoading.value) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (bookController.books.isEmpty) {
                                return const Center(
                                    child: Text('No books found.'));
                              } else {
                                return ListView.builder(
                                    itemCount:
                                        bookController.books.length,
                                    itemBuilder: (context, index) {
                                      final book = bookController.books[index];
                                      return GestureDetector(
                                        child: Card(
                                          margin: const EdgeInsets.symmetric(
                                            horizontal: 16.0,
                                            vertical: 8.0,
                                          ),
                                          child: ListTile(
                                            title: Text(book.title),
                                            subtitle: Text(book.author),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.to(DetailPage(book: book));
                                        },
                                      );
                                    });
                              }
                            }))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Tambah Buku'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: isbnController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'ISBN',
                        ),
                      ),
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                          labelText: 'Judul',
                        ),
                      ),
                      TextField(
                        controller: authorController,
                        decoration: const InputDecoration(
                          labelText: 'Penulis',
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        bookController.addBook({
                          'isbn': isbnController.text,
                          'title': titleController.text,
                          'author': authorController.text,
                        });
                        titleController.clear();
                        authorController.clear();
                        isbnController.clear();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Tambah'),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      )),
    );
  }
}
