import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DynamicSliverAppBar extends StatelessWidget {
  final Widget leading;
  final bool automaticallyImplyLeading;
  final Widget title;
  final List<Widget> actions;
  final Widget background; // Add a parameter for the background image
  final double elevation;
  final double scrolledUnderElevation;
  final Color shadowColor;
  final Color surfaceTintColor;
  final bool forceElevated;
  final bool primary;
  final bool centerTitle;
  final bool excludeHeaderSemantics;
  final double titleSpacing;
  final double collapsedHeight;
  final double expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final bool stretch;
  final double stretchTriggerOffset;
  final VoidCallback? onStretchTrigger;
  final ShapeBorder? shape;
  final double toolbarHeight;
  final double? leadingWidth;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool forceMaterialTransparency;
  final Clip? clipBehavior;

  DynamicSliverAppBar({
    Key? key,
    required this.background, // Make background parameter required
    required this.expandedHeight, // Make expandedHeight parameter required
    this.leading = const SizedBox.shrink(),
    this.automaticallyImplyLeading = true,
    this.title = const SizedBox.shrink(),
    this.actions = const [],
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    this.shadowColor = Colors.transparent,
    this.surfaceTintColor = Colors.transparent,
    this.forceElevated = false,
    this.primary = true,
    this.centerTitle = true,
    this.excludeHeaderSemantics = false,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.collapsedHeight = kToolbarHeight,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.stretch = false,
    this.stretchTriggerOffset = 100.0,
    this.onStretchTrigger,
    this.shape,
    this.toolbarHeight = kToolbarHeight,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.forceMaterialTransparency = false,
    this.clipBehavior, required Stack flexibleSpace,
  }) : super(key: key);

  get flexibleSpace => null;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      expandedHeight: expandedHeight,
      elevation: elevation,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      forceElevated: forceElevated,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      collapsedHeight: collapsedHeight,
      floating: floating,
      pinned: pinned,
      snap: snap,
      stretch: stretch,
      stretchTriggerOffset: stretchTriggerOffset,
      // onStretchTrigger: onStretchTrigger,
      shape: shape,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
      forceMaterialTransparency: forceMaterialTransparency,
      clipBehavior: clipBehavior,
      flexibleSpace: Stack(
        children: [
          background,
          flexibleSpace ?? Container(),
        ],
      ),
    );
  }
}
