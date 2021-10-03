package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_285:uint = 1;
      
      public static const const_451:uint = 0;
      
      public static const const_847:uint = 8;
      
      public static const const_258:uint = 4;
      
      public static const const_404:uint = 2;
       
      
      private var var_459:uint;
      
      private var var_2346:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2347:uint;
      
      private var var_105:Rectangle;
      
      private var var_694:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_105 = param3;
         _color = param4;
         var_459 = param5;
         var_2346 = param6;
         var_2347 = param7;
         var_694 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2346;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_459;
      }
      
      public function get scaleV() : uint
      {
         return var_2347;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_105 = null;
         var_694 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_105;
      }
   }
}
