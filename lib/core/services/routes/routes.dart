import 'package:flutter_modular/flutter_modular.dart';
import 'package:second_task/core/services/routes/routes_names.dart';
import 'package:second_task/core/widgets/sn_connection_error.dart';
import 'package:second_task/modules/core/presentation/screens/sn_splash.dart';

/// [Routes] is a class that contains all the routes in the app.
class Routes {
  /// [buildRoutes] is a function that build all the routes in the app.
  static void buildRoutes(RouteManager r) {
    r.child(
      RoutesNames.appInit,
      transition: TransitionType.fadeIn,
      child: (_) => const SNSplash(),
    );
    r.child(
      RoutesNames.connectionError,
      transition: TransitionType.fadeIn,
      child: (_) => const SNConnectionError(),
    );
    //------------- Characters Routes -------------//
    // r.child(
    //   RoutesNames.characters.charactersList,
    //   transition: TransitionType.fadeIn,
    //   child: (_) => const SNHomeMain(),
    // );

    // r.child(
    //   RoutesNames.characters.baseCharacterDetails,
    //   transition: TransitionType.fadeIn,
    //   child: (_) => SNAuthMain(
    //     params: r.args.data as DTOAuthRouteArgs?,
    //   ),
    // );

    //------------- End Home Routes -------------//
  }
}
