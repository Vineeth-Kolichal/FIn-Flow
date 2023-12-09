import 'package:fin_flow/common/widgets/space.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart';

mixin HomeHelper{

  Future<dynamic> addTransactionSheet(BuildContext context) {
    ValueNotifier<TransactionType?> typeNotifier = ValueNotifier(null);
    TextEditingController amountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add Transaction',
                  style: txt16BlackB,
                ),
                Space.y(10),
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Amount",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                ValueListenableBuilder(
                  valueListenable: typeNotifier,
                  builder: (context, type, _) {
                    return Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              value: TransactionType.income,
                              groupValue: type,
                              onChanged: (value) {
                                typeNotifier.value = value;
                                context
                                    .read<AddTransactionSheetCubit>()
                                    .getCategories(value!);
                              },
                            ),
                            const Text('Income')
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              value: TransactionType.expence,
                              groupValue: type,
                              onChanged: (value) {
                                typeNotifier.value = value;
                                context
                                    .read<AddTransactionSheetCubit>()
                                    .getCategories(value!);
                              },
                            ),
                            const Text('Expence')
                          ],
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<AddTransactionSheetCubit,
                        AddTransactionSheetState>(
                      builder: (context, state) {
                        return DropdownButton(
                          hint: const Text("Select category"),
                          value: state.selected,
                          items: List.generate(
                            state.categories.length,
                            (index) => DropdownMenuItem(
                              value: state.categories[index],
                              child: Text(
                                state.categories[index],
                              ),
                            ),
                          ),
                          onChanged: (selected) {
                            context
                                .read<AddTransactionSheetCubit>()
                                .selectCategories(selected!);
                          },
                        );
                      },
                    ),
                    TextButton.icon(
                      onPressed: () {
                        addCategoryDialoge(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        size: 12,
                        color: AppTheme.blueColor,
                      ),
                      label: const Text(
                        'Add category',
                        style: txt12Blue,
                      ),
                    )
                  ],
                ),
                Space.y(10),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Short description",
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                Space.y(10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.blackColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add Transaction",
                      style: txt14WhiteB,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addCategoryDialoge(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) {
        ValueNotifier<TransactionType?> typeNotifier = ValueNotifier(null);
        return AlertDialog(
          title: const Text(
            'Add Category',
            style: txt14Black,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Category name",
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              ValueListenableBuilder(
                valueListenable: typeNotifier,
                builder: (context, type, _) {
                  return Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: TransactionType.income,
                            groupValue: type,
                            onChanged: (value) {
                              typeNotifier.value = value;
                              context
                                  .read<AddTransactionSheetCubit>()
                                  .getCategories(value!);
                            },
                          ),
                          const Text('Income')
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                            value: TransactionType.expence,
                            groupValue: type,
                            onChanged: (value) {
                              typeNotifier.value = value;
                              context
                                  .read<AddTransactionSheetCubit>()
                                  .getCategories(value!);
                            },
                          ),
                          const Text('Expence')
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.blackColor),
              child: const Text(
                "Add",
                style: txt14WhiteB,
              ),
            )
          ],
        );
      },
    );
  }

}