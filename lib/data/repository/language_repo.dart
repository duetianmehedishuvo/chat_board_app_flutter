import 'package:flutter/material.dart';
import 'package:tutorial/data/model/response/language_model.dart';
import 'package:tutorial/util/app_constant.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages({BuildContext context}) {
    return AppConstant.languages;
  }
}
