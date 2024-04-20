import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:second_task/core/assets/assets.gen.dart';
import 'package:second_task/core/extension/color_extension.dart';
import 'package:second_task/core/extension/context_extension.dart';
import 'package:second_task/core/widgets/w_app_loader.dart';

class WSharedScaffold extends StatefulWidget {
  const WSharedScaffold({
    super.key,
    required this.body,
    this.title,
    this.withBackButton = true,
    this.withNavBar = false,
    this.isLoading = false,
    this.resizeToAvoidBottomInset = true,
    this.onBackButtonTap,
    this.bottomSheet,
    this.bottomSheetHeight,
  });

  final String? title;
  final bool withBackButton;
  final bool withNavBar;
  final bool isLoading;
  final bool resizeToAvoidBottomInset;

  final Widget body;
  final Widget? bottomSheet;
  final Function()? onBackButtonTap;
  final double? bottomSheetHeight;

  @override
  State<WSharedScaffold> createState() => _WSharedScaffoldState();
}

class _WSharedScaffoldState extends State<WSharedScaffold> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Close the keyboard when click anywhere on the screen except an input field.
      onTap: () => FocusScope.of(context).focusedChild?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: context.theme.colorScheme.primaryColor300,
        bottomSheet: widget.bottomSheet != null
            ? Container(
                height: widget.bottomSheetHeight ?? 82.h,
                padding: EdgeInsets.only(
                  top: 8.h,
                  bottom: Platform.isIOS ? 16.h : 8.h,
                  right: 20.w,
                  left: 20.w,
                ),
                color: Colors.white,
                child: widget.bottomSheet,
              )
            : null,
        body: Stack(
          children: [
            /// [BackGround Image]
            Container(
              height: 250.h,
              decoration: BoxDecoration(
                color: context.theme.colorScheme.primaryColor400,
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ///[AppBar]
                Container(
                  padding: EdgeInsets.only(
                    top: (widget.withBackButton || widget.title != null) ? 50.h : 15.h,
                    left: 16.w,
                    right: 16.w,
                    bottom: 16.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      (widget.withBackButton)
                          ? InkWell(
                              onTap: widget.onBackButtonTap ?? () => Modular.to.pop(),
                              child: CircleAvatar(
                                radius: 18.r,
                                backgroundColor: context.theme.colorScheme.naturalColor0,
                                child: SvgPicture.asset(
                                  width: 7.w,
                                  height: 13.h,
                                  Assets.icons.backArrow.path,
                                  colorFilter: ColorFilter.mode(
                                    context.theme.colorScheme.naturalColor600,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(
                              width: 36.w,
                              height: 36.h,
                            ),
                      Text(
                        widget.title ?? '',
                        style: context.textTheme.titleLarge?.copyWith(
                          color: context.theme.colorScheme.naturalColor0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                ///[Body]
                Expanded(
                  child: Container(
                    width: context.width,
                    padding: EdgeInsets.only(
                      right: 16.w,
                      left: 16.w,
                      top: 24.h,
                      bottom: !widget.resizeToAvoidBottomInset && MediaQuery.of(context).viewInsets.bottom > 10
                          ? MediaQuery.of(context).viewInsets.bottom
                          : widget.withNavBar
                              ? 80.h
                              : 24.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.r),
                        topRight: Radius.circular(40.r),
                      ),
                    ),
                    child: widget.body,
                  ),
                ),
              ],
            ),

            if (widget.isLoading)
              Container(
                height: context.height,
                color: context.theme.colorScheme.naturalColor200.withOpacity(0.2),
                child: const WAppLoader(),
              ),
          ],
        ),
      ),
    );
  }
}
