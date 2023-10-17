import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagingListView extends StatefulWidget {
  /// Creates a scrollable, paginated, linear array of widgets.
  ///
  const PagingListView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.onLoadMore,
    this.onRefresh,
    this.scrollDirection = Axis.vertical,
    this.onError,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.padding,
    this.itemExtent,
    this.cacheExtent,
    this.semanticChildCount,
    this.loadMoreWidgetBuilder,
    this.separatorBuilder,
    this.isShowLastDivider = false,
    this.isShowFirstDivider = false,
    this.noDataWidgetBuilder,
    this.isLoadMoreIndicator = false,
    this.shrinkWrap = false,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.onDrag,
  }) : super(key: key);

  /// Function should return a widget
  final IndexedWidgetBuilder itemBuilder;

  ///Build divider
  final IndexedWidgetBuilder? separatorBuilder;

  /// Scroll direction of list view
  final Axis scrollDirection;

  /// Handle error returned by the Future implemented in [pageBuilder]
  final Function(dynamic error)? onError;

  /// Called when the list scrolls to an end
  final Future<void> Function()? onLoadMore;

  /// Called when pull to refresh if onRefresh is not equal null
  final Future<void> Function()? onRefresh;

  ///Ref: ListView widget flutter
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;

  ///Should show last divider, default is false
  final bool isShowLastDivider;

  ///Should show first divider, default is false
  final bool isShowFirstDivider;

  ///Total count
  final int itemCount;

  ///Should show load more circular progress is the first time or not
  final bool isLoadMoreIndicator;

  ///Load more widget if the widget is not assign, using default load more widget
  final WidgetBuilder? loadMoreWidgetBuilder;

  ///No data widget
  final WidgetBuilder? noDataWidgetBuilder;

  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  _PagingListViewState createState() => _PagingListViewState();
}

class _PagingListViewState extends State<PagingListView> {
  bool _isLoading = false;

  ScrollController? scrollController;

  late bool isLoadMoreIndicator;

  @override
  void initState() {
    super.initState();
    isLoadMoreIndicator = widget.isLoadMoreIndicator;
  }

  void _onCheckLoadMore(
    double positionsOfPixels,
    double maxScrollExtent,
  ) async {
    if (positionsOfPixels > 0 &&
        positionsOfPixels + 25 >= maxScrollExtent &&
        maxScrollExtent > 0 &&
        !_isLoading &&
        widget.onLoadMore != null &&
        widget.isLoadMoreIndicator) {
      setState(() {
        _isLoading = true;
        isLoadMoreIndicator = true;
      });
      await widget.onLoadMore!();
      setState(() {
        _isLoading = false;
        isLoadMoreIndicator = false;
      });
    }
  }

  @override
  void didUpdateWidget(PagingListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    isLoadMoreIndicator = widget.isLoadMoreIndicator;
  }

  @override
  Widget build(BuildContext context) {
    final extraCount = (isLoadMoreIndicator && (widget.itemCount) > 0) ? 1 : 0;
    final Widget listView = ListView.separated(
      padding: widget.padding ?? EdgeInsets.zero,
      controller: widget.controller ?? scrollController,
      //onRefresh is not working unless using AlwaysScrollableScrollPhysics
      physics: widget.physics ?? const AlwaysScrollableScrollPhysics(),
      primary: widget.primary,
      reverse: widget.reverse,
      shrinkWrap: widget.shrinkWrap,
      cacheExtent: widget.cacheExtent,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      scrollDirection: widget.scrollDirection,
      itemCount: widget.itemCount + extraCount,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      itemBuilder: _buildItemBuilder,
      separatorBuilder: (ctx, index) =>
          widget.separatorBuilder?.call(ctx, index) ?? const SizedBox(),
    );
    if (widget.onRefresh != null) {
      return _buildStackWidget(
        child: RefreshIndicator(
          onRefresh: widget.onRefresh!,
          child: _buildNotificationScrollList(child: listView),
        ),
      );
    }
    return _buildStackWidget(
      child: _buildNotificationScrollList(child: listView),
    );
  }

  Widget _buildStackWidget({required Widget child}) {
    return Stack(
      children: <Widget>[
        child,
        if (widget.itemCount == 0)
          _buildNoDataWidget()
        else
          const SizedBox.shrink()
      ],
    );
  }

  Widget _buildNotificationScrollList({required Widget child}) {
    return NotificationListener(
      child: child,
      onNotification: (dynamic notification) {
        if (notification is ScrollEndNotification) {
          final double positionsOfPixels = notification.metrics.pixels;
          final double maxScrollExtent = notification.metrics.maxScrollExtent;
          _onCheckLoadMore(positionsOfPixels, maxScrollExtent);
        }
        return false;
      },
    );
  }

  Widget _buildItemBuilder(BuildContext context, int position) {
    if (position >= widget.itemCount) {
      return _buildLoadMoreCircularProgress();
    }

    return widget.itemBuilder(context, position);
  }

  Widget _buildLoadMoreCircularProgress() {
    return widget.loadMoreWidgetBuilder?.call(context) ??
        Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          alignment: Alignment.center,
          child: const CupertinoActivityIndicator(),
        );
  }

  Widget _buildNoDataWidget() {
    return widget.noDataWidgetBuilder?.call(context) ?? const SizedBox();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }
}
