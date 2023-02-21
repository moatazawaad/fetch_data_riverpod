import 'package:fetch_data_riverpod/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, ref) {
    final viewModel = ref.watch(getDataFuture);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data From API Using Riverpod'),
      ),
      body: viewModel.listDataModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.listDataModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      viewModel.listDataModel[index].title.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      viewModel.listDataModel[index].body.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        viewModel.listDataModel[index].id.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
