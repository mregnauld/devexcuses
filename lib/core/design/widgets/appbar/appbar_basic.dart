import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/widgets/buttons/appbar_button.dart';
import 'package:devexcuses/core/design/widgets/icons/back_icon.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class AppBarBasic extends AppBar
{

  AppBarBasic({
    Key? key,
    required BuildContext context,
    String? label,
    bool displayBack = false,
    List<Widget>? actions,
  }) : super(
    key: key,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    backgroundColor: ColorsData.highlight,
    foregroundColor: ColorsData.mainText,
    elevation: 0,
    leading: displayBack
      ? AppBarButton.defaut(
        icone: BackIcon.appbar(context: context),
        onTap: () => context.pop(),
      ) 
      : null,
    automaticallyImplyLeading: displayBack,
    actions: actions,
    title: GestureDetector(
      onTapUp: (TapUpDetails tapUpDetails) {
        if (displayBack)
        {
          context.pop();
        }
      },
      child: StyledText(label ?? ""),
    ),
  );

}
