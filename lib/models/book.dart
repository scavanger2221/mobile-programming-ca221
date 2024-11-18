class Book {
  final String id;
  final String title; // Title of the book
  final String artist; // Artist or author
  final String album; // Album or collection
  final int releaseYear; // Year of release
  final String albumImage; // URL or path to the album image

  Book({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.releaseYear,
    required this.albumImage,
  });

}