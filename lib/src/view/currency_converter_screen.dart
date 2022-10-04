import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../bloc/currency_converter_cubit.dart';
import '../data/repositories/currency_repository.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
            create: (context) =>
                CurrencyCubit(GetIt.instance.get<CurrencyRepository>())
                  ..getCurrencyAsync(),
            child: BlocConsumer<CurrencyCubit, CurrencyState>(
              builder: (context, state) {
                if (state is CurrencyLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CurrencySuccess) {
                  var keys = state.response?.keys.toList();
                  var values = state.response?.values.toList();
                  return ListView.builder(
                    itemCount: state.response?.length,
                      itemBuilder: (context, index) => Row(children: [
                            Text(state.response![keys?[index]] ?? ""),
                            const Spacer(),
                            Text(state.response?[values?[index]] ?? "")
                          ]));
                } else {
                  return Container();
                }
              },
              listener: (context, state) {},
            )),
      ),
    );
  }
}
