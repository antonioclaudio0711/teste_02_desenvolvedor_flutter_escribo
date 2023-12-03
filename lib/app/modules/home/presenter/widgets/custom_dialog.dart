import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.book,
    required this.onClickDownload,
    required this.onClickOpenEbook,
  });

  final Book book;
  final VoidCallback onClickDownload;
  final VoidCallback onClickOpenEbook;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 200,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Você clicou sobre o livro ${utf8.decode(book.title.runes.toList())} de ${book.author}!',
              style: const TextStyle(fontSize: 15),
              textAlign: TextAlign.justify,
            ),
            ElevatedButton(
              onPressed: onClickDownload,
              child: const Text('Baixar E-Book'),
            ),
            ElevatedButton(
              onPressed: onClickOpenEbook,
              child: const Text('Abrir E-Book'),
            )
          ],
        ),
      ),
    );
  }
}
