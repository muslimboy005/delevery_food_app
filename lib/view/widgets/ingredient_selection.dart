import 'package:deleveryapp/view/widgets/ingredient_icon.dart';
import 'package:flutter/material.dart';

class IngredientsSection extends StatelessWidget {
  const IngredientsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INGREDIENTS",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        SizedBox(height: 15),

        Row(
          children: [
            IngredientIcon(icon: Icons.local_pizza),
            SizedBox(width: 15),
            IngredientIcon(icon: Icons.restaurant),
            SizedBox(width: 15),
            IngredientIcon(icon: Icons.local_fire_department),
            SizedBox(width: 15),
            IngredientIcon(icon: Icons.eco),
            SizedBox(width: 15),
            IngredientIcon(icon: Icons.grain),
          ],
        ),
      ],
    );
  }
}
