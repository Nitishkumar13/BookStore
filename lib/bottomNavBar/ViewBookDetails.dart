import 'package:flutter/material.dart';
import 'package:flutter_expandable_text/flutter_expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Data/DataFile.dart';

class ViewBookDetails extends StatefulWidget {
  final int number;
  // ignore: prefer_typing_uninitialized_variables
  final List arrName;
  const ViewBookDetails({
    super.key,
    required this.number,
    required this.arrName,
  });

  @override
  // ignore: no_logic_in_create_state
  State<ViewBookDetails> createState() =>
      _ViewBookDetailsState(number, arrName);
}

class _ViewBookDetailsState extends State<ViewBookDetails> {
  final int number;
  final List arrName;
  bool changeIcon = false;
  _ViewBookDetailsState(this.number, this.arrName);
  void _changeBookmarkIcon() {
    setState(() {
      if (changeIcon == false) {
        changeIcon = true;
      } else {
        changeIcon = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              width: double.maxFinite,
              child: Image.asset(
                arrName[number]["path"]!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(
                  arrName[number]["bookName"],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
                trailing: IconButton(
                  icon: changeIcon
                      ? const Icon(Icons.bookmark)
                      : const Icon(Icons.bookmark_border),
                  onPressed: _changeBookmarkIcon,
                ),
                subtitle: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        arrName[number]['category'],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: RatingBarIndicator(
                              rating: ratings[number].toDouble(),
                              itemSize: 15,
                              itemBuilder: (BuildContext context, int index) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                            ),
                          ),
                          Text("${ratings[number]}   "),
                          Text("${reviews[number]} reviews"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.forum),
                    Text("See Reviews"),
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.menu_book_rounded),
                    Text("Read Book"),
                  ],
                ),
                Wrap(
                  direction: Axis.vertical,
                  spacing: 5,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: const [
                    Icon(Icons.volume_up_rounded),
                    Text("Listen Book"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text(
                "Prologue",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 30),
              child: ExpandableText(
                arrName[number]['prologue'],
                trimType: TrimType.lines,
                trim: 2,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 8),
              child: const Text(
                "Similar Books ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 260,
              margin: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => ViewBookDetails(
                                number: index,
                                arrName: similarBooks,
                              )),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 178,
                            width: 130,
                            child: Image.asset(
                              similarBooks[index]["path"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 40,
                            width: 130,
                            child: Text(
                              similarBooks[index]["bookName"]!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "By ${similarBooks[index]["writerName"]!}",
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
