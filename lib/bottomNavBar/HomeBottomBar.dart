import 'package:book_store/bottomNavBar/ViewBookDetails.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

import '../Data/DataFile.dart';

class HomeBottomBar extends StatefulWidget {
  const HomeBottomBar({super.key});

  @override
  State<HomeBottomBar> createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 177, 211, 239),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 15, left: 20),
              hintText: " Type Book name or Author",
              suffixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "Discoverer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.maxFinite,
              height: 180,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Carousel(
                dotSize: 10,
                autoplay: false,
                dotSpacing: 15,
                dotIncreasedColor: Colors.green,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomRight,
                images: [
                  Image.asset("assets/images/1.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/2.jpg", fit: BoxFit.cover),
                  Image.asset("assets/images/3.jpg", fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: const Text(
                  "Top",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Wrap(
                  children: const [Text("More"), Icon(Icons.arrow_right_alt)],
                ),
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
                                arrName: topBooks,
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
                              topBooks[index]["path"]!,
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
                              topBooks[index]["bookName"]!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "By ${topBooks[index]["writerName"]!}",
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
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 8),
              child: ListTile(
                leading: const Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Wrap(
                  children: const [Text("More"), Icon(Icons.arrow_right_alt)],
                ),
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
                                arrName: recommendedBooks,
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
                              recommendedBooks[index]["path"]!,
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
                              recommendedBooks[index]["bookName"]!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "By ${recommendedBooks[index]["writerName"]!}",
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
