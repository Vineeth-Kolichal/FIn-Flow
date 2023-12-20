

import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/presentation/helper/home_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/theme/fin_flow_icons_icons.dart';
import '../../../../core/theme/text_styles.dart';
import '../bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';

class TransactionListTile extends StatelessWidget with HomeHelper {
  const TransactionListTile({
    super.key,
    required this.data,
  });

  final TransactionEntity data;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            BlocListener<HomeScreenBloc, HomeScreenState>(
              listener: (context, state) {
                if (state.dErr != null) {
                  Fluttertoast.showToast(
                    msg: "${state.dErr}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: FinFlowTheme.blackColor,
                    textColor: FinFlowTheme.whiteColor,
                    fontSize: 12.0,
                  );
                }
                if (state.dSuccess != null) {
                  Fluttertoast.showToast(
                    msg: "${state.dSuccess}",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: FinFlowTheme.blackColor,
                    textColor: FinFlowTheme.whiteColor,
                    fontSize: 12.0,
                  );
                }
              },
              child: SlidableAction(
                onPressed: (_) {
                  context
                      .read<HomeScreenBloc>()
                      .add(DeleteTransaction(entity: data));
                },
                backgroundColor: theme.canvasColor,
                foregroundColor: FinFlowTheme.greyColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
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
          color: theme.canvasColor,
          child: ListTile(
            leading: data.isIncome
                ? const Icon(
                    FinFlowIcons.arrow_circle_up,
                    color: FinFlowTheme.greenColor,
                  )
                : const Icon(
                    FinFlowIcons.arrow_circle_down,
                    color: FinFlowTheme.redColor,
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