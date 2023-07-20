import 'package:cocktail_gen/app/constants/app_font_size.dart';
import 'package:cocktail_gen/app/widgets/url_back_button.dart';
import 'package:flutter/material.dart';

class SubRouteAppBar extends AppBar {
  SubRouteAppBar({
    Key? key,
    required String title,
  }) : super(
          key: key,
          centerTitle: true,
          leading: const UrlBackButton(),
          title: Builder(
            builder: (context) {
              return Text(
                title,
                style: TextStyle(
                  fontSize: AppFontSize.title,
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                ),
              );
            },
          ),
        );
}