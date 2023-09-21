// To parse this JSON data, do
//
//     final shop = shopFromJson(jsonString);

import 'dart:convert';

Shop shopFromJson(String str) => Shop.fromJson(json.decode(str));

String shopToJson(Shop data) => json.encode(data.toJson());

class Shop {
    List<FeaturedImage> featuredImage;
    List<Store> stores;

    Shop({
        required this.featuredImage,
        required this.stores,
    });

    factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        featuredImage: List<FeaturedImage>.from(json["featured_image"].map((x) => FeaturedImage.fromJson(x))),
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "featured_image": List<dynamic>.from(featuredImage.map((x) => x.toJson())),
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
    };
}

class FeaturedImage {
    int id;
    String image;

    FeaturedImage({
        required this.id,
        required this.image,
    });

    factory FeaturedImage.fromJson(Map<String, dynamic> json) => FeaturedImage(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}

class Store {
    String? storeId;
    String storeName;
    String? storeWebsite;
    String? storeImage;
    dynamic storeBanner;

    Store({
        required this.storeId,
        required this.storeName,
        required this.storeWebsite,
        required this.storeImage,
        required this.storeBanner,
    });

    factory Store.fromJson(Map<String, dynamic> json) => Store(
        storeId: json["store_id"],
        storeName: json["store_name"],
        storeWebsite: json["store_website"],
        storeImage: json["store_image"],
        storeBanner: json["store_banner"],
    );

    Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_name": storeName,
        "store_website": storeWebsite,
        "store_image": storeImage,
        "store_banner": storeBanner,
    };
}
