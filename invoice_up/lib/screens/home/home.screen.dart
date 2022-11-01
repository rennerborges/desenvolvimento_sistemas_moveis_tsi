import 'package:flutter/material.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/container-tour-guide.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/screens/home/components/container-button.dart';
import 'package:invoice_up/screens/home/components/list-container.dart';
import 'package:invoice_up/utils/colors.dart';
import 'package:invoice_up/utils/global-keys.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../../providers/app-settings.providers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TutorialCoachMark tutorialCoachMark;

  GlobalKey keyButtonProductsWarrancy =
      GlobalKeysInvoiceUp.keyButtonProductsWarrancy;
  GlobalKey keyButtonCreateInvoices =
      GlobalKeysInvoiceUp.keyButtonCreateInvoices;
  GlobalKey keyList = GlobalKeysInvoiceUp.keyList;

  @override
  void initState() {
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorsInvoiceUp colors = ColorsInvoiceUp(
      context.watch<AppSettings>().darkTheme,
    );

    Auth? auth = Provider.of<AppSettings>(context, listen: false).getAuth();

    return Scaffold(
      appBar: AppBarInvoiceUp(),
      backgroundColor: colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextInvoiceUp(
                S.of(context).titleLogin,
                textBold: auth != null ? "${auth.name}!" : '',
              ),
              ContainerButton(
                keyCreateInvoice: keyButtonCreateInvoices,
                keyWarrancy: keyButtonProductsWarrancy,
              ),
              ListContainerInvoiceUp(
                keyList: keyList,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTutorial() {
    tutorialCoachMark.show(context: context);
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: const Color(0xFF152670),
      textSkip: "SKIP",
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyButtonProductsWarrancy",
        keyTarget: keyButtonProductsWarrancy,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return ContainerTourGuide(
                title: 'Produtos na garantia',
                description:
                    'Aqui é possivel visualizar apenas os produtos que estão dentro da garantia',
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyButtonCreateInvoices",
        keyTarget: keyButtonCreateInvoices,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return ContainerTourGuide(
                title: 'Criar nota fiscal',
                description: 'Aqui é possível criar uma nota fiscal',
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyList",
        keyTarget: keyList,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            padding: EdgeInsets.only(top: 100),
            align: ContentAlign.right,
            builder: (context, controller) {
              return ContainerTourGuide(
                title: 'Notas fiscais',
                description: 'Aqui ficarão as suas notas fiscais',
              );
            },
          ),
        ],
      ),
    );

    return targets;
  }
}
