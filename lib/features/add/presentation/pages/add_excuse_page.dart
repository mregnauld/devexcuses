import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/widgets/appbar/appbar_basic.dart';
import 'package:devexcuses/core/design/widgets/buttons/icon_text_button.dart';
import 'package:devexcuses/core/design/widgets/icons/plus_icon.dart';
import 'package:devexcuses/core/design/widgets/inputs/basic_text_form_field.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';

class AddExcusePage extends StatefulWidget
{
  const AddExcusePage({super.key});

  @override
  State<AddExcusePage> createState() => _AddExcusePageState();
}

class _AddExcusePageState extends State<AddExcusePage>
{
  
  final _controller = TextEditingController();
  
  
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: ColorsData.background,
      appBar: AppBarBasic(
        context: context,
        label: L10n.get(context).add_excuse_title,
        displayBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          DimensionsData.pageHorizontalPadding,
          DimensionsData.pageTopPadding,
          DimensionsData.pageHorizontalPadding,
          DimensionsData.pageBottomPadding,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                StyledText(
                  L10n.get(context).add_excuse_message,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: DimensionsData.itemsGap),
                
                BasicTextFormField(
                  hintText: L10n.get(context).add_excuse_hint,
                  textInputType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.done,
                  maxLength: 128,
                  controller: _controller,
                  onFieldSubmitted: (input) {},
                ),

                const SizedBox(height: DimensionsData.validationGap),

                IconTextButton.defaut(
                  icon: PlusIcon.button(context: context),
                  label: L10n.get(context).add_excuse_submit,
                  context: context,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
