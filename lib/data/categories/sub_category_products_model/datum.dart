import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'tax.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum extends Equatable {
  const Datum({
    this.id,
    this.name,
    this.addedBy,
    this.userId,
    this.categoryId,
    this.brandId,
    this.thumbnailImg,
    this.videoProvider,
    this.videoLink,
    this.tags,
    this.description,
    this.unitPrice,
    this.purchasePrice,
    this.variantProduct,
    this.attributes,
    this.choiceOptions,
    this.colors,
    this.variations,
    this.todaysDeal,
    this.published,
    this.approved,
    this.stockVisibilityState,
    this.cashOnDelivery,
    this.featured,
    this.sellerFeatured,
    this.currentStock,
    this.unit,
    this.minQty,
    this.lowStockQuantity,
    this.discount,
    this.discountType,
    this.discountStartDate,
    this.discountEndDate,
    this.tax,
    this.taxType,
    this.shippingType,
    this.shippingCost,
    this.isQuantityMultiplied,
    this.estShippingDays,
    this.numOfSale,
    this.metaTitle,
    this.metaDescription,
    this.metaImg,
    this.pdf,
    this.slug,
    this.rating,
    this.barcode,
    this.digital,
    this.fileName,
    this.filePath,
    this.createdAt,
    this.updatedAt,
    this.whatsNew,
    this.combo,
    this.sales,
    this.baseDiscountedPrice,
    this.basePrice,
    this.isUserLogin,
    this.customerId,
    this.isAddedToCart,
    this.cartQuantity,
    this.taxes,
    this.isWishlisted,
  });

  final int? id;
  final String? name;
  @JsonKey(name: 'added_by')
  final String? addedBy;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'brand_id')
  final int? brandId;
  @JsonKey(name: 'thumbnail_img')
  final String? thumbnailImg;
  @JsonKey(name: 'video_provider')
  final String? videoProvider;
  @JsonKey(name: 'video_link')
  final String? videoLink;
  final String? tags;
  final String? description;
  @JsonKey(name: 'unit_price')
  final int? unitPrice;
  @JsonKey(name: 'purchase_price')
  final String? purchasePrice;
  @JsonKey(name: 'variant_product')
  final int? variantProduct;
  final String? attributes;
  @JsonKey(name: 'choice_options')
  final String? choiceOptions;
  final String? colors;
  final String? variations;
  @JsonKey(name: 'todays_deal')
  final int? todaysDeal;
  final int? published;
  final int? approved;
  @JsonKey(name: 'stock_visibility_state')
  final String? stockVisibilityState;
  @JsonKey(name: 'cash_on_delivery')
  final int? cashOnDelivery;
  final int? featured;
  @JsonKey(name: 'seller_featured')
  final int? sellerFeatured;
  @JsonKey(name: 'current_stock')
  final int? currentStock;
  final String? unit;
  @JsonKey(name: 'min_qty')
  final int? minQty;
  @JsonKey(name: 'low_stock_quantity')
  final int? lowStockQuantity;
  final int? discount;
  @JsonKey(name: 'discount_type')
  final String? discountType;
  @JsonKey(name: 'discount_start_date')
  final int? discountStartDate;
  @JsonKey(name: 'discount_end_date')
  final int? discountEndDate;
  final String? tax;
  @JsonKey(name: 'tax_type')
  final String? taxType;
  @JsonKey(name: 'shipping_type')
  final String? shippingType;
  @JsonKey(name: 'shipping_cost')
  final String? shippingCost;
  @JsonKey(name: 'is_quantity_multiplied')
  final int? isQuantityMultiplied;
  @JsonKey(name: 'est_shipping_days')
  final int? estShippingDays;
  @JsonKey(name: 'num_of_sale')
  final int? numOfSale;
  @JsonKey(name: 'meta_title')
  final String? metaTitle;
  @JsonKey(name: 'meta_description')
  final String? metaDescription;
  @JsonKey(name: 'meta_img')
  final String? metaImg;
  final String? pdf;
  final String? slug;
  final int? rating;
  final String? barcode;
  final int? digital;
  @JsonKey(name: 'file_name')
  final String? fileName;
  @JsonKey(name: 'file_path')
  final String? filePath;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'whats_new')
  final int? whatsNew;
  final int? combo;
  final int? sales;
  @JsonKey(name: 'base_discounted_price')
  final int? baseDiscountedPrice;
  @JsonKey(name: 'base_price')
  final int? basePrice;
  @JsonKey(name: 'is_user_login')
  final int? isUserLogin;
  @JsonKey(name: 'customer_id')
  final int? customerId;
  @JsonKey(name: 'is_added_to_cart')
  final int? isAddedToCart;
  @JsonKey(name: 'cart_quantity')
  final int? cartQuantity;
  final int? isWishlisted;
  final List<Tax>? taxes;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);

  Datum copyWith({
    int? id,
    String? name,
    String? addedBy,
    int? userId,
    int? categoryId,
    int? brandId,
    String? thumbnailImg,
    String? videoProvider,
    String? videoLink,
    String? tags,
    String? description,
    int? unitPrice,
    String? purchasePrice,
    int? variantProduct,
    String? attributes,
    String? choiceOptions,
    String? colors,
    String? variations,
    int? todaysDeal,
    int? published,
    int? approved,
    String? stockVisibilityState,
    int? cashOnDelivery,
    int? featured,
    int? sellerFeatured,
    int? currentStock,
    String? unit,
    int? minQty,
    int? lowStockQuantity,
    int? discount,
    String? discountType,
    int? discountStartDate,
    int? discountEndDate,
    String? tax,
    String? taxType,
    String? shippingType,
    String? shippingCost,
    int? isQuantityMultiplied,
    int? estShippingDays,
    int? numOfSale,
    String? metaTitle,
    String? metaDescription,
    String? metaImg,
    String? pdf,
    String? slug,
    int? rating,
    String? barcode,
    int? digital,
    String? fileName,
    String? filePath,
    String? createdAt,
    String? updatedAt,
    int? whatsNew,
    int? combo,
    int? sales,
    int? baseDiscountedPrice,
    int? basePrice,
    int? isUserLogin,
    int? customerId,
    int? isAddedToCart,
    int? cartQuantity,
    List<Tax>? taxes,
    int? isWishlisted,
  }) {
    return Datum(
      id: id ?? this.id,
      name: name ?? this.name,
      addedBy: addedBy ?? this.addedBy,
      userId: userId ?? this.userId,
      categoryId: categoryId ?? this.categoryId,
      brandId: brandId ?? this.brandId,
      thumbnailImg: thumbnailImg ?? this.thumbnailImg,
      videoProvider: videoProvider ?? this.videoProvider,
      videoLink: videoLink ?? this.videoLink,
      tags: tags ?? this.tags,
      description: description ?? this.description,
      unitPrice: unitPrice ?? this.unitPrice,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      variantProduct: variantProduct ?? this.variantProduct,
      attributes: attributes ?? this.attributes,
      choiceOptions: choiceOptions ?? this.choiceOptions,
      colors: colors ?? this.colors,
      variations: variations ?? this.variations,
      todaysDeal: todaysDeal ?? this.todaysDeal,
      published: published ?? this.published,
      approved: approved ?? this.approved,
      stockVisibilityState: stockVisibilityState ?? this.stockVisibilityState,
      cashOnDelivery: cashOnDelivery ?? this.cashOnDelivery,
      featured: featured ?? this.featured,
      sellerFeatured: sellerFeatured ?? this.sellerFeatured,
      currentStock: currentStock ?? this.currentStock,
      unit: unit ?? this.unit,
      minQty: minQty ?? this.minQty,
      lowStockQuantity: lowStockQuantity ?? this.lowStockQuantity,
      discount: discount ?? this.discount,
      discountType: discountType ?? this.discountType,
      discountStartDate: discountStartDate ?? this.discountStartDate,
      discountEndDate: discountEndDate ?? this.discountEndDate,
      tax: tax ?? this.tax,
      taxType: taxType ?? this.taxType,
      shippingType: shippingType ?? this.shippingType,
      shippingCost: shippingCost ?? this.shippingCost,
      isQuantityMultiplied: isQuantityMultiplied ?? this.isQuantityMultiplied,
      estShippingDays: estShippingDays ?? this.estShippingDays,
      numOfSale: numOfSale ?? this.numOfSale,
      metaTitle: metaTitle ?? this.metaTitle,
      metaDescription: metaDescription ?? this.metaDescription,
      metaImg: metaImg ?? this.metaImg,
      pdf: pdf ?? this.pdf,
      slug: slug ?? this.slug,
      rating: rating ?? this.rating,
      barcode: barcode ?? this.barcode,
      digital: digital ?? this.digital,
      fileName: fileName ?? this.fileName,
      filePath: filePath ?? this.filePath,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      whatsNew: whatsNew ?? this.whatsNew,
      combo: combo ?? this.combo,
      sales: sales ?? this.sales,
      baseDiscountedPrice: baseDiscountedPrice ?? this.baseDiscountedPrice,
      basePrice: basePrice ?? this.basePrice,
      isUserLogin: isUserLogin ?? this.isUserLogin,
      customerId: customerId ?? this.customerId,
      isAddedToCart: isAddedToCart ?? this.isAddedToCart,
      cartQuantity: cartQuantity ?? this.cartQuantity,
      taxes: taxes ?? this.taxes,
      isWishlisted: isWishlisted ?? this.isWishlisted,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      addedBy,
      userId,
      categoryId,
      brandId,
      thumbnailImg,
      videoProvider,
      videoLink,
      tags,
      description,
      unitPrice,
      purchasePrice,
      variantProduct,
      attributes,
      choiceOptions,
      colors,
      variations,
      todaysDeal,
      published,
      approved,
      stockVisibilityState,
      cashOnDelivery,
      featured,
      sellerFeatured,
      currentStock,
      unit,
      minQty,
      lowStockQuantity,
      discount,
      discountType,
      discountStartDate,
      discountEndDate,
      tax,
      taxType,
      shippingType,
      shippingCost,
      isQuantityMultiplied,
      estShippingDays,
      numOfSale,
      metaTitle,
      metaDescription,
      metaImg,
      pdf,
      slug,
      rating,
      barcode,
      digital,
      fileName,
      filePath,
      createdAt,
      updatedAt,
      whatsNew,
      combo,
      sales,
      baseDiscountedPrice,
      basePrice,
      isUserLogin,
      customerId,
      isAddedToCart,
      cartQuantity,
      taxes,
      isWishlisted,
    ];
  }
}
