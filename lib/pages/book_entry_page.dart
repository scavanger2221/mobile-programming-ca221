import 'package:flutter/material.dart';
import 'package:hello_world/models/book.dart';
import 'package:nanoid2/nanoid2.dart';

class BookEntryPage extends StatefulWidget {
  const BookEntryPage({super.key, required this.onSubmit, this.book});

  final void Function(Book book, String? bookId) onSubmit;
  final Book? book;

  @override
  State<BookEntryPage> createState() => _BookEntryFormState();
}

class _BookEntryFormState extends State<BookEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _bookData = {};
  // Initializing a Book instance

  @override
  void initState() {
    super.initState();
    if (widget.book !=null) {
    _bookData['title'] = widget.book?.title;
    _bookData['artist'] = widget.book?.artist;
    _bookData['album'] = widget.book?.album;
    _bookData['albumImage'] = widget.book?.albumImage;
    _bookData['releaseYear'] = widget.book?.releaseYear;
    }
  }

  // Handle the form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() == true) {
      // widget.onSubmit(_book);

      final Book newBook = Book(
          title: _bookData['title'],
          id: widget.book?.id ?? nanoid(),
          album: _bookData['album'],
          albumImage: _bookData['albumImage'],
          artist: _bookData['artist'],
          releaseYear: _bookData['releaseYear'].toString());

      if (widget.book != null) {
        widget.onSubmit(newBook, widget.book?.id);
      } else {
        widget.onSubmit(newBook, null);
      }

      // Menutup halaman create moment
      Navigator.of(context).pop();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Book entry saved!')),
      );
      _formKey.currentState?.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Entry Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Title Field
              TextFormField(
                initialValue: widget.book?.title,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the book title';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bookData['title'] = value;
                  });
                },
              ),
              const SizedBox(height: 10),

              // Artist Field
              TextFormField(
                initialValue: widget.book?.artist,
                decoration: const InputDecoration(labelText: 'Artist'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the artist name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bookData['artist'] = value;
                  });
                },
              ),
              const SizedBox(height: 10),

              // Album Field
              TextFormField(
                initialValue: widget.book?.album,
                decoration: const InputDecoration(labelText: 'Album'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the album name';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bookData['album'] = value;
                  });
                },
              ),
              const SizedBox(height: 10),

              // Release Year Field
              TextFormField(
                initialValue: widget.book?.releaseYear,
                decoration: const InputDecoration(labelText: 'Release Year'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the release year';
                  }
                  final year = int.tryParse(value);
                  if (year == null ||
                      year < 1000 ||
                      year > DateTime.now().year) {
                    return 'Please enter a valid year';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bookData['releaseYear'] =
                        int.tryParse(value) ?? _bookData['releaseYear'];
                  });
                },
              ),
              const SizedBox(height: 10),

              // Image URL Field
              TextFormField(
                initialValue: widget.book?.albumImage,
                decoration: const InputDecoration(labelText: 'Album Image URL'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter the image URL';
                  }
                  if (!Uri.parse(value).isAbsolute) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _bookData['albumImage'] = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Save Book Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
