import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos_app/core/constants/colors.dart';
import 'package:flutter_pos_app/core/extensions/build_context_ext.dart';
import 'package:flutter_pos_app/data/datasources/product_local_datasource.dart';
import 'package:flutter_pos_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_pos_app/presentation/setting/bloc/bloc/sync_order_bloc.dart';
import 'package:flutter_pos_app/presentation/setting/pages/manage_printer_page.dart';

import '../../../data/datasources/auth_local_datasource.dart';
import '../../auth/pages/login_page.dart';
import '../../home/bloc/logout/logout_bloc.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Setting')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  context.push(const ManagePrinterPage());
                }, 
                child: const Text('Manage Printer'))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<ProductBloc, ProductState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    success: (_) async {
                      await ProductLocalDatasource.instance.removeAllProduct();
                      await ProductLocalDatasource.instance
                          .insertAllProduct(_.products.toList());
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: AppColors.primary,
                          content: Text('Sync Data Product Success')));
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return ElevatedButton(
                        onPressed: () {
                          context
                              .read<ProductBloc>()
                              .add(const ProductEvent.fetch());
                        },
                        child: const Text('Sync Data'),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<SyncOrderBloc, SyncOrderState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    success: (_) async {
                      // await ProductLocalDatasource.instance.removeAllProduct();
                      // await ProductLocalDatasource.instance
                      //     .insertAllProduct(_.products.toList());
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: AppColors.primary,
                          content: Text('Sync Data Order Success'),
                      ),);
                    },
                  );
                },
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return ElevatedButton(
                        onPressed: () {
                          context
                              .read<SyncOrderBloc>()
                              .add(const SyncOrderEvent.sendOrder());
                        },
                        child: const Text('Sync Data Order'),
                      );
                    },
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<LogoutBloc, LogoutState>(
                listener: (context, state) {
                  state.maybeMap(
                    orElse: () {},
                    success: (_) {
                      AuthLocalDatasource().removeAuthData();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Logout'),
                            content:
                                const Text('Are you sure you want to logout?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  context
                                      .read<LogoutBloc>()
                                      .add(const LogoutEvent.logout());
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red,
                                ),
                                child: const Text('Keluar'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Logout'),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
