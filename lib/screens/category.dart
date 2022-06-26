import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const _Edit()));
        },
      ),
      body: ListView(
        children: const [
          SizedBox(height: 8),
          _Tile(name: 'Cook'),
          _Tile(name: 'Driver'),
          _Tile(name: 'Helper'),
          _Tile(name: 'Chat Master'),
          _Tile(name: 'Juice Master'),
        ],
      ),
    );
  }
}

class _Edit extends StatelessWidget {
  final bool isEdit;

  const _Edit({Key? key, this.isEdit = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: const Icon(Icons.clear),
          onTap: () => Navigator.of(context).maybePop(),
        ),
        title: Text(isEdit ? 'Edit Category' : 'Add Category'),
        actions: [
          Row(
            children: [
              if (isEdit)
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete),
                ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.done),
              ),
            ],
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Name',
            icon: Icon(
              Icons.title,
            ),
          ),
        ),
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  final String name;

  const _Tile({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const _Edit(isEdit: true)));
      },
      title: Text(name),
    );
  }
}
