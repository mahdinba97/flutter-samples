import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

const _htmlBase = 'This is a sample html text which we are using the search function on.';

class HtmlFinderPage extends StatefulWidget {
  const HtmlFinderPage({super.key});

  @override
  State<HtmlFinderPage> createState() => _HtmlFinderPageState();
}

class _HtmlFinderPageState extends State<HtmlFinderPage> {
  final TextEditingController _searchController = TextEditingController();
  String _htmlBody = _htmlBase;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Html Finder'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  hintText: 'find',
                ),
                onChanged: _findTheValue,
              ),
              const SizedBox(height: 12),
              Html(
                data: '''
                <html>
                  <body>
                    $_htmlBody
                  </body>
                </html>
                ''',
              )
            ],
          ),
        ),
      ),
    );
  }

  void _findTheValue(value) {
    if (value.isNotEmpty) {
      setState(() {
        _htmlBody = _htmlBase.replaceAll(value, '<mark>$value</mark>');
      });
    } else {
      setState(() {
        _htmlBody = _htmlBase;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
