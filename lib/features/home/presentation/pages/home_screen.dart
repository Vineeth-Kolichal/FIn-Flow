import 'package:fin_flow/common/widgets/space.dart';
import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/core/theme/text_styles.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/cubit/add_transaction_sheet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
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

enum TransactionType { income, expence }


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
