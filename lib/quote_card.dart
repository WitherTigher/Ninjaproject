import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'quote.dart';

class QuoteCard extends StatefulWidget {
  final Quote quote;
  final VoidCallback? deletion;
  QuoteCard({required this.quote, required this.deletion});

  Color cardColor(String c) {
    switch (c.toLowerCase()) {
      case 'inspiration':
        return Colors.blueAccent.shade100.withValues();
      case 'humor':
        return Colors.amber.shade100;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      color: widget.cardColor(widget.quote.category),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.quote.text,
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 6),
            Text(
              '- ${widget.quote.author}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: [
                Chip(label: Text(widget.quote.category)),
                Chip(
                  label: Text(
                    DateFormat('MMM d, yyyy').format(widget.quote.createdAt),
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.thumb_up),
                  onPressed: () => setState(() => widget.quote.likes++),
                ),
                Text('${widget.quote.likes}'),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: widget.deletion,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
