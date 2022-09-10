import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Team Name Generator",
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Team Name Generator"),
          ),
          body: const Center(
            child: RamdomWords(),
          ),
        ));
  }
}

class RamdomWords extends StatefulWidget {
  const RamdomWords({super.key});

  @override
  State<RamdomWords> createState() => _RamdomWordsState();
}

class _RamdomWordsState extends State<RamdomWords> {
  @override
  Widget build(BuildContext context) {
    final _suggestions = <WordPair>[];
    final _saved = <WordPair>{};
    final _biggerFont = const TextStyle(fontSize: 18);
    // final wordPair = WordPair.random();
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: ((context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        final alreadySaved = _saved.contains(_suggestions[index]);
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
        );
      }),
    );
  }
}
