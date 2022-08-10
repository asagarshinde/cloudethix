import 'package:get/get.dart';

class CardListController extends GetxController{

  RxInt _hoveredIndex = 0.obs;

  int get hoveredIndex => _hoveredIndex.value;
  var cardListItems = [
    {
      'title': 'DevOps\n',
      'description':
      'Deliver and maintain, quality software faster with better Devops Strategies',
      'icon': '58751',
      'is_hover': false,
      'is_active': false,
    },
    {
      'title': 'Cloud\n',
      'description': 'Get your work done faster by saving time and effort in infrastructure management',
      'icon': '57711',
      'is_hover': false,
      'is_active': false,
    },
    {
      'title': 'Consulting \n Services',
      'description': 'Consult with our expert engineer to fast track your IT growth',
      'icon': '58513',
      'is_hover': false,
      'is_active': false,
    },
    {
      'title': 'Corporate \n Training',
      'description': 'We provide corporate training to enterprises on latest technologies',
      'icon': '58513',
      'is_hover': false,
      'is_active': false,
    }
  ];

  void setCardIndex(int index){
    _hoveredIndex.value = index;
  }
}