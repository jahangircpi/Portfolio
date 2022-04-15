class HomeItemModel {
  String? title;
  Function()? onTap;
  HomeItemModel({this.onTap, this.title});
}

List<HomeItemModel> homeitems = [
  HomeItemModel(title: 'Home', onTap: () {}),
  HomeItemModel(title: 'About', onTap: () {}),
  HomeItemModel(title: 'Projects', onTap: () {}),
  HomeItemModel(title: 'Contacts', onTap: () {}),
];
