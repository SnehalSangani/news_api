import 'package:flutter/material.dart';
import 'package:news_api/screen/home/model/news_model.dart';
import 'package:news_api/utils/api_helper.dart';

class Newsprovider extends ChangeNotifier
{
  Apihelper apihelper=Apihelper();
  Newsmodel? newsmodel;
  Future<void> callapi() async {
    Newsmodel n1 = await apihelper.Newsapicall();
    newsmodel=n1;
    notifyListeners();
  }
}
