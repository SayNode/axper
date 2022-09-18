import '../models/request_model.dart';
import '../repositories/request_repo.dart';

Stream<List<Request>> checkRequests(int intervalInSeconds) =>
    Stream.periodic(Duration(seconds: intervalInSeconds))
        .asyncMap((_) => RequestRepository.loadRequests());
