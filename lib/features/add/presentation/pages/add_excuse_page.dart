import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/widgets/appbar/appbar_basic.dart';
import 'package:devexcuses/core/design/widgets/buttons/icon_text_button.dart';
import 'package:devexcuses/core/design/widgets/icons/plus_icon.dart';
import 'package:devexcuses/core/design/widgets/inputs/basic_text_form_field.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:devexcuses/core/helpers/widget_helper.dart';
import 'package:devexcuses/core/providers/async_notifiers_providers.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddExcusePage extends ConsumerStatefulWidget
{
  const AddExcusePage({super.key});

  @override
  ConsumerState<AddExcusePage> createState() => _AddExcusePageState();
}

class _AddExcusePageState extends ConsumerState<AddExcusePage>
{
  
  final _controller = TextEditingController();
  
  /// Gestion du retour de l'API.
  void _manageAddExcuseResult(AsyncValue<bool> value)
  {
    if (value is AsyncData<bool> && value.value)
    {
      context.pop();
      return;
    }
    WidgetHelper.displayMessageIfError(value, ref, context);
  }
  
  @override
  Widget build(BuildContext context)
  {
    ref.listen<AsyncValue<bool>>(addExcuseNotifierProvider, (previous, next) {
      _manageAddExcuseResult(next);
    });
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
                  onFieldSubmitted: (input) {
                    ref.read(addExcuseNotifierProvider.notifier).addExcuse(input, context);
                  },
                ),

                const SizedBox(height: DimensionsData.validationGap),

                Consumer(
                  builder: (context, ref, child) {
                    // gestion de l'affichage selon les retours de l'API :
                    final addExcuseAsyncValue = ref.watch(addExcuseNotifierProvider);
                    if (addExcuseAsyncValue is AsyncLoading)
                    {
                      // attente :
                      return const CircularProgressIndicator(color: ColorsData.mainIcon);
                    }
                    else
                    {
                      // autres cas :
                      return IconTextButton.defaut(
                        icon: PlusIcon.button(context: context),
                        label: L10n.get(context).add_excuse_submit,
                        context: context,
                        onTap: () {
                          ref.read(addExcuseNotifierProvider.notifier).addExcuse(_controller.text, context);
                        },
                      );
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}
