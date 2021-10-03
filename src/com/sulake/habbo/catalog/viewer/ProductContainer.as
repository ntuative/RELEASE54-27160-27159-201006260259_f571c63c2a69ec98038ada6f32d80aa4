package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import flash.display.BitmapData;
   
   public class ProductContainer extends ProductGridItem implements IGetImageListener, IProductContainer, IGridItem
   {
       
      
      private var var_988:Array;
      
      protected var var_81:Offer;
      
      private var var_480:int;
      
      public function ProductContainer(param1:Offer, param2:Array)
      {
         super();
         var_81 = param1;
         var_988 = param2;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         setIconImage(param2);
      }
      
      public function initProductIcon(param1:IRoomEngine) : void
      {
      }
      
      public function get iconCallbackId() : int
      {
         return var_480;
      }
      
      public function get offer() : Offer
      {
         return var_81;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         super.dispose();
         for each(_loc1_ in var_988)
         {
            _loc1_.dispose();
         }
         var_988 = null;
         var_480 = 0;
      }
      
      public function get products() : Array
      {
         return var_988;
      }
      
      public function get firstProduct() : IProduct
      {
         return var_988[0] as IProduct;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_480 = param1;
      }
   }
}
