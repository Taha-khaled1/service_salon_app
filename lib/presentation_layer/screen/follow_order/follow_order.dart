import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:single_salon/application_layer/utils/handling.dart';
import 'package:single_salon/application_layer/utils/statusrequst.dart';
import 'package:single_salon/data_layer/models/follow_book_model.dart';
import 'package:single_salon/data_layer/models/order_model.dart';
import 'package:single_salon/data_layer/resbons_function/home._resbons.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/handlingView/handlingview.dart';

class FollowOrderScreen extends StatefulWidget {
  const FollowOrderScreen({Key? key}) : super(key: key);

  @override
  State<FollowOrderScreen> createState() => _FollowOrderScreenState();
}

class _FollowOrderScreenState extends State<FollowOrderScreen> {
  late StatusRequest statusRequest2;
  OrderFollowModel? cartItemModel;
  getCartItemt() async {
    try {
      statusRequest2 = StatusRequest.loading;
      var response = await getfollowOrderRespon();
      statusRequest2 = handlingData(response);
      if (statusRequest2 == StatusRequest.success) {
        cartItemModel = await OrderFollowModel.fromJson(response);
      } else {
        statusRequest2 = StatusRequest.failure;
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
                        '#',
                        style: TextStyle(color: Colors.white),
                      ),
                      size: ColumnSize.L,
                    ),
                    DataColumn2(
                      label: Text(
                        'status',
                        style: TextStyle(color: Colors.white),
                      ),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text(
                        'Total Price',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'The date of Order',
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
                            cartItemModel?.data![index].status ?? "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            cartItemModel?.data![index].total ?? "title ",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        DataCell(
                          Text(
                            cartItemModel?.data![index].theDateOfOrder ??
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
