package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_363:Number = 0.5;
      
      private static const const_812:int = 3;
      
      private static const const_1138:Number = 1;
       
      
      private var var_2119:Boolean = false;
      
      private var var_2127:Boolean = false;
      
      private var var_1130:int = 0;
      
      private var var_283:Vector3d = null;
      
      private var var_2122:int = 0;
      
      private var var_2124:int = 0;
      
      private var var_2123:Boolean = false;
      
      private var var_2121:int = -2;
      
      private var var_2120:Boolean = false;
      
      private var var_2128:int = 0;
      
      private var var_2126:int = -1;
      
      private var var_447:Vector3d = null;
      
      private var var_2125:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_2122;
      }
      
      public function get targetId() : int
      {
         return var_2126;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_2128 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_2122 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_2119 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_2126 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_2127 = param1;
      }
      
      public function dispose() : void
      {
         var_447 = null;
         var_283 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_447 == null)
         {
            var_447 = new Vector3d();
         }
         var_447.assign(param1);
         var_1130 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_2121;
      }
      
      public function get screenHt() : int
      {
         return var_2125;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_2124 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_283;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_2125 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_2128;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_2119;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_2127;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_447 != null && var_283 != null)
         {
            ++var_1130;
            _loc2_ = Vector3d.dif(var_447,var_283);
            if(_loc2_.length <= const_363)
            {
               var_283 = var_447;
               var_447 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_363 * (const_812 + 1))
               {
                  _loc2_.mul(const_363);
               }
               else if(var_1130 <= const_812)
               {
                  _loc2_.mul(const_363);
               }
               else
               {
                  _loc2_.mul(const_1138);
               }
               var_283 = Vector3d.sum(var_283,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_2123 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_2124;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_2120 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_2121 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_283 != null)
         {
            return;
         }
         var_283 = new Vector3d();
         var_283.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_2123;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_2120;
      }
   }
}
