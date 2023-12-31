class BookModel {
  final String title;
  final String author;
  final String isbn;
  final int id;

  const BookModel({
    required this.title,
    required this.author,
    required this.isbn,
    required this.id,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json["title"] ?? "",
      author: json["author"] ?? "",
      isbn: json["isbn"] ?? "",
      id: json["id"] ?? 0,
    );
  }
}
