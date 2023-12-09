
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/export_common_widgets.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> selectionTitle = ["Today", "This month", "Custom"];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              children: List.generate(
            selectionTitle.length,
            (index) => Container(
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(90),
                  border: Border.all(
                      color: (index == 0)
                          ? AppTheme.blueColor
                          : AppTheme.greyColor,
                      width: 0.5)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  selectionTitle[index],
                  style: (index == 0) ? txt12Blue : txt12Grey,
                ),
              ),
            ),
          )),
          Space.y(10),
          Container(
            padding: EdgeInsets.all(
              15,
            ),

            width: size.width,
            // height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
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
      ),
    );
  }
}
