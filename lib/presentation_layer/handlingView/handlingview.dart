import 'package:single_salon/presentation_layer/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../application_layer/utils/statusrequst.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? HandWidget(url: JsonAssets.loading2)
        : statusRequest == StatusRequest.offlinefailure
            ? Center(
                child: SizedBox(
                  height: 60,
                  child: Text(
                    'تحقق من الانترنت الخاص بك',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child: SizedBox(
                      height: 60,
                      child: Text(
                        'يوجد مشكله في الخادم',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )
                : statusRequest == StatusRequest.erorr
                    ? Center(
                        child: SizedBox(
                          height: 60,
                          child: Text(
                            'يوجد مشكله ما يرجي اعادة المحاوله',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    : widget;
  }
}

class HandWidget extends StatelessWidget {
  const HandWidget({
    Key? key,
    required this.url,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(url, width: 150, height: 120, fit: BoxFit.contain),
    );
  }
}
