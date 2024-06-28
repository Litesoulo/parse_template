import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'store/news_store.dart';

import '../../../../sl.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          sl<NewsStore>().getItems(fromApi: true);
        },
        child: Observer(builder: (_) {
          final itemsList = sl<NewsStore>().itemsList;
          final itemsListFuture = sl<NewsStore>().itemsFuture;

          switch (itemsListFuture.status) {
            case FutureStatus.fulfilled:
              return ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  final currentItem = itemsList.elementAt(index);

                  return Text(currentItem.name);
                },
              );
            case FutureStatus.pending:
              return const Center(child: CircularProgressIndicator());
            default:
              return ListView();
          }
        }),
      ),
    );
  }
}
