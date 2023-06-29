import 'package:flutter/material.dart';
import 'package:single_salon/presentation_layer/Infowidget/ui_components/info_widget.dart';
import 'package:single_salon/presentation_layer/components/appbar1.dart';
import 'package:single_salon/presentation_layer/resources/color_manager.dart';
import 'package:single_salon/presentation_layer/resources/font_manager.dart';
import 'package:single_salon/presentation_layer/resources/styles_manager.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarScreenWithBack('التقويم'),
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
            child: SfDateRangePicker(
              monthCellStyle: DateRangePickerMonthCellStyle(
                textStyle: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextblack,
                  fontSize: FontSize.s18,
                ),
              ),
              yearCellStyle: DateRangePickerYearCellStyle(
                textStyle: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextblack,
                  fontSize: FontSize.s18,
                ),
              ),
              headerStyle: DateRangePickerHeaderStyle(
                textStyle: MangeStyles().getBoldStyle(
                  color: ColorManager.kTextblack,
                  fontSize: FontSize.s18,
                ),
              ),
              startRangeSelectionColor: Colors.white,
              selectionTextStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextblack,
                fontSize: FontSize.s18,
              ),
              view: DateRangePickerView.month,
              endRangeSelectionColor: Colors.white,
              backgroundColor: Colors.transparent,
              rangeSelectionColor: Colors.white,
              rangeTextStyle: MangeStyles().getBoldStyle(
                color: ColorManager.kTextlightgray,
                fontSize: FontSize.s18,
              ),
              selectionColor: ColorManager.kPrimary,
              todayHighlightColor: ColorManager.kPrimary2,
              onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                print(
                  dateRangePickerSelectionChangedArgs.value
                      .toString()
                      .substring(0, 10),
                );
              },
              selectionMode: DateRangePickerSelectionMode.single,
              initialSelectedRange: PickerDateRange(
                DateTime.now().subtract(
                  const Duration(days: 4),
                ),
                DateTime.now().add(
                  const Duration(days: 3),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
