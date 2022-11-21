import 'dart:math';

import 'package:flutter/material.dart';
import 'package:invoice_up/api/get-invoices-user.dart';
import 'package:invoice_up/components/appBar.dart';
import 'package:invoice_up/components/container-tour-guide.dart';
import 'package:invoice_up/components/text.dart';
import 'package:invoice_up/generated/l10n.dart';
import 'package:invoice_up/interfaces/ViewScreen.dart';
import 'package:invoice_up/interfaces/auth.dart';
import 'package:invoice_up/interfaces/invoice.dart';
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
  late ViewScreen viewScreen;

  List<Invoice> invoices = List.empty(growable: true);
  bool preloader = false;
  bool onlyWarranty = false;

  @override
  void initState() {
    super.initState();
    createTutorial();
    Future.delayed(Duration.zero, showTutorial);
    viewScreen =
        Provider.of<AppSettings>(context, listen: false).getViewScreen();
    getInvoices();
  }

  filterInvoices() {
    if (onlyWarranty) {
      return invoices.where((i) => i.isWarranty).toList();
    }

    return invoices;
  }

  getInvoices() async {
    try {
      setState(() {
        preloader = true;
      });

      List<Invoice>? invoicesRes =
          await GetInvoicesUserApi(context: context).execute();

      if (invoicesRes == null) {
        return;
      }

      setState(() {
        invoices = invoicesRes;
      });
    } catch (e) {
      SnackBar snackBar =
          SnackBar(content: Text(e.toString()), backgroundColor: Colors.red);

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      throw e;
    } finally {
      setState(() {
        preloader = false;
      });
    }
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
                  getInvoices: getInvoices,
                  onlyWarranty: onlyWarranty,
                  changeOnlyWarranty: () {
                    setState(() {
                      onlyWarranty = !onlyWarranty;
                    });
                  }),
              ListContainerInvoiceUp(
                invoices: filterInvoices(),
                loading: preloader,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showTutorial() {
    if (!viewScreen.home) {
      tutorialCoachMark.show(context: context);
    }
  }

  void createTutorial() {
    tutorialCoachMark = TutorialCoachMark(
      targets: _createTargets(),
      colorShadow: const Color(0xFF152670),
      textSkip: 'Skip',
      paddingFocus: 10,
      opacityShadow: 0.8,
      onFinish: () {
        viewScreen.home = true;

        Provider.of<AppSettings>(context, listen: false)
            .setViewScreen(viewScreen);
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
        viewScreen.home = true;

        Provider.of<AppSettings>(context, listen: false)
            .setViewScreen(viewScreen);
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "keyButtonProductsWarrancy",
        keyTarget: GlobalKeysInvoiceUp.keyButtonProductsWarrancy,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return ContainerTourGuide(
                  title: S.of(context).homeTourGuide1Title,
                  description: S.of(context).homeTourGuide1Description);
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyButtonCreateInvoices",
        keyTarget: GlobalKeysInvoiceUp.keyButtonCreateInvoices,
        alignSkip: Alignment.topRight,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, controller) {
              return ContainerTourGuide(
                title: S.of(context).homeTourGuide2Title,
                description: S.of(context).homeTourGuide2Description,
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyList",
        alignSkip: Alignment.topRight,
        keyTarget: GlobalKeysInvoiceUp.keyList,
        contents: [
          TargetContent(
            padding: EdgeInsets.only(top: 75, right: 20),
            align: ContentAlign.right,
            builder: (context, controller) {
              return Column(
                children: [
                  ContainerTourGuide(
                    title: S.of(context).homeTourGuide3Title,
                    description: S.of(context).homeTourGuide3Description,
                  ),
                  ContainerTourGuide(
                    title: S.of(context).homeTourGuide4Title,
                    description: S.of(context).homeTourGuide4Description,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    targets.add(
      TargetFocus(
        identify: "keyList",
        alignSkip: Alignment.topRight,
        keyTarget: GlobalKeysInvoiceUp.keyList,
        contents: [
          TargetContent(
            padding: EdgeInsets.only(top: 75, right: 20),
            align: ContentAlign.right,
            builder: (context, controller) {
              return Column(
                children: [
                  ContainerTourGuide(
                    title: S.of(context).homeTourGuide5Title,
                    description: S.of(context).homeTourGuide5Description,
                  ),
                  ContainerTourGuide(
                      title: S.of(context).homeTourGuide6Title,
                      description: S.of(context).homeTourGuide6Description),
                ],
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }
}
