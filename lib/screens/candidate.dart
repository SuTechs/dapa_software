import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Candidate extends StatelessWidget {
  const Candidate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate'),
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
        title: Text(isEdit ? 'Edit Candidate' : 'Add Candidate'),
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
        child: Form(
          child: Column(
            children: [
              /// name
              TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Name',
                  icon: Icon(
                    Icons.title,
                  ),
                ),
                textInputAction: TextInputAction.next,
              ),

              /// phone
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone',
                  icon: Icon(
                    Icons.phone,
                  ),
                ),
              ),

              /// email
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  icon: Icon(
                    Icons.email,
                  ),
                ),
              ),

              /// location
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Location',
                  icon: Icon(
                    Icons.location_on,
                  ),
                ),
              ),

              /// job
              TextFormField(
                readOnly: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Job',
                  icon: Icon(
                    Icons.work,
                  ),
                ),
              ),

              /// salary
              TextFormField(
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Salary',
                  icon: Icon(
                    Icons.currency_rupee,
                  ),
                ),
              ),

              /// notes
              TextFormField(
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Notes',
                  icon: Icon(
                    Icons.notes,
                  ),
                ),
              ),

              /// attachments
              TextFormField(
                readOnly: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: '+ Add documents',
                  icon: Icon(
                    Icons.attach_file,
                  ),
                ),
              ),
            ],
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
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '2 days ago',
              style: Theme.of(context).textTheme.caption,
            ),
            Text(name),
          ],
        ),
        subtitle: const Text('Kormangala, Bengaluru'),
        trailing: const Text('Cook'),
      ),
    );
  }
}
