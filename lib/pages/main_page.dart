import 'package:faker/faker.dart' as faker;
import 'package:flutter/material.dart';
import 'package:hello_world/models/book.dart';
import 'package:hello_world/pages/book_entry_page.dart';
import 'package:hello_world/pages/home_page.dart';
import 'package:hello_world/resources/string.dart';

import 'package:nanoid2/nanoid2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Variabel untuk menyimpan index halaman yang aktif
  // int _seletedPageIndex = 0;

  final _faker = faker.Faker();
  // List Books
  List<Book> _books = [];

// Predefined list of book titles for better variety
  final _bookTitles = [
    "The Silent Observer",
    "Journey to the Unknown",
    "Echoes of Eternity",
    "Winds of Change",
    "Shadows of the Past",
    "The Last Embrace",
    "Whispers of the Heart",
    "Legends of the Forgotten",
    "Dreams of Tomorrow",
    "The Lost Chronicles"
  ];

  // Fungsi untuk mengubah index halaman yang aktif
  // void _onPageChanged(int index) {
  //   if (index == 2) {
  //     // Jika index halaman adalah 2, maka navigasi ke halaman create moment
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
  //       return MomentCreatePage(onSaved: _saveMoment);
  //     }));
  //   } else {
  //     // Jika index halaman bukan 2, maka navigasi ke halaman yang sesuai
  //     setState(() {
  //       _seletedPageIndex = index;
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _books = List.generate(
      6, // Number of books to generate
      (index) => Book(
        id: nanoid(),
        title: _bookTitles[_faker.randomGenerator.integer(_bookTitles.length)],
        artist: _faker.person.name(),
        album: _faker.lorem.word(), // Random album/collection name
        releaseYear: int.tryParse(_faker.date.year(minYear: 1900, maxYear: 2024)) ?? 2024,
        albumImage: 'https://picsum.photos/800/600?random=$index',
      ),
    );
  }

  void _saveBook(Book newBook, String? bookId) {
     
    if (bookId != null) {
      //handle update
      final selectedBook = getbookById(bookId);
      if (selectedBook != null) {
     
        setState(() {
          final index = _books.indexOf(selectedBook);
          if (index != -1) {

            _books[index] =
                newBook; // Replace the old book with the updated one
          }
        });
      }
    } else {
      setState(() {
        _books.add(newBook);
      });
    }
  }

  // void deleteBook(String bookId) {
  //   setState(() {
  //     _books.removeWhere((book) =>
  //         book.id == bookId); // Remove the book from the list by its ID
  //   });
  // }
  // void _saveMoment(Moment newMoment) {
  //   final existingMoment = getMomentById(newMoment.id);
  //   if (existingMoment == null) {
  //     setState(() {
  //       _moments.add(newMoment);
  //     });
  //   } else {
  //     setState(() {
  //       _moments[_moments.indexOf(existingMoment)] = newMoment;
  //     });
  //   }
  // }

  void onUpdate(String bookId) {
    final selectedBook = getbookById(bookId);
    if (selectedBook != null) {
      // Menampilkan dialog konfirmasi pembaruan data moment
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update Moment'),
            content: const Text('Are you sure you want to update this moment?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return BookEntryPage(
                      onSubmit: _saveBook,
                      book: selectedBook,
                    );
                  }));
                },
                child: const Text('Sure'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }

  void onDelete(String bookId) {
    final selectedBook = getbookById(bookId);
    if (selectedBook != null) {
      // Menampilkan dialog konfirmasi penghapusan moment
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Moment'),
            content: const Text('Are you sure you want to delete this moment?'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _books.remove(selectedBook);
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Sure'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }

  Book? getbookById(String momentId) {
    return _books.firstWhere((moment) => moment.id == momentId);
  }

  @override
  Widget build(BuildContext context) {
    // List halaman yang tersedia
    // final List<Widget> pages = [
    //   HomePage(
    //     moments: _moments,
    //     onUpdate: onUpdate,
    //     onDelete: onDelete,
    //   ),
    //   SearchPage(moments: _moments),
    //   const Center(
    //     child: Text('Create Moment'),
    //   ),
    //   const Center(
    //     child: Text('Activity'),
    //   ),
    //   const Center(
    //     child: Text('Profile'),
    //   ),
    // ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:
          HomePage(
            books: _books, 
            onDelete: onDelete, 
            onUpdate: onUpdate
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return BookEntryPage(
              onSubmit: _saveBook,
            );
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
