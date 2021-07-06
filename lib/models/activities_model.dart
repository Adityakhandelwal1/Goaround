class ActivitiesModel {
  String name;
  String tagLine;
  String image;
  List<dynamic> images;
  String description;
  String price;

  ActivitiesModel(this.name, this.tagLine, this.image, this.images,
      this.description, this.price);
}

List<ActivitiesModel> recentlyViewed = recommendationsData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
    item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> offBeatActivities = offBeatActivitiesData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> recommendations = recommendationsData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> coWorkingSpace = coWorkingSpaceData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> staycation = staycationData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> touristAttraction = touristAttractionData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> parties = partiesData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

List<ActivitiesModel> cafes = cafesData
    .map((item) => ActivitiesModel(item['name'], item['tagLine'], item['image'],
        item['images'], item['description'], item['price']))
    .toList();

var touristAttractionData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "200"
  }
];

var partiesData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "400"
  }
];

var staycationData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image": "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "300"
  }
];

var cafesData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "900"
  }
];

var coWorkingSpaceData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "250"
  }
];

var offBeatActivitiesData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
    "images": [
      "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "800"
  },
  {
    "name": "Activity2 Location2, Goa",
    "tagLine": "Activity2 Location2, Goa",
    "image":
        "https://images.unsplash.com/photo-1542897644-e04428948020?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1542897644-e04428948020?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
      "https://images.unsplash.com/photo-1546845776-dcdf70fd09e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1517480448885-d5c53555ba8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1034&q=80",
      "https://images.unsplash.com/photo-1524675053444-52c3ca294ad2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    ],
    "description": "Sample description",
    "price": "1000"
  }
];

var recommendationsData = [
  {
    "name": "Activity1 Location1, Goa",
    "tagLine": "Activity1 Location1, Goa",
    "image":
        "https://images.unsplash.com/photo-1562602833-0f4ab2fc46e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1952&q=80",
    "images": [
      "https://images.pexels.com/photos/2583852/pexels-photo-2583852.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
      "https://images.unsplash.com/photo-1570789210967-2cac24afeb00?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1516690561799-46d8f74f9abf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://live.staticflickr.com/1449/23852180634_54f8aa0404_b.jpg",
      "https://cdn.pixabay.com/photo/2017/08/09/12/05/piaynemo-2614341_960_720.jpg"
    ],
    "description": "Sample description",
    "price": "Free"
  },
  {
    "name": "Activity2 Location2, Goa",
    "tagLine": "Activity2 Location2, Goa",
    "image":
        "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
    "images": [
      "https://images.unsplash.com/photo-1539367628448-4bc5c9d171c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=675&q=80",
      "https://images.unsplash.com/photo-1542897644-e04428948020?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80",
      "https://images.unsplash.com/photo-1546845776-dcdf70fd09e3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1517480448885-d5c53555ba8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1034&q=80",
      "https://images.unsplash.com/photo-1524675053444-52c3ca294ad2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    ],
    "description": "Sample description",
    "price": "300"
  },
  {
    "name": "Activity3 Location3, Goa",
    "tagLine": "Activity3 Location3, Goa",
    "image":
        "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
    "images": [
      "https://images.unsplash.com/photo-1584810359583-96fc3448beaa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      "https://images.unsplash.com/photo-1551018612-9715965c6742?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1354&q=80",
      "https://images.unsplash.com/photo-1561100344-0cce8621ca6c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1529680218503-29abd728bef5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=679&q=80",
      "https://images.unsplash.com/photo-1566559532512-004a6df74db5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80"
    ],
    "description": "Sample description",
    "price": "400"
  },
  {
    "name": "Activity4 Location4, Goa",
    "tagLine": "Activity4 Location4, Goa",
    "image":
        "https://images.unsplash.com/photo-1528181304800-259b08848526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
    "images": [
      "https://images.unsplash.com/photo-1528181304800-259b08848526?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1519451241324-20b4ea2c4220?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80",
      "https://images.unsplash.com/photo-1552465011-b4e21bf6e79a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1323&q=80",
      "https://images.unsplash.com/photo-1552550018-5253c1b171e1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
    ],
    "description": "Sample description",
    "price": "200"
  },
  {
    "name": "Activity5 Location5, Goa",
    "tagLine": "Activity5 Location5, Goa",
    "image":
        "https://images.unsplash.com/photo-1506351421178-63b52a2d2562?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80",
    "images": [
      "https://images.unsplash.com/photo-1506351421178-63b52a2d2562?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80",
      "https://images.unsplash.com/photo-1516496636080-14fb876e029d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
      "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1249&q=80",
      "https://images.unsplash.com/photo-1555912881-1ecd82307e0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1267&q=80",
      "https://images.unsplash.com/photo-1499359875449-10bbeb21501e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
    ],
    "description": "Sample description",
    "price": "600"
  }
];
