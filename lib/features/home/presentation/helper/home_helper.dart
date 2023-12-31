import 'package:fin_flow/common/widgets/space.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/authentication/presentation/authentication_bloc/authentication_bloc.dart';
import 'package:fin_flow/features/authentication/presentation/pages/login_screen.dart';
import 'package:fin_flow/features/home/domain/entities/transaction_entity.dart';
import 'package:fin_flow/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../bloc_and_cubits/add_transaction_sheet_cubit/add_transaction_sheet_cubit.dart';
import '../bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';

final formKey = GlobalKey<FormState>();
mixin HomeHelper {
  Future<dynamic> addTransactionSheet(BuildContext context) {
    ValueNotifier<TransactionType?> typeNotifier = ValueNotifier(null);
    TextEditingController amountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    String? category;
    ThemeData theme = Theme.of(context);
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Transaction',
                    style: theme.textTheme.labelLarge
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w800),
                  ),
                  Space.y(10),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Amount is required";
                      } else {
                        return null;
                      }
                    },
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
                              const Text('Expense')
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocConsumer<AddTransactionSheetCubit,
                          AddTransactionSheetState>(
                        listener: (context, state) {
                          if (state.successMsg != null) {
                            Fluttertoast.showToast(
                              msg: "${state.successMsg}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: FinFlowTheme.blackColor,
                              textColor: FinFlowTheme.whiteColor,
                              fontSize: 12.0,
                            );
                          }
                          if (state.err != null) {
                            Fluttertoast.showToast(
                              msg: "${state.err}",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: FinFlowTheme.blackColor,
                              textColor: FinFlowTheme.whiteColor,
                              fontSize: 12.0,
                            );
                          }
                        },
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
                              category = selected;
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
                          color: FinFlowTheme.blueColor,
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Short description is required";
                      } else {
                        return null;
                      }
                    },
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
                      style: theme.elevatedButtonTheme.style?.copyWith(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      // style: ElevatedButton.styleFrom(
                      //   backgroundColor: FinFlowTheme.blackColor,
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          double amount =
                              double.parse(amountController.text.trim());
                          bool isIncome =
                              typeNotifier.value == TransactionType.income;

                          context
                              .read<AddTransactionSheetCubit>()
                              .addTransaction(
                                TransactionEntity(
                                  amount: amount,
                                  isIncome: isIncome,
                                  category: category!,
                                  description:
                                      descriptionController.text.trim(),
                                ),
                              );
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
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text(
                        "Add Transaction",
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addCategoryDialoge(BuildContext context) {
    TextEditingController controller = TextEditingController();
    ThemeData theme = Theme.of(context);

    return showDialog(
      context: context,
      builder: (ctx) {
        ValueNotifier<TransactionType?> typeNotifier = ValueNotifier(null);
        return AlertDialog(
          title: Text(
            'Add Category',
            style: theme.textTheme.titleMedium,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller,
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
                              // context
                              //     .read<AddTransactionSheetCubit>()
                              //     .getCategories(value!);
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
                          const Text('Expense')
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
              onPressed: () {
                if (typeNotifier.value != null) {
                  context.read<AddTransactionSheetCubit>().addCategory(
                        type: typeNotifier.value == TransactionType.expence
                            ? "expence"
                            : "income",
                        name: controller.text.trim(),
                      );
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: FinFlowTheme.blackColor),
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

  String convertDate(DateTime date) {
    DateTime today = DateTime.now();
    final yesterday = DateTime.now().subtract(const Duration(days: 1));

    if (today.year == date.year &&
        today.month == date.month &&
        today.day == date.day) {
      return "Today"; // Print 'Today' if the dates are the same
    }
    if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      return "Yesterday";
    } else {
      return DateFormat('dd MMM yyyy').format(date);
    }
  }

  void filter(
      {required int currrentIndex,
      required void Function(DateTime fromDate, DateTime todate)
          filteredDate}) {
    final now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);
    DateTime thisMonthStart = DateTime(now.year, now.month);
    if (currrentIndex == 0) {
      filteredDate(todayStart, now);
    }
    if (currrentIndex == 1) {
      filteredDate(thisMonthStart, now);
    }
  }

  double total(List<TransactionEntity> list) {
    double sum = 0.0;
    for (var t in list) {
      if (t.isIncome) {
        sum = sum + t.amount;
      } else {
        sum = sum - t.amount;
      }
    }

    return sum;
  }

  double totlaIncome(List<TransactionEntity> list) {
    double sum = 0.0;
    for (var t in list) {
      if (t.isIncome) {
        sum = sum + t.amount;
      }
    }
    return sum;
  }

  double totalExpence(List<TransactionEntity> list) {
    double sum = 0.0;
    for (var t in list) {
      if (!(t.isIncome)) {
        sum = sum + t.amount;
      }
    }

    return sum;
  }

  String greeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour < 12) {
      return "Good morning!";
    } else if (hour < 17) {
      return "Good afternoon!";
    } else if (hour < 21) {
      return "Good evening!";
    } else {
      return "Good night!";
    }
  }

  Future<dynamic> logoutDialoge(BuildContext context) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Are you sure?'),
            content:
                const Text("To confirm logout click 'Yes' else click 'No'"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("No")),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationBloc>().add(const Logout());
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => const LoginScreen()),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: FinFlowTheme.blackColor),
                child: const Text(
                  "Yes",
                  style: txt14WhiteB,
                ),
              )
            ],
          );
        });
  }
}
