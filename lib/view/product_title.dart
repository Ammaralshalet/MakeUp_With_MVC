import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:store_with_mvc/model/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: product.imageLink != null
                      ? Image.network(
                          product.imageLink!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          color: Colors.grey,
                          child: const Center(
                            child: Text(
                              'No Image',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(
                    () => CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: product.isFavorite.value
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border),
                        onPressed: () {
                          product.isFavorite.toggle();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              product.name ?? 'No Name',
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            if (product.rating != null)
              Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                  vertical: 2,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      product.rating.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price ?? '0.0'}',
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'avenir',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
