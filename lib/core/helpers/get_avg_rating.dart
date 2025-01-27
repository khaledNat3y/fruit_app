import 'package:fruits_app/core/entities/review_entity.dart';
import 'package:fruits_app/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) {
    return 0;
  }

  var sum = 0.0;
  for (var review in reviews) {
    sum += review.ratting ?? 0;
  }

  return sum / reviews.length;
}
