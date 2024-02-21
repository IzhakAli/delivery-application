class AppLink {
  static const String server = "https://egiftyemen.com/egift";

  //==============================Images from backend===========================
  static const String networkImage = "https://egiftyemen.com/egift/upload";
  static const String imageCategory = "$networkImage/categories";
  static const String imageItems = "$networkImage/items";

////=========================================================

  static const String notification = "$server/notification.php";
  static const String test = "$server/test.php";

  //=================================Auth=======================================

  static const String signUp = "$server/delivery/auth/signup.php";
  static const String verifyCodeSignUp = "$server/delivery/auth/verifycode.php";
  static const String login = "$server/delivery/auth/login.php";
  static const String resend = "$server/delivery/auth/resend.php";

//=================================ForgetPassword===============================
  static const String checkEmail =
      "$server/delivery/forgetpassword/checkemail.php";
  static const String verifyCodeForgetPassword =
      "$server/delivery/forgetpassword/verifycode.php";
  static const String resetPassword =
      "$server/delivery/forgetpassword/resetpassword.php";

//=================================Home=========================================
  static const String homePage = "$server/home.php";

  // //Items
  // static const String items = "$server/items/items.php";
  // static const String searchitems = "$server/items/search.php";
  //
  // //Favorite
  // static const String favoriteAdd = "$server/favorite/add.php";
  // static const String favoriteRemove = "$server/favorite/remove.php";
  // static const String favoriteView = "$server/favorite/view.php";
  // static const String deleteFromFavorite =
  //     "$server/favorite/deletefromfavroite.php";

//=================================CART=========================================

//   static const String cartview = "$server/cart/view.php";
//   static const String cartadd = "$server/cart/add.php";
//   static const String cartdelete = "$server/cart/delete.php";
//   static const String cartgetcountitem = "$server/cart/getcountitems.php";
//
// //=================================Address=====================================
//   static const String addressAdd = "$server/address/add.php";
//   static const String addressDelete = "$server/address/delete.php";
//   static const String addressEdit = "$server/address/edit.php";
//   static const String addressView = "$server/address/view.php";
//
//   //=================================Coupon=====================================
//
//   static const String checkcoupon = "$server/coupon/checkcoupon.php";

  //==============================Checkout =====================================

  // static const String checkout = "$server/orders/checkout.php";
//==============================ORDERS==========================================
  static const String viewpendingOrders = "$server/delivery/orders/pending.php";
  static const String viewacceptedOrders =
      "$server/delivery/orders/accepted.php";
  static const String approveOrders = "$server/delivery/orders/approve.php";
  static const String viewarchiveOrders = "$server/delivery/orders/archive.php";
  static const String detailsOrders = "$server/delivery/orders/details.php";
  static const String doneOrders = "$server/delivery/orders/done.php";

  // static const String rating = "$server/delivery/rating.php";
  // //==============================ORDERS OFFERS================================
  // static const String offers = "$server/offers.php";
}
