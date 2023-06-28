import 'package:flutter/material.dart';

main() {
  runApp(const TestAdd());
}

class TestAdd extends StatefulWidget {
  const TestAdd({super.key});

  @override
  State<TestAdd> createState() => _TestAddState();
}

class _TestAddState extends State<TestAdd> {
  TextEditingController inputChat = TextEditingController();
  List<String> listText = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Test Add"),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 16),
          child: Column(children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(width: 1, color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                  ),
                  child: TextField(
                    controller: inputChat,
                    style: const TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                listText.add(inputChat.text);
                                inputChat.clear();
                              });
                            },
                            icon: const Icon(Icons.add))),
                  ),
                )),
            listText.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: listText.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.only(top: 16),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: const BorderSide(
                                      width: 1, color: Colors.black)),
                              child: Container(
                                height: 48,
                                padding: const EdgeInsets.only(
                                  left: 12,
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  listText[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )),
                        );
                      },
                    ),
                  )
                : Container()
          ]),
        ),
      ),
    );
  }
}
