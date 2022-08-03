import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_campus_core/mini_campus_core.dart';

import '../constants.dart';
import '../models/feedback_model.dart';

final fdbkProvider = Provider((_) => FeedbackService(_.read));

class FeedbackService {
  late final DetaRepository _detaRepository;

  FeedbackService(Reader _read)
      : _detaRepository = DetaRepository(
          baseName: FeedbackApiConstants.kFeedbackCollection,
          detaBaseUrl: FeedbackApiConstants.kDetaFeedbackBaseUrl ??
              _read(flavorConfigProvider)['detaBaseUrl'],
        );

  Future addFeedback(FeedbackModel data) async {
    try {
      final res = await _detaRepository.addBaseData(data.toMap());

      if (res is DetaRepositoryException) {
        throw res;
      }

      return res;
    }

    // er
    catch (e) {
      debugLogger(e, name: 'addFeedback');
    }
  }
}
