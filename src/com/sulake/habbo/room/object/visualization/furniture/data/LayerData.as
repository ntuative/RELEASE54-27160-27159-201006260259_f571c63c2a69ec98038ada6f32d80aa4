package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_373:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_399:int = 0;
      
      public static const const_869:int = 2;
      
      public static const const_866:int = 1;
      
      public static const const_738:Boolean = false;
      
      public static const const_639:String = "";
      
      public static const const_508:int = 0;
      
      public static const const_408:int = 0;
      
      public static const const_415:int = 0;
       
      
      private var var_2311:int = 0;
      
      private var var_1924:String = "";
      
      private var var_1696:int = 0;
      
      private var var_2313:int = 0;
      
      private var var_2312:Number = 0;
      
      private var var_1947:int = 255;
      
      private var var_2314:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_2311;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1696 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_2312;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_2313 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_2311 = param1;
      }
      
      public function get tag() : String
      {
         return var_1924;
      }
      
      public function get alpha() : int
      {
         return var_1947;
      }
      
      public function get ink() : int
      {
         return var_1696;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_2312 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_2313;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_2314 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_2314;
      }
      
      public function set tag(param1:String) : void
      {
         var_1924 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1947 = param1;
      }
   }
}
