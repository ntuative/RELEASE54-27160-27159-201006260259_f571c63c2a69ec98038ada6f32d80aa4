package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_205:String = "e";
      
      public static const const_79:String = "i";
      
      public static const const_77:String = "s";
       
      
      private var var_1033:String;
      
      private var var_1214:String;
      
      private var var_1216:int;
      
      private var var_2345:int;
      
      private var var_1032:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1214 = param1.readString();
         var_2345 = param1.readInteger();
         var_1033 = param1.readString();
         var_1032 = param1.readInteger();
         var_1216 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1032;
      }
      
      public function get productType() : String
      {
         return var_1214;
      }
      
      public function get expiration() : int
      {
         return var_1216;
      }
      
      public function get furniClassId() : int
      {
         return var_2345;
      }
      
      public function get extraParam() : String
      {
         return var_1033;
      }
   }
}
