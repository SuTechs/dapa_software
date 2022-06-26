import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Client extends StatelessWidget {
  const Client({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Client'),
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
          _Tile(name: 'Aditya Pandit'),
          _Tile(name: 'Sahil Kumar'),
          _Tile(name: 'Uchit Chakma'),
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
        title: Text(isEdit ? 'Edit Client' : 'Add Client'),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: const [
            /// name
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',
                icon: Icon(
                  Icons.title,
                ),
              ),
            ),

            /// phone
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone',
                icon: Icon(
                  Icons.phone,
                ),
              ),
            ),

            /// email
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Email',
                icon: Icon(
                  Icons.email,
                ),
              ),
            ),

            /// location
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Location',
                icon: Icon(
                  Icons.location_on,
                ),
              ),
            ),

            /// notes
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Notes',
                icon: Icon(
                  Icons.notes,
                ),
              ),
            ),
          ],
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
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            icon: Icons.call,
            label: 'Call',
            onPressed: (BuildContext context) {},
          ),
          SlidableAction(
            icon: Icons.whatsapp,
            label: 'Whatsapp',
            onPressed: (BuildContext context) {},
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const _Edit(isEdit: true)));
        },
        // title: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Text(
        //       '2 days ago',
        //       style: Theme.of(context).textTheme.caption,
        //     ),
        //     Text(name),
        //   ],
        // ),

        title: Text(name),
        subtitle: const Text('Kormangala, Bengaluru'),
        trailing: Text(
          '2 days ago',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
