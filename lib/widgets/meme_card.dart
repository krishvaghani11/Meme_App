import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class MemeCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String ups;
  final String postLink;
  final Function(Color) onColorExtracted;

  const MemeCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.ups,
    required this.postLink,
    required this.onColorExtracted,
  });

  @override
  State<MemeCard> createState() => _MemeCardState();
}

class _MemeCardState extends State<MemeCard> {
  Color backgroundColor = Colors.white;





  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              backgroundColor.withOpacity(0.8),
              backgroundColor.withOpacity(0.4),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: widget.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),

              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ups: ${widget.ups}',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),

                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Link: ${widget.postLink}')),
                      );
                    },
                    child: Text(
                      'View Post',
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
