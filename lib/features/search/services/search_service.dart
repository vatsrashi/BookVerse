import 'package:book_shop_app/models/book_model.dart';

import '../../../constants/constants.dart';

class SearchService {
  List<Book> search(String query) {
    List<Book> searchedBooks = [];
    for (var val in Constants.bookJson) {
      Book book = Book.fromJson(val);
      if (book.title.toLowerCase().contains(query.toLowerCase())) {
        searchedBooks.add(book);
      }
    }
    return searchedBooks;
  }
}
