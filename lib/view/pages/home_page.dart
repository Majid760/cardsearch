import 'package:cardsearch/data/database/tables/user_table.dart';
import 'package:cardsearch/view/pages/svg_page.dart';
import 'package:cardsearch/view/widgets/square_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> profile = ['users', 'admin', 'team'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('User card'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: profile.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const SvgPage(),
                        ),
                      );
                    },
                    child: SquareWidget(
                      title: profile[index],
                    ),
                  );
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    UserTable('users').batchInsert();
                  },
                  child: const Text('Insert Dummy Data'))
            ]),
      ),
    );
  }
}
