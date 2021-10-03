package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_946:String = "price_type_none";
      
      public static const const_392:String = "pricing_model_multi";
      
      public static const const_305:String = "price_type_credits";
      
      public static const const_387:String = "price_type_credits_and_pixels";
      
      public static const const_418:String = "pricing_model_bundle";
      
      public static const const_505:String = "pricing_model_single";
      
      public static const const_657:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1198:String = "pricing_model_unknown";
      
      public static const const_381:String = "price_type_pixels";
       
      
      private var var_1963:int;
      
      private var var_898:int;
      
      private var _offerId:int;
      
      private var var_899:int;
      
      private var var_426:String;
      
      private var var_626:String;
      
      private var var_423:ICatalogPage;
      
      private var var_425:IProductContainer;
      
      private var var_1307:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1307 = param1.localizationId;
         var_898 = param1.priceInCredits;
         var_899 = param1.priceInPixels;
         var_423 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_426;
      }
      
      public function get page() : ICatalogPage
      {
         return var_423;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1963 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_425;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_899;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1307 = "";
         var_898 = 0;
         var_899 = 0;
         var_423 = null;
         if(var_425 != null)
         {
            var_425.dispose();
            var_425 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_1963;
      }
      
      public function get priceInCredits() : int
      {
         return var_898;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_426 = const_505;
            }
            else
            {
               var_426 = const_392;
            }
         }
         else if(param1.length > 1)
         {
            var_426 = const_418;
         }
         else
         {
            var_426 = const_1198;
         }
      }
      
      public function get priceType() : String
      {
         return var_626;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_426)
         {
            case const_505:
               var_425 = new SingleProductContainer(this,param1);
               break;
            case const_392:
               var_425 = new MultiProductContainer(this,param1);
               break;
            case const_418:
               var_425 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_426);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1307;
      }
      
      private function analyzePriceType() : void
      {
         if(var_898 > 0 && var_899 > 0)
         {
            var_626 = const_387;
         }
         else if(var_898 > 0)
         {
            var_626 = const_305;
         }
         else if(var_899 > 0)
         {
            var_626 = const_381;
         }
         else
         {
            var_626 = const_946;
         }
      }
   }
}
