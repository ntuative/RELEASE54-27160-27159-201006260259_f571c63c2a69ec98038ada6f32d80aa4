package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2365:Class;
      
      private var var_2366:Class;
      
      private var var_2364:String;
      
      private var var_1471:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2364 = param1;
         var_2366 = param2;
         var_2365 = param3;
         if(rest == null)
         {
            var_1471 = new Array();
         }
         else
         {
            var_1471 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2365;
      }
      
      public function get assetClass() : Class
      {
         return var_2366;
      }
      
      public function get mimeType() : String
      {
         return var_2364;
      }
      
      public function get fileTypes() : Array
      {
         return var_1471;
      }
   }
}
