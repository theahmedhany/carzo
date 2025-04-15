import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/models/car_details_model.dart';
import 'custom_car_detail_component_card.dart';

class CustomCarDetailComponentsList extends StatelessWidget {
  final CarDetailsModel details;

  const CustomCarDetailComponentsList({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    final bool isNewCar = details.status?.toLowerCase() == 'new';
    final specs = details.specifications;

    final List<List<String>> components =
        isNewCar
            ? [
              [
                'assets/icons/car-brand.svg',
                'Car Brand',
                details.brand ?? 'N/A',
              ],
              [
                'assets/icons/car-model.svg',
                'Car Model',
                details.model ?? 'N/A',
              ],
              [
                'assets/icons/moneys.svg',
                'Price',
                details.price?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/calendar.svg',
                'Manufacture Year',
                specs?.year?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/walk-car.svg',
                'Liters/100 KM',
                specs?.fuelEfficiency?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/transmission-type.svg',
                'Transmission Type',
                specs?.transmission ?? 'N/A',
              ],
              [
                'assets/icons/max-speed.svg',
                'Max Speed',
                specs?.topSpeed?.toString() ?? 'N/A',
              ],
              ['assets/icons/car-fuel.svg', 'Car Fuel', specs?.fuel ?? 'N/A'],
              [
                'assets/icons/country-flag.svg',
                'Origin Country',
                specs?.originCountry ?? 'N/A',
              ],
              [
                'assets/icons/country-of-assembly.svg',
                'Assembly Country',
                specs?.assemblyCountry ?? 'N/A',
              ],
              [
                'assets/icons/horse.svg',
                'Horses Number',
                specs?.horsePower?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/seats-number.svg',
                'Seat Numbers',
                specs?.seats?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/car-acceleration.svg',
                'Car Acceleration',
                specs?.acceleration?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/car-traction2.svg',
                'Drivetrain',
                specs?.drivetrain?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/trunk capacity.svg',
                'Trunk Capacity',
                specs?.trunkSize?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/ground-clearance.svg',
                'Ground Clearance',
                specs?.groundClearance?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/Overall-height.svg',
                'Overall Height',
                specs?.height?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/Overall-length.svg',
                'Overall Length',
                specs?.length?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/ruler.svg',
                'Total Width',
                specs?.width?.toString() ?? 'N/A',
              ],
              ['assets/icons/car-color.svg', 'Color', specs?.color ?? 'N/A'],
            ]
            : [
              [
                'assets/icons/car-brand.svg',
                'Car Brand',
                details.brand ?? 'N/A',
              ],
              [
                'assets/icons/car-model.svg',
                'Car Model',
                details.model ?? 'N/A',
              ],
              [
                'assets/icons/moneys.svg',
                'Price',
                details.price?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/calendar.svg',
                'Manufacture Year',
                specs?.year?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/walk-car.svg',
                'Driven Kilometers',
                specs?.mileage?.toString() ?? 'N/A',
              ],
              [
                'assets/icons/transmission-type.svg',
                'Transmission Type',
                specs?.transmission ?? 'N/A',
              ],
              ['assets/icons/car-fuel.svg', 'Car Fuel', specs?.fuel ?? 'N/A'],
              ['assets/icons/car-color.svg', 'Color', specs?.color ?? 'N/A'],
            ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: components.length,
      itemBuilder: (_, index) {
        return CustomCarDetailComponentCard(
          icon: components[index][0],
          name: components[index][1],
          value: components[index][2],
        );
      },
    );
  }
}
