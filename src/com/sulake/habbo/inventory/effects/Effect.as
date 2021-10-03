package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1964:Date;
      
      private var var_1309:Boolean = false;
      
      private var _type:int;
      
      private var var_396:BitmapData;
      
      private var var_284:Boolean = false;
      
      private var var_1222:int;
      
      private var var_627:int = 1;
      
      private var var_1087:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_396;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_627;
         if(var_627 < 0)
         {
            var_627 = 0;
         }
         var_1087 = var_1222;
         var_284 = false;
         var_1309 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1087 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_284;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_396 = param1;
      }
      
      public function get duration() : int
      {
         return var_1222;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1309;
      }
      
      public function get effectsInInventory() : int
      {
         return var_627;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_396;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_284)
         {
            var_1964 = new Date();
         }
         var_284 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_627 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_284)
         {
            _loc1_ = var_1087 - (new Date().valueOf() - var_1964.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1087;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1309 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1222 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
