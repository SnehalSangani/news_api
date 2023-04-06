import 'package:flutter/material.dart';
import 'package:news_api/screen/home/provider/news_provider.dart';
import 'package:news_api/screen/home/view/news_screen.dart';
import 'package:news_api/screen/home/view/second.dart';
import 'package:news_api/screen/tabscreen.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Newsprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => tab(),
          'second':(context) => second(),
        },
      ),
    )
  );
}