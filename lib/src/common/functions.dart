import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void loading() {
  EasyLoading.show(
    maskType: EasyLoadingMaskType.clear,
    // status: 'loading',
    dismissOnTap: false,
    indicator: const CupertinoActivityIndicator(
      color: Colors.green,
    ),
  );
}

void dismissLoading() {
  EasyLoading.dismiss();
}
