import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/home/presentation/helper/home_helper.dart';
import 'package:flutter/material.dart';

import '../widgets/top_section.dart';

class HomeScreen extends StatelessWidget with HomeHelper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FinFlow'),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          )
        ],
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: TopSection(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Container(
                color: AppTheme.whiteColor,
                child: ListTile(
                  leading: Icon(
                    Icons.arrow_circle_up,
                    color: AppTheme.greenColor,
                  ),
                  title: Text('₹1000.00'),
                  subtitle: RichText(
                      text: TextSpan(
                          style: txt12Blue,
                          text: "Food :",
                          children: [TextSpan(text: "Tea", style: txt12Grey)])),
                  trailing: Text('Today'),
                ),
              ),
            ),
            childCount: 10,
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.blackColor,
        onPressed: () {
          addTransactionSheet(context);
        },
        child: const Icon(
          FinFlowIcons.rupee,
          color: AppTheme.whiteColor,
        ),
      ),
    );
  }
}

enum TransactionType { income, expence }
