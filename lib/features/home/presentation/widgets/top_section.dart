import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';
import 'package:fin_flow/features/home/presentation/helper/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../common/widgets/export_common_widgets.dart';

ValueNotifier<int> timeFrameSelected = ValueNotifier(0);

class TopSection extends StatelessWidget with HomeHelper {
  const TopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    Size size = MediaQuery.of(context).size;
    List<String> selectionTitle = ["Today", "This month", "Custom"];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ValueListenableBuilder(
          valueListenable: timeFrameSelected,
          builder: (context, value, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: List.generate(
                  selectionTitle.length,
                  (index) => InkWell(
                    borderRadius: BorderRadius.circular(90),
                    onTap: () {
                      timeFrameSelected.value = index;
                      if (value == 0 || value == 1) {
                        filter(
                            currrentIndex: value,
                            filteredDate: (fromDate, toDate) {
                              context.read<HomeScreenBloc>().add(
                                  GetTransactions(
                                      fromDate: fromDate, toDate: toDate));
                            });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                              color: (index == value)
                                  ? AppTheme.blueColor
                                  : AppTheme.greyColor,
                              width: 0.5)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Text(
                          selectionTitle[index],
                          style: (index == value) ? txt12Blue : txt12Grey,
                        ),
                      ),
                    ),
                  ),
                )),
                Space.y(10),
                Visibility(
                  visible: value == 2,
                  child: const CustomDateRow(),
                ),
                Space.y(10),
                Container(
                  padding: const EdgeInsets.all(
                    15,
                  ),

                  width: size.width,
                  // height: 200,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/chart.png',
                        ),
                        opacity: 0.1,
                        fit: BoxFit.cover),
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today',
                            style: txt16BlackB,
                          ),
                          InkWell(
                              onTap: () {},
                              child: Icon(
                                FinFlowIcons.file_pdf,
                                size: 17,
                                color: AppTheme.redColor,
                              ))
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 70,
                        child: Center(
                          child: Text(
                            '₹0.0',
                            style: txt35GreenB,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_circle_up,
                            color: AppTheme.greenColor,
                          ),
                          Text(
                            '₹0.0',
                            style: txt18GreenB,
                          ),
                          SizedBox(
                            width: 15,
                            height: 20,
                            child: Center(
                              child: VerticalDivider(),
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_down,
                            color: AppTheme.redColor,
                          ),
                          Text(
                            '₹0.0',
                            style: txt18RedB,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Space.y(10),
                Text('Transactions')
              ],
            );
          }),
    );
  }
}

class CustomDateRow extends StatelessWidget {
  const CustomDateRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime? fromDate;
    DateTime? toDate;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DateSelectionButton(
            onPressed: (from) {
              fromDate = from;
            },
            title: "From date :"),
        Space.x(20),
        DateSelectionButton(
            onPressed: (to) {
              toDate = to;
            },
            title: "To date :"),
        Space.x(20),
        ElevatedButton(
            onPressed: () {
              print("${fromDate.toString()}, ${toDate.toString()}");
            },
            child: Text("Go"))
      ],
    );
  }
}

class DateSelectionButton extends StatelessWidget {
  final String title;
  final Function(DateTime selectedDate) onPressed;

  const DateSelectionButton({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ValueNotifier<DateTime?> dateNotifier = ValueNotifier(null);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: txt12Grey,
        ),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1950),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              dateNotifier.value = pickedDate;
              onPressed(pickedDate);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.greyColor),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 17,
                ),
                Space.x(5),
                ValueListenableBuilder(
                    valueListenable: dateNotifier,
                    builder: (context, date, _) {
                      String label = "Select Date";
                      if (date != null) {
                        label = DateFormat('dd-MM-yyyy').format(date);
                      }
                      return Text(label);
                    })
              ],
            ),
          ),
        )
      ],
    );
  }
}
