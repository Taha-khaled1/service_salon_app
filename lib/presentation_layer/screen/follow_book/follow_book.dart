import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/follow_book_model.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/components/custombutten.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';

class FollowBookScreen extends StatefulWidget {
  const FollowBookScreen({Key? key}) : super(key: key);

  @override
  State<FollowBookScreen> createState() => _FollowBookScreenState();
}

class _FollowBookScreenState extends State<FollowBookScreen> {
  late StatusRequest statusRequest2;
  followBookingModel? cartItemModel;
  getCartItemt() async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getfollowBookRespon();
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        cartItemModel = await followBookingModel.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.serverfailure;
      }
    } catch (e) {
      statusRequest2 = StatusRequest.erorr;
    }
    setState(() {});
  }

  @override
  void initState() {
    getCartItemt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScreenWithBack('لوحة التحكم'),
      body: InfoWidget(
        builder: (context, deviceInfo) {
          return Container(
            width: deviceInfo.localWidth,
            height: deviceInfo.localHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/backgraound.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: HandlingDataView(
              statusRequest: statusRequest2,
              widget: Padding(
                padding: const EdgeInsets.all(16),
                child: DataTable2(
                  columnSpacing: 12,
                  horizontalMargin: 10,
                  minWidth: 600,
                  columns: [
                    DataColumn2(
                      label: Text(
                        'Number of Sessions',
                        style: TextStyle(color: Colors.white),
                      ),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text(
                        'Service Name',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'The date of Booking',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    cartItemModel?.data?.length ?? 0,
                    (index) => DataRow(
                      cells: [
                        DataCell(
                          Text(
                            '$index',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            cartItemModel?.data![index].title ?? "title ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            cartItemModel?.data![index].theDateOfBooking ??
                                "theDateOfBooking",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
