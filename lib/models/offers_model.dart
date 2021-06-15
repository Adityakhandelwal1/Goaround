class BeachModel {
  String image;

  BeachModel(this.image);
}

List<BeachModel> offers =
    beachesData.map((item) => BeachModel(item['image'])).toList();

var beachesData = [
  {
    "image":
    "assets/images/pic.jpeg"
  },
  {
    "image":
    "assets/images/background.jpeg"
  },
  {
    "image":
    "assets/images/pic.jpeg"
  },
];
