
class Item {
  final String title;
  final String price;
  final String description;
  final String imageUrl;

  Item({
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
  });


}


List<Item> generateSampleItems() {
  return [
    Item(
      title: 'Coffee',
      price: '5000원',
      description: '맛있고 따뜻한 커피',
      imageUrl: 'asset/아인슈페너.jpg',
    ),
    Item(
      title: 'Tea',
      price: '7000원',
      description: '달달하고 따뜻한 차.',
      imageUrl: 'asset/차.png'
    ),
    Item(
      title: 'Cake',
      price: '6000원',
      description: '달고달고 달디단 밤양갱',
      imageUrl: 'asset/cake1.png'
    ),
  ];
}

