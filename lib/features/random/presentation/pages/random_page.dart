import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/theme/typo_data.dart';
import 'package:devexcuses/core/design/widgets/appbar/appbar_basic.dart';
import 'package:devexcuses/core/design/widgets/buttons/appbar_button.dart';
import 'package:devexcuses/core/design/widgets/buttons/icon_text_button.dart';
import 'package:devexcuses/core/design/widgets/icons/plus_icon.dart';
import 'package:devexcuses/core/design/widgets/icons/refresh_icon.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:devexcuses/core/routes/app_router.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RandomPage extends StatelessWidget
{

  const RandomPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: ColorsData.background,
      appBar: AppBarBasic(
        context: context,
        label: L10n.get(context).random_title,
        actions: [
          AppBarButton.defaut(
            icone: PlusIcon.appbar(context: context),
            onTap: () => context.pushNamed(AppRouter.addExcusePage),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          DimensionsData.pageHorizontalPadding,
          DimensionsData.pageTopPadding,
          DimensionsData.pageHorizontalPadding,
          DimensionsData.pageBottomPadding,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const StyledText(
                "Ceci est une longue phrase, vraiment très longue",
                typo: TypoData.normal,
                textAlign: TextAlign.center,
                fontSize: 28,
              ),
              
              const SizedBox(height: DimensionsData.validationGap),

              IconTextButton.defaut(
                icon: RefreshIcon.button(context: context),
                label: L10n.get(context).random_generate,
                context: context,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

}
