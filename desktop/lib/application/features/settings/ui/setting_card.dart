import 'package:dive_club/resources/measures.dart';
import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  const SettingCard(
      {Key? key,
      required this.rowData,
      required this.sectionTitle,
      this.displayDivider = false,
      this.crossAxisAlignment = CrossAxisAlignment.start,
      this.cardPaddings = AppMeasures.paddings,
      this.width,
      this.height,
      this.sectionTitleSpace = AppMeasures.space})
      : super(key: key);

  final List<SettingRowData> rowData;
  final String sectionTitle;
  final bool displayDivider;
  final double? width;
  final double? height;
  final double cardPaddings;
  final double sectionTitleSpace;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final titleStyle = theme.textTheme.headlineSmall!.copyWith(
      color: Colors.grey
    );

    return SizedBox(
      width: width ?? AppMeasures.settingsCardsWidth,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: theme.primaryColor, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: EdgeInsets.all(cardPaddings),
          child: Column(crossAxisAlignment: crossAxisAlignment, children: [
            Text(sectionTitle,
                style: titleStyle),
            SizedBox(
              height: sectionTitleSpace,
            ),
            for (SettingRowData rowData in rowData)
              SettingsRowStateless(
                rowData: rowData,
              ),
          ]),
        ),
      ),
    );
  }
}

class SettingRowData {
  final VoidCallback? onClick;
  final String? title;
  final String? subtitle;

  SettingRowData({this.onClick, this.title, this.subtitle});
}

class SettingsRowStateless extends StatelessWidget {
  const SettingsRowStateless({
    Key? key,
    required this.rowData,
    this.width = double.infinity,
  }) : super(key: key);

  final SettingRowData rowData;
  final double width;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: width,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppMeasures.borderRadius),
        onTap: rowData.onClick,
        child: Padding(
          padding: const EdgeInsets.all(AppMeasures.space),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (rowData.title != null)
                Text(
                  rowData.title!,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              if (rowData.subtitle != null)
                Text(rowData.subtitle!, style: theme.textTheme.bodyMedium!),
            ],
          ),
        ),
      ),
    );
  }
}
