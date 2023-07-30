import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/localization/trans.dart';

final searchCollection = KStorage.i.getUserInfo?.data?.type?.searchCollection;
final searchLength = searchCollection?.toJson().values.where((element) => element?['search'] == true).toList().length ?? 0;

class KSlugModel {
  final String translated;
  final String slug;
  final String? icon;

  KSlugModel({
    required this.translated,
    required this.slug,
    this.icon,
  });

  ///Find Model By Slug
  static KSlugModel? of(String? slug) {
    switch (slug) {
      case _male:
        return KSlugModel(translated: Tr.get.male, slug: _male);
      case _female:
        return KSlugModel(translated: Tr.get.female, slug: _female);
      case user:
        return KSlugModel(translated: Tr.get.users, slug: user);
      case vendor:
        return KSlugModel(translated: Tr.get.vendors, slug: vendor);
      case agency:
        return KSlugModel(translated: Tr.get.agency, slug: agency);
      default:
        return null;
    }
  }

  ///Lists of Slugs & Trans
  static List<KSlugModel> get genders => [
        KSlugModel(translated: Tr.get.male, slug: KSlugModel._male),
        KSlugModel(translated: Tr.get.female, slug: KSlugModel._female),
      ];

  static List<KSlugModel> get searchTypes => [
        if (searchCollection?.users?.search == true) KSlugModel(translated: Tr.get.users, slug: user, icon: "assets/images/Employee_icon.svg"),
        if (searchCollection?.vendor?.search == true) KSlugModel(translated: Tr.get.vendors, slug: vendor, icon: "assets/images/Vendor_icon.svg"),
        if (searchCollection?.agencies?.search == true) KSlugModel(translated: Tr.get.agency, slug: agency, icon: "assets/images/Vendor_icon.svg")
      ];

  static List<KSlugModel> get roles => [
        KSlugModel(translated: 'Marketing Manager', slug: KSlugModel._marketingManager),
        KSlugModel(translated: 'Team Leader', slug: KSlugModel._teamLeader),
        KSlugModel(translated: 'Supervisor', slug: KSlugModel._supervisor),
        KSlugModel(translated: 'Sales Man', slug: KSlugModel._salesMan),
      ];

  static List<KSlugModel> get applicationState => [
        KSlugModel(translated: 'Marketing Manager', slug: KSlugModel._marketingManager),
        KSlugModel(translated: 'Team Leader', slug: KSlugModel._teamLeader),
        KSlugModel(translated: 'Supervisor', slug: KSlugModel._supervisor),
        KSlugModel(translated: 'Sales Man', slug: KSlugModel._salesMan),
      ];

  ///Const String Slugs
  ///
  static const String _male = "male";
  static const String _female = "female";
  static const String user = "users";
  static const String vendor = "vendors";
  static const String agency = "agencies";
  static const String _marketingManager = "marketing-manager";
  static const String _teamLeader = "team-leader";
  static const String _supervisor = "Supervisor";
  static const String _salesMan = "sales-man";

  //Equality
  @override
  String toString() => slug;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KSlugModel && other.translated == translated && other.slug == slug;
  }

  @override
  int get hashCode => translated.hashCode ^ slug.hashCode;
}
