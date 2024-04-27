import '../models/models.dart';
import 'local.dart';

class ThoughtRepository extends LocalRepository<Thought> {
  @override
  get key => 'thought';

  @override
  toJson(item) => item.toJson();

  @override
  fromJson(Map<String, dynamic> json) => Thought.fromJson(json);
}
