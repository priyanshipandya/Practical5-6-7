import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:practical5/constants/string_constant.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key, this.index, this.newsapi, this.fromPage}) : super(key: key);
  final index;
  final newsapi;
  final fromPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Observer(
            builder: (context) => newsapi.apidataAll?.status ==
                    FutureStatus.pending
                ? Center(child: CircularProgressIndicator())
                : Column(
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
                        tag: fromPage == "fav" ? "${newsapi.favList[index].title}" : "${newsapi.apidataAll?.value?.data?[index].title}" ,
                        child: Image.network(fromPage == "fav" ? "${newsapi.favList[index].images}" :
                          "${newsapi.apidataAll?.value?.data?[index].images}",
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15),
                        child: Text(fromPage == "fav" ? "${newsapi.favList[index].title}" :
                        "${newsapi.apidataAll?.value?.data?[index].title}",
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
                              "${newsapi.apidataAll?.value?.data?[index].author}",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Spacer(flex: 1),
                            IconButton(
                              onPressed: () {
                                newsapi.toggleStar(index);
                              },
                              icon: newsapi.starList![index]
                                  ? Icon(Icons.star)
                                  : Icon(Icons.star_border_outlined),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(fromPage == "fav" ? "${newsapi.favList[index].decription}" :
                        "${newsapi.apidataAll?.value?.data?[index].decription}",
                          // widget.news.content!,
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
