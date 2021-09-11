class ProductDetailsModel {
  late final int id;
  late final int maximumOrder;
  late final String productName;
  late final String sku;
  late final String slug;
  late final String businessName;
  late final int sellerId;
  late final String sellerSlug;
  late final bool willShowEmi;
  late final Brand brand;
  late final String note;
  late final int stock;
  late final bool preOrder;
  late final int bookingPrice;
  late final int productPrice;
  int? discountCharge;
  late final String image;
  // late final String detailImage;
  late final bool isEvent;
  int? eventId;
  late final bool highlight;
  int? highlightId;
  late final bool groupping;
  int? grouppingId;
  int? campaignSectionId;
  late final bool campaignSection;
  String? message;
  late final bool seo;
  late final String metaKeyWord;
  late final String metaDescription;
  String? variation;
  late final String bannerImage;
  late final String bannerImageLink;
  String? attributeValue;
  String? iconSpecification;
  late final int productReviewAverage;

  List<String> detailImages = [];
  List<Category> categoryList = [];

  ProductDetailsModel();

  ProductDetailsModel.fromMap(Map m) {
    (m['category_list'] as List).forEach((category) {
      categoryList.add(Category.fromMap(category));
    });

    (m['details_images'] as List).forEach((element) {
      detailImages.add(element);
    });
    id = m['id'];
    maximumOrder = m['maximum_order'];
    productName = m['product_name'];
    sku = m['sku'];
    slug = m['slug'];
    businessName = m['buisness_name'];
    sellerId = m['seller_id'];
    sellerSlug = m['seller_slug'];
    willShowEmi = m['will_show_emi'];
    brand = Brand.fromMap(m['brand']);
    note = m['note'];
    stock = m['stock'];
    preOrder = m['pre_order'];
    bookingPrice = m['booking_price'];
    productPrice = m['product_price'];
    discountCharge = m['discount_charge'];
    image = m['image'];
    //  detailImage = m['details_images'];
    isEvent = m['is_event'];
    eventId = m['event_id'];
    highlight = m['highlight'];
    highlightId = m['highlight_id'];
    groupping = m['groupping'];
    grouppingId = m['groupping_id'];
    campaignSectionId = m['campaign_section_id'];
    campaignSection = m['campaign_section'];
    message = m['message'];
    seo = m['seo'];
    metaKeyWord = m['meta_keyword'];
    metaDescription = m['meta_description'];
    variation = m['variation'];
    bannerImage = m['banner_image'];
    bannerImageLink = m['banner_image_link'];
    attributeValue = m['attribute_value'];
    iconSpecification = m['icon_specification'];
    productReviewAverage = m['product_review_avg'];
  }
}

class Category {
  late final int id;
  late final String category;
  late final String slug;
  late final bool isInActive;
  late final String image;
  late final String categoryIcon;
  late final String parent;
  late final String parentSlug;

  Category();

  Category.fromMap(Map m) {
    id = m['id'];
    category = m['category_name'];
    slug = m['slug'];
    isInActive = m['is_inactive'];
    image = m['image'];
    categoryIcon = m['category_icon'];
    parent = m['parent'];
    parentSlug = m['parent_slug'];
  }
}

class Brand {
  late final int id;
  late final String name;
  late final String slug;
  late final String image;

  Brand();

  Brand.fromMap(Map m) {
    id = m['id'];
    name = m['name'];
    slug = m['slug'];
    image = m['image'];
  }
}
