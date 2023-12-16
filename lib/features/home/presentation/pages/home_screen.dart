import 'package:fin_flow/common/widgets/space.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';
import 'package:fin_flow/features/home/presentation/helper/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widgets/top_section.dart';

class HomeScreen extends StatelessWidget with HomeHelper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      filter(
          currrentIndex: 0,
          filteredDate: (fromDate, toDate) {
            context.read<HomeScreenBloc>().add(
                  GetTransactions(
                    fromDate: fromDate,
                    toDate: toDate,
                  ),
                );
          });
      // context.read<HomeScreenBloc>().add(GetTransactions(
      //     fromDate: DateTime(2023, DateTime.now().month, DateTime.now().day),
      //     toDate: DateTime.now()));
    });
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(tag: 'logo', child: Text('FinFlow')),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(),
          )
        ],
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          print("${state.error}");
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          //  else if (state.error != null) {
          //   return Center(
          //     child: Container(
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: AppTheme.whiteColor),
          //       width: size.width * 0.8,
          //       height: size.width * 0.5,
          //       child: Center(
          //         child: Column(
          //           children: [
          //             Image.asset(
          //               'assets/images/error.png',
          //               height: 70,
          //             ),
          //             const Text(
          //               'Error',
          //               style: txt18RedB,
          //             ),
          //             Space.y(5),
          //             Text(
          //               "${state.error}",
          //               textAlign: TextAlign.center,
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   );
          // }
          else {
            final dataList = state.transactionList;

            return CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: TopSection(transactionList: state.transactionList),
              ),
              (dataList.isEmpty)
                  ? SliverToBoxAdapter(
                      child: SizedBox(
                        height: size.width,
                        width: size.width,
                        child: const Center(
                          child: Text('Transaction list is empty'),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            TransactionListTile(data: dataList[index]),
                        childCount: dataList.length,
                      ),
                    )
            ]);
          }
        },
      ),
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

class TransactionListTile extends StatelessWidget with HomeHelper {
  const TransactionListTile({
    super.key,
    required this.data,
  });

  final TransactionEntity data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {},
              backgroundColor: AppTheme.whiteColor,
              foregroundColor: AppTheme.greyColor,
              icon: Icons.delete,
              label: 'Delete',
            ),
            // SlidableAction(
            //   onPressed: (_) {},
            //   backgroundColor: AppTheme.whiteColor,
            //   foregroundColor: AppTheme.greyColor,
            //   icon: Icons.edit,
            //   label: 'Edit',
            // ),
          ],
        ),
        child: Container(
          color: AppTheme.whiteColor,
          child: ListTile(
            leading: data.isIncome
                ? const Icon(
                    FinFlowIcons.arrow_circle_up,
                    color: AppTheme.greenColor,
                  )
                : const Icon(
                    FinFlowIcons.arrow_circle_down,
                    color: AppTheme.redColor,
                  ),
            title: Text('₹${data.amount}'),
            subtitle: RichText(
                text: TextSpan(
                    style: txt12Blue,
                    text: "${data.category} :",
                    children: [
                  TextSpan(text: data.description, style: txt12Grey)
                ])),
            trailing: Text(convertDate(data.date!)),
          ),
        ),
      ),
    );
  }
}

enum TransactionType { income, expence }
