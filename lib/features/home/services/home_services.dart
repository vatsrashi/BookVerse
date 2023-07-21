import '../../../constants/constants.dart';
import '../../../models/book_model.dart';

class HomeServices {
  List<Book> books = [];
  List<Book> getAllBooks() {
    if (books.isNotEmpty) return books;
    for (var book in Constants.bookJson) {
      books.add(Book.fromJson(book));
    }
    return books;
  }
}
