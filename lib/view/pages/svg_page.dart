import 'package:cardsearch/bloc/utility/search_utility.dart';
import 'package:cardsearch/data/database/tables/user_table.dart';
import 'package:cardsearch/data/models/user.dart';
import 'package:cardsearch/view/widgets/svg_container_widget.dart';
import 'package:flutter/material.dart';

class SvgPage extends StatefulWidget {
  const SvgPage({Key? key}) : super(key: key);

  @override
  _SvgScreenState createState() => _SvgScreenState();
}

class _SvgScreenState extends State<SvgPage> {
  List<User> userProfiles = [];

  @override
  void initState() {
    super.initState();
    getAllUserProfileData();
  }

  void getAllUserProfileData() async {
    final data = await UserTable('users').getAllUsers();
    setState(() {
      userProfiles = data;
    });
  }

  List<Map<String, dynamic>> svgData = [
    {
      'imagePath': "assets/images/woman.svg",
      'id': 1234233,
    },
    {
      'imagePath': "assets/images/woman.svg",
      'id': 12342344,
    },
    {
      'imagePath': "assets/images/male.svg",
      'id': 1243421,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Profiles'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: svgData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: ProfileSearch(userProfiles: userProfiles),
                );
              },
              child: SVGWidget(
                data: svgData[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
