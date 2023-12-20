import 'package:fin_flow/core/theme/app_theme.dart';
import 'package:fin_flow/core/theme/fin_flow_icons_icons.dart';
import 'package:fin_flow/features/home/presentation/bloc_and_cubits/home_screen_bloc/home_screen_bloc.dart';
import 'package:fin_flow/features/home/presentation/helper/home_helper.dart';
import 'package:fin_flow/features/home/presentation/widgets/transaction_list_tile.dart';
import 'package:fin_flow/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/widgets/space.dart';
import '../widgets/top_section.dart';

enum ProfilePopUpItem { manageCategory, changeTheme, logout }

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
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
                tag: 'logo',
                child: Image.asset(
                  theme.brightness == Brightness.light
                      ? 'assets/images/fin_flow_logo.png'
                      : 'assets/images/fin_flow_logo_inverted.png',
                  height: 30,
                )),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<ProfilePopUpItem>(
                onSelected: (selected) async {
                  if (selected == ProfilePopUpItem.logout) {
                    logoutDialoge(context);
                  }
                  if (selected == ProfilePopUpItem.changeTheme) {
                    isDark.value = !isDark.value;
                    SharedPreferences shared =
                        await SharedPreferences.getInstance();
                    shared.setBool('theme', isDark.value);
                  }
                  if (selected == ProfilePopUpItem.manageCategory) {
                    Fluttertoast.showToast(
                      msg: "Manage category feature is not available now",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: FinFlowTheme.blackColor,
                      textColor: FinFlowTheme.whiteColor,
                      fontSize: 12.0,
                    );
                  }
                },
                child: CircleAvatar(
                  radius: 17,
                  backgroundImage: NetworkImage(FirebaseAuth
                          .instance.currentUser?.photoURL ??
                      'https://www.sunsetlearning.com/wp-content/uploads/2019/09/User-Icon-Grey-300x300.png'),
                ),
                itemBuilder: (ctx) {
                  return [
                    const PopupMenuItem<ProfilePopUpItem>(
                      value: ProfilePopUpItem.manageCategory,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Manage Categories'),
                          Icon(Icons.settings_applications_sharp)
                        ],
                      ),
                    ),
                    PopupMenuItem<ProfilePopUpItem>(
                      value: ProfilePopUpItem.changeTheme,
                      child: ValueListenableBuilder(
                          valueListenable: isDark,
                          builder: (context, isDark, _) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(isDark
                                    ? 'Switch to Light theme'
                                    : "Switch to Dark theme"),
                                Icon(isDark
                                    ? Icons.light_mode_rounded
                                    : Icons.dark_mode_rounded)
                              ],
                            );
                          }),
                    ),
                    const PopupMenuItem<ProfilePopUpItem>(
                      value: ProfilePopUpItem.logout,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Logout'), Icon(Icons.logout)],
                      ),
                    ),
                  ];
                }),
          )
        ],
      ),
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.error != null) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: theme.canvasColor),
                width: size.width * 0.8,
                height: size.width * 0.5,
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/error.png',
                        height: 70,
                      ),
                      Text(
                        'Error',
                        style: theme.textTheme.labelLarge?.copyWith(
                            color: FinFlowTheme.redColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Space.y(5),
                      Text(
                        "${state.error}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
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
        backgroundColor: theme.brightness == Brightness.light
            ? FinFlowTheme.blackColor
            : FinFlowTheme.whiteColor,
        onPressed: () {
          addTransactionSheet(context);
        },
        child: Icon(
          FinFlowIcons.rupee,
          color: theme.brightness != Brightness.light
              ? FinFlowTheme.blackColor
              : FinFlowTheme.whiteColor,
        ),
      ),
    );
  }
}

enum TransactionType { income, expence }
