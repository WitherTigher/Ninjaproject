import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.cyan, backgroundColor: Colors.grey[200]),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 18, fontStyle: FontStyle.normal, color: Colors.black),
          bodySmall:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    ),
    home: QuoteList()));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [
    Quote(
        author: 'Oscar Wilde',
        text: 'Be yourself; everyone else is already taken',
        category: 'inspiration'),
    Quote(
        author: 'Oscar Wilde',
        text: 'I have nothing to declare except my genius',
        category: 'humor'),
    Quote(
        author: 'Oscar Wilde',
        text: 'The truth is rarely pure and never simple',
        category: 'General')
  ];

  Future<void> _delete(Quote quote) async {
    final ok = await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Delete quote?'),
            content: const Text('This cannot be undone.'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel')),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Delete')),
            ],
          ),
        ) ??
        false;
    if (ok) setState(() => quotes.remove(quote));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        //backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes
            .map((quote) =>
                QuoteCard(quote: quote, deletion: () => _delete(quote)))
            .toList(),
      ),
    );
  }
}
