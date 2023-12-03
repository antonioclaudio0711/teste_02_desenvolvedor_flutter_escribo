import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/domain/entities/book.dart';
import 'package:teste_tecnico_02_ereader/app/modules/home/presenter/store/home_store.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.book,
    required this.onClickDownload,
    required this.onClickOpenEbook,
    required this.store,
  });

  final Book book;
  final VoidCallback onClickDownload;
  final VoidCallback onClickOpenEbook;
  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeStore, HomeState>(
      bloc: store,
      builder: (context, state) {
        return AlertDialog(
          content: SizedBox(
            height: 250,
            width: 150,
            child: state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
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
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          onPressed: () => Modular.to.pop(),
                          icon: const Icon(Icons.arrow_back),
                        ),
                      )
                    ],
                  ),
          ),
        );
      },
    );
  }
}
