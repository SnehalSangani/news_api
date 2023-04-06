import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/news_provider.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  Newsprovider? newsprovidertrue;
  Newsprovider? newsproviderfalse;

  @override
  Widget build(BuildContext context) {
    newsproviderfalse = Provider.of<Newsprovider>(context, listen: false);
    newsprovidertrue = Provider.of<Newsprovider>(context, listen: true);
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                width: 500,
                child: Image.network(
                  "${newsproviderfalse!.newsmodel!.articlelist![index].urlToImage}",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${newsproviderfalse!.newsmodel!.articlelist![index].publishedAt}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 400,
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(width: 2, color: Colors.black), color: Colors.cyan.shade50,),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Text(
                            "${newsproviderfalse!.newsmodel!.articlelist![index].content}",
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(height: 20,),
                          Text("===============================================================",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 20,),
                          Text("${newsproviderfalse!.newsmodel!.articlelist![index].title}",style: TextStyle(fontSize: 17),),
                          SizedBox(height: 20,),
                          Text("===============================================================",style: TextStyle(fontSize: 10),),
                          SizedBox(height: 20,),
                          Text("${newsproviderfalse!.newsmodel!.articlelist![index].url}",style: TextStyle(fontSize: 17),)
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
