import 'package:flutter/material.dart';

class ContextProvider {
  late BuildContext context;

  void setContext(BuildContext ctx) {
    context = ctx;
  }
}