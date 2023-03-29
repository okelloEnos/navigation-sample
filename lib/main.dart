import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/prison_transfer_screen.dart';
import 'package:nested_navigation/main_dashboard/ui/screens/main_dashboard_screen.dart';

import 'case_study_dashboard/ui/screens/case_study_dashboard_screen.dart';
import 'case_study_dashboard/ui/screens/other_cases_dashboard_screen.dart';
import 'case_study_dashboard/ui/screens/prisoners/prisoner_bloc/prisoners_bloc.dart';
import 'case_study_dashboard/ui/screens/prisoners/ui/screens/prisoners_main_dashboard_screen.dart';
import 'case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/court_transfer_screen.dart';
import 'case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/transfers_dashboard_screen.dart';

const teal = Colors.blue;
const white = Colors.white;

void submissionSuccessDialogWithAnimationWithTitle(
    {required BuildContext context,
    required String description,
    required String title,
    VoidCallback? onDialogPressed}) {
  showAnimatedDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return SimpleDialog(
          title: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: teal,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold),
          )),
          contentPadding: const EdgeInsets.all(8.0),
          children: [
            const Divider(),
            const SizedBox(
              height: 5.0,
            ),
            // Image.asset("assets/images/avatar.png", height: 60.0,),
            const SizedBox(
              height: 5.0,
            ),
            const Divider(),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(right: 4.0, left: 4.0, top: 4.0),
                child: Text(
                  'Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: teal,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 4.0, left: 4.0, top: 4.0, bottom: 10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      color: teal, fontFamily: 'Montserrat', fontSize: 15.0),
                ),
              ),
            ),
            onDialogPressed != null
                ? const Divider(
                    color: Colors.white,
                  )
                : const SizedBox.shrink(),
            onDialogPressed != null
                ? GestureDetector(
                    onTap: onDialogPressed,
                    child: Center(
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          color: teal,
                          child: SizedBox(
                            width: 250.0,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Montserrat',
                                        color: white),
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  )
                : const SizedBox.shrink()
          ]);
    },
    animationType: DialogTransitionType.slideFromBottom,
    curve: Curves.fastOutSlowIn,
    duration: const Duration(seconds: 1),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PesaIdApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return MaterialPage(
              key: state.pageKey, child: Builder(builder: (buildContext){
                return WillPopScope(
                    onWillPop: () async{
                      bool checkForPop = _router.routerDelegate.canPop();
                      // check if we have pages in the stack to pop before
                      // attempting app exit
                      if (checkForPop) {
                        // handle popping the current page off of the stack
                        return Future.value(true);

                      }
                      final shouldPop = await showDialog<bool>(
                        // get the context from the navigatorKey defined
                        // in your RouterDelegate class
                        // context: state.pageKey!.currentContext!,
                        context: buildContext,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Exit App'),
                            content: const Text('Are you sure you want to exit the app?'),
                            actions: [
                              TextButton(
                                child: const Text('Cancel'),
                                onPressed: () => Navigator.pop(context, true),
                              ),
                              TextButton(
                                child: const Text('Confirm'),
                                onPressed: () => Navigator.pop(context, false),
                              ),
                            ],
                          );
                        },
                      );
                      // if the dialog is dismissed by tapping outside of the barrier
                      // the result is null, so we return false
                      return shouldPop ?? false;
                    },
                    child: const MainDashboardScreen());
          }));
        },
        routes: [
          GoRoute(
              name: 'case-studies',
              path: 'case-studies',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return MaterialPage(
                    key: state.pageKey,
                    child: const CaseStudyDashboardScreen());
              },
              routes: [
                GoRoute(
                    name: 'other-case-studies',
                    path: 'other-case-studies',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return MaterialPage(
                          key: state.pageKey,
                          child: const OtherCasesDashboardScreen());
                    },
                    routes: [
                      GoRoute(
                          name: 'prisoner-dashboard',
                          path: 'prisoner-dashboard',
                          pageBuilder:
                              (BuildContext context, GoRouterState state) {
                            return MaterialPage(
                                key: state.pageKey,
                                child: const PrisonersMainDashboardScreen());
                          },
                          routes: [
                            GoRoute(
                                name: 'transfers-dashboard',
                                path: 'transfers-dashboard',
                                pageBuilder: (BuildContext context,
                                    GoRouterState state) {
                                  return MaterialPage(
                                      key: state.pageKey,
                                      child: const TransfersDashboardScreen());
                                },
                                routes: [
                                  GoRoute(
                                    name: 'court-transfer-screen',
                                    path: 'court-transfer-screen',
                                    pageBuilder: (BuildContext context,
                                        GoRouterState state) {
                                      return MaterialPage(
                                          key: state.pageKey,
                                          child: const CourtTransferScreen());
                                    },
                                  ),
                                  GoRoute(
                                    name: 'prison-transfer-screen',
                                    path: 'prison-transfer-screen',
                                    pageBuilder: (BuildContext context,
                                        GoRouterState state) {
                                      return MaterialPage(
                                          key: state.pageKey,
                                          child: const PrisonTransferScreen());
                                    },
                                  ),
                                ]),
                          ]),
                    ]),
              ]),
        ]),
  ],
  errorPageBuilder: (BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text('Error: ${state.error}'),
      ),
    ));
  },
);

class PesaIdApp extends StatelessWidget {
  const PesaIdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => PrisonersBloc()),
    ], child: const PesaIdAppView());
  }
}

class PesaIdAppView extends StatelessWidget {
  const PesaIdAppView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      // title: 'PesaKit Identity',
      debugShowCheckedModeBanner: false,
      // locale: const Locale('en', 'US'),
      theme: ThemeData.light(),
      // home: const MainDashboardScreen(),
      // home: NewSimDetailScreen()
    );
  }
}
