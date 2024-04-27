import '../models/models.dart';
import 'local.dart';

class RuleRepository extends LocalRepository<Rule> {
  @override
  get key => 'rule';

  @override
  toJson() => this.toJson();

  @override
  fromJson(Map<String, dynamic> json) => Rule.fromJson(json);
}
