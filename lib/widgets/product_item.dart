import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../view/product_details.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(
      context,
    );
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                icon: Icon(product.isFavorite!
                    ? Icons.favorite
                    : Icons.favorite_border),
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  product.toggleFavoriteStatus();
                },
              ),
            ),
            title: Text(
              product.title!,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                cart.addItem(product.id!, product.price!, product.title!);
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                  arguments: product.id);
            },
            child: Image.network(
              product.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
