class FoodList {
  String name;
  String serving;
  int calorie;
  double fat;
  int cholestrol;
  double protein;
  double carb;
  int sodium;
  int pottasium;
  String image;

  FoodList(
      {this.name,
      this.serving,
      this.calorie,
      this.fat,
      this.cholestrol,
      this.protein,
      this.carb,
      this.sodium,
      this.pottasium,
      this.image});
}

List foodListed = [
  FoodList(
      name: 'Ayam Geprek',
      serving: '300 g',
      calorie: 789,
      fat: 53.97,
      cholestrol: 416,
      protein: 52.82,
      carb: 22.81,
      sodium: 1380,
      pottasium: 647,
      image: 'assets/images/foods/ayam-geprek.jpg'),
  FoodList(
      name: 'Bakso Sapi',
      serving: '108 g',
      calorie: 218,
      fat: 14.22,
      cholestrol: 80,
      protein: 13.4,
      carb: 8.18,
      sodium: 516,
      pottasium: 230,
      image: 'assets/images/foods/bakso.jpg'),
  FoodList(
      name: 'Bubur Ayam',
      serving: '240 g',
      calorie: 372,
      fat: 12.39,
      cholestrol: 72,
      protein: 27.56,
      carb: 36.12,
      sodium: 584,
      pottasium: 406,
      image: 'assets/images/foods/bubur-ayam.jpg'),
  FoodList(
      name: 'Ketoprak',
      serving: '200 g',
      calorie: 402,
      fat: 15.34,
      cholestrol: 16,
      protein: 15.59,
      carb: 50.48,
      sodium: 391,
      pottasium: 367,
      image: 'assets/images/foods/ketoprak.jpg'),
  FoodList(
      name: 'Martabak Manis',
      serving: '1 Slice',
      calorie: 270,
      fat: 11.31,
      cholestrol: 66,
      protein: 7.01,
      carb: 37.37,
      sodium: 225,
      pottasium: 167,
      image: 'assets/images/foods/martabak.jpg'),
  FoodList(
      name: 'Mie Ayam',
      serving: '240 g',
      calorie: 421,
      fat: 18.74,
      cholestrol: 105,
      protein: 16.7,
      carb: 46.21,
      sodium: 36,
      pottasium: 143,
      image: 'assets/images/foods/mie-ayam.jpg'),
  FoodList(
      name: 'Nasi Goreng',
      serving: '149 g',
      calorie: 250,
      fat: 9.28,
      cholestrol: 77,
      protein: 9.39,
      carb: 31.38,
      sodium: 618,
      pottasium: 152,
      image: 'assets/images/foods/nasi-goreng.jpg'),
  FoodList(
      name: 'Pempek',
      serving: '120 g',
      calorie: 234,
      fat: 6.24,
      cholestrol: 97,
      protein: 15.13,
      carb: 28.29,
      sodium: 69,
      pottasium: 277,
      image: 'assets/images/foods/pempek.jpg'),
  FoodList(
      name: 'Rendang',
      serving: '240 g',
      calorie: 468,
      fat: 26.57,
      cholestrol: 69,
      protein: 47.23,
      carb: 10.78,
      sodium: 442,
      pottasium: 894,
      image: 'assets/images/foods/rendang.jpg'),
  FoodList(
      name: 'Soto Ayam',
      serving: '241 g',
      calorie: 312,
      fat: 14.92,
      cholestrol: 129,
      protein: 24.01,
      carb: 19.55,
      sodium: 210,
      pottasium: 298,
      image: 'assets/images/foods/soto-ayam.jpg'),
];
