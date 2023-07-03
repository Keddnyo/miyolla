import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:miyolla/src/app/model/firmwares/firmware_response_model.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/remote/firmware_request.dart';
import 'package:miyolla/src/ui/screen/firmwares_feed_screen/feed_card.dart';
import 'package:miyolla/src/ui/screen/firmwares_feed_screen/feed_navigation_drawer.dart';

import '../../../app/model/firmwares/firmware_request_model.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final PagingController<int, FirmwareResponseModel> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await FirmwareRequest.fetchFirmware(
        FirmwareRequestModel.list[pageKey],
      );
      final isLastPage = pageKey == FirmwareRequestModel.list.length - 1;
      if (isLastPage) {
        _pagingController.appendLastPage(
          newItems != null ? [newItems] : [],
        );
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(
          newItems != null ? [newItems] : [],
          nextPageKey,
        );
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.feedTitle),
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      drawer: const FeedNavigationDrawer(),
      body: PagedListView<int, FirmwareResponseModel>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<FirmwareResponseModel>(
          itemBuilder: (context, item, index) {
            return Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1024),
                child: FeedCard(firmware: item),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pagingController.dispose();
  }
}
