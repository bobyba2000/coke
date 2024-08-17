import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'scroll_transform_item.dart';

class ScrollTransformView extends StatefulWidget {
  final ScrollController? scrollController;
  final List<ScrollTransformItem> children;
  const ScrollTransformView({
    Key? key,
    required this.children,
    this.scrollController,
  }) : super(key: key);

  @override
  State<ScrollTransformView> createState() => _ScrollTransformViewState();
}

class _ScrollTransformViewState extends State<ScrollTransformView> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = widget.scrollController ?? ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: ChangeNotifierProvider(
        create: (context) => scrollController,
        child: Column(
          children: widget.children,
        ),
      ),
    );
  }
}
