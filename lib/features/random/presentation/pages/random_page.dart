import 'package:devexcuses/core/design/theme/colors_data.dart';
import 'package:devexcuses/core/design/theme/dimensions_data.dart';
import 'package:devexcuses/core/design/theme/typo_data.dart';
import 'package:devexcuses/core/design/widgets/appbar/appbar_basic.dart';
import 'package:devexcuses/core/design/widgets/buttons/appbar_button.dart';
import 'package:devexcuses/core/design/widgets/buttons/icon_text_button.dart';
import 'package:devexcuses/core/design/widgets/icons/plus_icon.dart';
import 'package:devexcuses/core/design/widgets/icons/refresh_icon.dart';
import 'package:devexcuses/core/design/widgets/text/styled_text.dart';
import 'package:devexcuses/core/entities/excuse_entity.dart';
import 'package:devexcuses/core/helpers/widget_helper.dart';
import 'package:devexcuses/core/providers/async_notifiers_providers.dart';
import 'package:devexcuses/core/routes/app_router.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RandomPage extends ConsumerStatefulWidget
{
  const RandomPage({super.key});

  @override
  ConsumerState<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends ConsumerState<RandomPage>
{
  
  /// Bouton 'Générer.
  Widget _getGenerateButton()
  {
    return IconTextButton.defaut(
      icon: RefreshIcon.button(context: context),
      label: L10n.get(context).random_generate,
      context: context,
      onTap: () => ref.read(randomNotifierProvider.notifier).generateExcuse(context),
    );
  }
  
  @override
  Widget build(BuildContext context)
  {
    ref.listen<AsyncValue<ExcuseEntity?>>(randomNotifierProvider, (previous, next) {
      WidgetHelper.displayMessageIfError(next, ref, context);
    });
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
          child: SingleChildScrollView(
            child: Consumer(
              builder: (context, ref, child) {
                // gestion de l'affichage selon les retours de l'API :
                final excuseAsyncValue = ref.watch(randomNotifierProvider);
                if (excuseAsyncValue is AsyncData<ExcuseEntity?>)
                {
                  // cas nominal :
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      StyledText(
                        excuseAsyncValue.value?.message ?? L10n.get(context).random_no_excuse,
                        typo: TypoData.normal,
                        textAlign: TextAlign.center,
                        fontSize: 28,
                      ),

                      const SizedBox(height: DimensionsData.validationGap),

                      _getGenerateButton(),
                      
                    ],
                  );
                }
                else if (excuseAsyncValue is AsyncLoading)
                {
                  // attente :
                  return const CircularProgressIndicator(color: ColorsData.mainIcon);
                }
                else if (excuseAsyncValue is AsyncError)
                {
                  // erreur (on réaffiche le bouton) :
                  return _getGenerateButton();
                }
                return const SizedBox.shrink();
              }
            ),
          ),
        ),
      ),
    );
  }
  
}
