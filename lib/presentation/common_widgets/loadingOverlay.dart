import 'package:flutter/material.dart';
import 'package:psucoop_mobile/core/themes/app_images.dart';
import 'package:psucoop_mobile/presentation/common_widgets/sizebox_widgets.dart';

import '../../core/themes/app_color.dart';
import '../../data/helpers/context_ext.dart';
import 'loader.dart';

class LoadingOverlay extends StatefulWidget {
  final bool isLoading;
  final double opacity;
  final Color? color;
  final String label;
  final Widget progressIndicator;
  final Widget child;

  const LoadingOverlay({
    required this.isLoading,
    required this.child,
    this.opacity = 1,
    this.label = '',
    this.progressIndicator = const CircularProgressIndicator(),
    this.color,
  });

  @override
  LoadingOverlayState createState() => LoadingOverlayState();
}

class LoadingOverlayState extends State<LoadingOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool? _overlayVisible;

  LoadingOverlayState();

  @override
  void initState() {
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      status == AnimationStatus.forward
          ? setState(() => {_overlayVisible = true})
          : null;
      status == AnimationStatus.dismissed
          ? setState(() => {_overlayVisible = false})
          : null;
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(LoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.opacity,
              child: ModalBarrier(
                dismissible: false,
                color: AppColor.backgroundGray,
              ),
            ),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // widget.progressIndicator,
                Image.asset(AppImages.psucoop_logo,
                    fit: BoxFit.fill,
                    width: context.screenHeight / 2,
                    height: context.screenHeight / 8),
                sizeboxHeight50(),
                Loader(),
                sizeboxHeight10(),
                Text(widget.label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: AppColor.black)),
              ],
            )),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}
