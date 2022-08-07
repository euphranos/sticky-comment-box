import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpen = false;
  bool change = false;
  String comment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: isOpen ? aboveWidget() : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isOpen = true;
                });
              },
              child: Container(
                color: Colors.green,
                height: 60,
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container aboveWidget() {
    return Container(
      color: Color(0xff181818),
      height: 60,
      width: double.infinity,
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: CircleAvatar(),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add a comment",
                  hintStyle: TextStyle(color: Colors.white)),
              autofocus: true,
              onChanged: (value) {
                setState(() {});
                comment = value;
                change = true;
              },
              onSaved: (newValue) {
                setState(() {});
                isOpen = false;
              },
              onEditingComplete: () {
                setState(() {});
                isOpen = false;
              },
              onTap: () {
                setState(() {});
                isOpen = true;
              },
            ),
          ),
          comment.length > 0
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isOpen = false;
                    });
                  },
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
