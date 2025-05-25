import 'package:flutter/material.dart';

class OfferDialog extends StatelessWidget {
  const OfferDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dialog(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 500,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  children: [
                    Text(
                      "Hurry Offers!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 60),
                    Text(
                      "#1243CD2",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Use the cupon get 25% discount",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: const Size(double.infinity, 75),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.white, width: 3),
                      ),
                      child: Text(
                        "GOT IT",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 142,
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.highlight_remove,
              size: 65,
              color: Colors.deepOrange,
            ),
          ),
        ),
      ],
    );
  }
}