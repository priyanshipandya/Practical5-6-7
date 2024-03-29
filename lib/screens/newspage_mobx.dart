import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:practical5/constants/string_constant.dart';
import '../main.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key, this.data}) : super(key: key);
  final data;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: newsapi.apidataAll?.status == FutureStatus.pending
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Text(
                              "${StringConstants.back}",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(Icons.share),
                            ),
                          ],
                        ),
                      ),
                      Hero(
                        tag: "${data.title}",
                        child: Image.network(
                          "${data.images}",
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Text(
                          "${data.title}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Times New Roman'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child: Row(
                          children: [
                            Text(
                              "${StringConstants.writtenByBestFolkMedicine}",
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(flex: 5),
                            Text(
                              "${data.author}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(flex: 1),
                            Observer(
                              builder: (context) {
                                return IconButton(
                                  onPressed: () {
                                    newsapi.toggleStar(data);
                                  },
                                  icon: newsapi.favList.contains(data)
                                      ? Icon(Icons.star)
                                      : Icon(Icons.star_border_outlined),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "${data.decription}",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontStyle: FontStyle.italic,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
