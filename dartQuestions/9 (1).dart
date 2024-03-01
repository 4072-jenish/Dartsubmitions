class Library {
  Map<String, String> books = {
    'book1': 'Harry Potter and the Philosopher\'s Stone',
    'book2': 'The Catcher in the Rye',
    'book3': 'To Kill a Mockingbird',
  };
  Map<String, String> borrowers = {};
  Library({required this.books, required this.borrowers});
  void lendBook(String book, String borrower) {
    if (books.containsKey(book)) {
      borrowers[book] = borrower;
      print('$book has been lent to $borrower.');
    } else {
      print('Book not found.');
    }
  }
  void returnBook(String book) {
    if (borrowers.containsKey(book)) {
      borrowers.remove(book);
      print('$book has been returned.');
    } else {
      print('Book not borrowed.');
    }
  }
}
void main() {
  final library = Library(books: {'book1': 'The Great Gatsby', 'book2': 'The Odyssey', 'book3': 'War and Peace'});
  library.lendBook('book1', 'John Doe');
  library.returnBook('book1');
}