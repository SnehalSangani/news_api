import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/news_provider.dart';
import 'package:news_api/utils/api_helper.dart';
import 'package:provider/provider.dart';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  Newsprovider? newsprovidertrue;
  Newsprovider? newsproviderfalse;

  @override


  void initState() {
    super.initState();
    Provider.of<Newsprovider>(context, listen: false).callapi();
  }

  @override
  Widget build(BuildContext context) {
    newsproviderfalse = Provider.of(context, listen: false);
    newsprovidertrue = Provider.of(context, listen: true);

    return SafeArea(
      child: Scaffold(
        body: newsprovidertrue!.newsmodel == null
            ? Container()
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'second',arguments: index);
                      },
                      child: Container(
                        height: 70,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 2,color: Colors.black)
                        ),
                        child: ListTile(
                          title: Text(
                              "${newsproviderfalse!.newsmodel!.articlelist![index].s1!.name}"),
                          leading: Container(
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${newsproviderfalse!.newsmodel!.articlelist![index].urlToImage}"),
                              )
                            ),

                          ),
                          subtitle: Text("${newsproviderfalse!.newsmodel!.articlelist![index].author}"),
                          trailing: Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: newsproviderfalse!.newsmodel!.articlelist!.length),
      ),
    );
  }
}
