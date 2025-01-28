import 'package:cms_serverpod_client/cms_serverpod_client.dart';
import 'package:network_service/network_service.dart';
import 'package:network_service/src/services/devide_service.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

class ServerService with DeviceService {
  final ApiConfig config;

  // Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
  late final Client client;

  ServerService(this.config)
      : client = Client('${config.baseUrlwithPort}/')
          ..connectivityMonitor = FlutterConnectivityMonitor();
}

// extension on ServerService {
//   // Generic function for handling HTTP requests functionally
//   Future<Either<AppException, T>> safeHttpCall<T>(
//     Future<T> Function() httpRequest,
//   ) async {
//     try {
//       final response = await httpRequest();

//       return Right(response);
//     } catch (e) {
//       return Left(AppException(
//         code: 500,
//         message: e.toString(),
//         identifier: 'unknown-network-exception',
//       ));
//     }
//   }
// }
