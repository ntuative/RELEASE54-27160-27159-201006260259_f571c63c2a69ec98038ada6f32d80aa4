package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_47:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1.0;
      
      private var var_2027:Number = -1.0;
      
      private var var_946:IGraphicAsset = null;
      
      private var var_2026:Number = 1.0;
      
      private var var_2028:Number = -1.0;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1.0, param3:Number = 1.0, param4:Number = -1.0, param5:Number = 1.0)
      {
         super();
         var_2027 = param2;
         _normalMaxX = param3;
         var_2028 = param4;
         var_2026 = param5;
         var_946 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_2026;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_2027;
      }
      
      public function get normalMinY() : Number
      {
         return var_2028;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_946;
      }
      
      public function dispose() : void
      {
         var_946 = null;
      }
   }
}
