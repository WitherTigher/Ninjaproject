class Quote {
  final String text;
  final String author;
  final String category; // NEW
  final DateTime createdAt; // NEW
  int likes; // NEW (mutable)

  //  normal constructor, as we've already seen

  //  Quote(String author, String text){
  //    this.text = text;
  //    this.author = author;
  //  }

  //  constructor with named parameters

  //  Quote({ String author, String text }){
  //    this.text = text;
  //    this.author = author;
  //  }

  // constructor with named parameters
  // & automatically assigns named arguments to class properties

  Quote({
    required this.text,
    required this.author,
    required this.category,
    DateTime? createdAt,
    this.likes = 0,
  }) : createdAt = createdAt ?? DateTime.now();
}
