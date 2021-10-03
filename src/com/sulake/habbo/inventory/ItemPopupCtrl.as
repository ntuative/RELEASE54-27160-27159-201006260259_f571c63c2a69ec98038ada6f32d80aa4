package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1143:int = 100;
      
      private static const const_1141:int = 200;
      
      private static const const_1140:int = 180;
      
      public static const const_922:int = 1;
      
      public static const const_436:int = 2;
      
      private static const const_1142:int = 250;
      
      private static const const_813:int = 5;
       
      
      private var var_659:BitmapData;
      
      private var var_330:Timer;
      
      private var var_12:IWindowContainer;
      
      private var var_772:BitmapData;
      
      private var var_329:Timer;
      
      private var var_75:IWindowContainer;
      
      private var var_1627:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_329 = new Timer(const_1142,1);
         var_330 = new Timer(const_1143,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_75 = param1;
         var_75.visible = false;
         _assets = param2;
         var_329.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_330.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_772 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_659 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_75.visible = false;
         var_330.reset();
         var_329.reset();
         if(var_12 != null)
         {
            var_12.removeChild(var_75);
         }
      }
      
      public function hideDelayed() : void
      {
         var_330.reset();
         var_329.reset();
         var_330.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_329 != null)
         {
            var_329.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_329.stop();
            var_329 = null;
         }
         if(var_330 != null)
         {
            var_330.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_330.stop();
            var_330 = null;
         }
         _assets = null;
         var_75 = null;
         var_12 = null;
         var_659 = null;
         var_772 = null;
      }
      
      public function showDelayed() : void
      {
         var_330.reset();
         var_329.reset();
         var_329.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_75 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_12 != null)
         {
            var_12.removeChild(var_75);
         }
         var_12 = param1;
         var_1627 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_75.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_75.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1140,param3.width),Math.min(const_1141,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_75.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_75 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_75.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_922:
               _loc2_.bitmap = var_772.clone();
               _loc2_.width = var_772.width;
               _loc2_.height = var_772.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_436:
               _loc2_.bitmap = var_659.clone();
               _loc2_.width = var_659.width;
               _loc2_.height = var_659.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_330.reset();
         var_329.reset();
         if(var_12 == null)
         {
            return;
         }
         var_75.visible = true;
         var_12.addChild(var_75);
         refreshArrow(var_1627);
         switch(var_1627)
         {
            case const_922:
               var_75.x = 0 - const_813;
               break;
            case const_436:
               var_75.x = var_12.width + const_813;
         }
         var_75.y = (0 - 0) / 2;
      }
   }
}
