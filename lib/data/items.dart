import 'package:single_select_list_demo/shared/app_icon_icons.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';

List<Item> items = [
  Item(
      id: 1,
      title: 'Cotton Eco',
      description: 'Cupboard-dries cottons with maximum energy saving.',
      icon: AppIcon.cotton,
      isSelected: true),
  Item(
      id: 2,
      title: 'Cottons',
      description: '100% cotton fabrics.',
      icon: AppIcon.cotton,
      isSelected: false),
  Item(
      id: 3,
      title: 'Synthetics',
      description:
          'For a mix of mostly synthetic fabrics, like polyester, or polyamide.',
      icon: AppIcon.synthetics,
      isSelected: false),
  Item(
      id: 4,
      title: 'Mixed+',
      description:
          "Cotton, cotton-synthetic blends, andsynthetics that don't need ironing.",
      icon: AppIcon.mixed,
      isSelected: false),
  Item(
      id: 5,
      title: 'Delicates',
      description: 'Viscose, rayon, acrylic, and other blends.',
      icon: AppIcon.delicates,
      isSelected: false),
  Item(
      id: 6,
      title: 'Sports',
      description:
          'Athletic clothes made of synthetics like polyester, elastane, or polyamide.',
      icon: AppIcon.sports,
      isSelected: false),
  Item(
      id: 7,
      title: 'Bed linen XL',
      description: 'Up to 2 single and 1 double sets of bedding.',
      icon: AppIcon.bedLinenXl,
      isSelected: false),
];
