import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books_nus/controllers/book_controller.dart';
import 'package:library_books_nus/models/book_model.dart';

class DetailPage extends StatefulWidget {
  final BookModel book;

  DetailPage({super.key, required this.book});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final BookController _dataController = Get.find<BookController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.book.title;
    authorController.text = widget.book.author;
  }

  @override
  void dispose() {
    titleController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Edit Book'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(labelText: 'Title'),
                        ),
                        TextField(
                          controller: authorController,
                          decoration: InputDecoration(labelText: 'Author'),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          final updatedBook = {
                            'id': widget.book.id,
                            'isbn': widget.book.isbn,
                            'title': titleController.text,
                            'author': authorController.text,
                          };
                          _dataController.updateBook(
                              widget.book.id, updatedBook);
                          Navigator.of(context).pop();
                          Get.back();
                        },
                        child: Text('Save'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              _dataController.deleteBook(widget.book.id.toString());
              Get.back();
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Obx(
        () => _dataController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  ListTile(
                    title: const Text('ISBN'),
                    subtitle: Text(widget.book.isbn),
                  ),
                  ListTile(
                    title: const Text('Title'),
                    subtitle: Text(widget.book.title),
                  ),
                  ListTile(
                    title: const Text('Author'),
                    subtitle: Text(widget.book.author),
                  ),
                ],
              ),
      ),
    );
  }
}