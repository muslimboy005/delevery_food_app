import 'package:deleveryapp/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final dateController = TextEditingController();
  final CVCController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    dateController.dispose();
    CVCController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.black87),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Add Card',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blueTextColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'CARD HOLDER NAME',
              style: TextStyle(fontSize: 12, color: AppColors.greyTextColor),
            ),
            SizedBox(height: 8),
            textField(hintText: 'Vishal Khadok', controller: nameController),
            SizedBox(height: 24),
            Text(
              'CARD NUMBER',
              style: TextStyle(fontSize: 12, color: AppColors.greyTextColor),
            ),
            SizedBox(height: 8),
            textField(
                hintText: '2134  ____  ____', controller: numberController),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'EXPIRE DATE',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.greyTextColor),
                      ),
                      SizedBox(height: 8),
                      textField(
                          hintText: 'mm/yyyy', controller: dateController),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CVC',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      textField(hintText: '***', controller: CVCController),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orangeTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  nameController.clear();
                  numberController.clear();
                  dateController.clear();
                  CVCController.clear();
                  
                },
                child: Text(
                  'ADD & MAKE PAYMENT',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.white,
                      letterSpacing: 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget textField({
    required String hintText,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.scaffold,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
