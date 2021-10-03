package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatItem
   {
      
      private static const const_519:int = 6;
      
      private static const const_364:int = 10;
      
      private static const const_1150:Number = 18;
      
      private static const const_1472:Number = 10;
      
      private static const const_1473:Number = 8;
       
      
      private var var_1407:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1155:int;
      
      private var var_1406:int;
      
      private var var_105:IRegionWindow;
      
      private var _window:IWindowContainer;
      
      private var var_1256:int;
      
      private var var_1405:Boolean = false;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2207:int = 0;
      
      private var var_2208:int = -1;
      
      private var _id:String;
      
      private var _width:Number = 0;
      
      private var _message:String;
      
      private var var_456:Number = 0;
      
      private var _height:Number = 0;
      
      private var _roomCategory:int;
      
      private var _widget:RoomChatWidget;
      
      private var var_215:BitmapData;
      
      private var var_1153:uint;
      
      private var var_1154:int;
      
      private var _roomId:int;
      
      private var var_91:Number = 0;
      
      private var _y:Number = 0;
      
      private var _localizations:IHabboLocalizationManager;
      
      private var var_791:String;
      
      public function RoomChatItem(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IHabboLocalizationManager)
      {
         var_791 = new String();
         _message = new String();
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         _id = param4;
         _height = const_1150;
         _localizations = param5;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function disableTooltip() : void
      {
         if(var_105 != null)
         {
            var_105.toolTipCaption = "";
         }
      }
      
      public function set senderX(param1:Number) : void
      {
         var_1407 = param1;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      private function onBubbleMouseOut(param1:WindowMouseEvent) : void
      {
         _widget.onItemMouseOut(var_1155,var_1154,_roomId,_roomCategory,param1);
      }
      
      private function onBubbleMouseClick(param1:WindowMouseEvent) : void
      {
         _widget.onItemMouseClick(var_1155,var_791,var_1154,_roomId,_roomCategory,param1);
      }
      
      public function enableTooltip() : void
      {
         if(var_105 != null)
         {
            var_105.toolTipCaption = "${chat.history.drag.tooltip}";
            var_105.toolTipDelay = 500;
         }
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get timestamp() : int
      {
         return var_1256;
      }
      
      public function get height() : Number
      {
         return _height;
      }
      
      public function hideView() : void
      {
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         var_1405 = false;
      }
      
      public function hidePointer() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("pointer") as IBitmapWrapperWindow;
         _loc1_.visible = false;
      }
      
      public function set y(param1:Number) : void
      {
         _y = param1;
         if(_window != null)
         {
            _window.y = param1 - var_456;
         }
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function dispose() : void
      {
         if(var_105 != null)
         {
            var_105.dispose();
            var_105 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
            _widget = null;
         }
      }
      
      public function define(param1:RoomWidgetChatUpdateEvent) : void
      {
         var_1406 = param1.chatType;
         var_1155 = param1.userId;
         var_791 = param1.userName;
         var_1154 = param1.userCategory;
         _message = param1.text;
         var_1407 = param1.userX;
         var_215 = param1.userImage;
         var_1153 = param1.userColor;
         _roomId = param1.roomId;
         _roomCategory = param1.roomCategory;
         renderView();
      }
      
      public function checkOverlap(param1:Number, param2:Number, param3:Number, param4:Number) : Boolean
      {
         var _loc5_:Rectangle = new Rectangle(var_91,_y,width,_height);
         var _loc6_:Rectangle = new Rectangle(param1,param2,param3,param4);
         return _loc5_.intersects(_loc6_);
      }
      
      public function get senderX() : Number
      {
         return var_1407;
      }
      
      public function set timestamp(param1:int) : void
      {
         var_1256 = param1;
      }
      
      private function addEventListenerToChild(param1:IWindow) : void
      {
         if(param1 != null)
         {
            param1.setParamFlag(HabboWindowParam.const_37,true);
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onBubbleMouseClick);
            param1.addEventListener(WindowMouseEvent.const_49,onBubbleMouseDown);
            param1.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onBubbleMouseOver);
            param1.addEventListener(WindowMouseEvent.const_27,onBubbleMouseOut);
            param1.addEventListener(WindowMouseEvent.const_97,onBubbleMouseUp);
         }
      }
      
      public function get width() : Number
      {
         return _width;
      }
      
      public function renderView() : void
      {
         var _loc1_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:* = null;
         var _loc29_:* = null;
         var _loc30_:* = 0;
         var _loc31_:* = 0;
         var _loc32_:* = 0;
         var _loc33_:Number = NaN;
         var _loc34_:Number = NaN;
         var _loc35_:Number = NaN;
         var _loc36_:* = null;
         var _loc37_:* = null;
         var _loc38_:* = null;
         if(var_1405)
         {
            return;
         }
         var_1405 = true;
         if(_window != null)
         {
            return;
         }
         var _loc2_:Boolean = false;
         switch(var_1406)
         {
            case RoomWidgetChatUpdateEvent.const_111:
               _loc1_ = "bubble_speak";
               break;
            case RoomWidgetChatUpdateEvent.const_132:
               _loc1_ = "bubble_whisper";
               break;
            case RoomWidgetChatUpdateEvent.const_109:
               _loc1_ = "bubble_shout";
               break;
            case RoomWidgetChatUpdateEvent.const_275:
               _loc1_ = "bubble_generic";
               _loc2_ = true;
               break;
            case RoomWidgetChatUpdateEvent.const_270:
               _loc1_ = "bubble_generic";
               _loc2_ = true;
         }
         var _loc3_:XmlAsset = _assetLibrary.getAssetByName(_loc1_) as XmlAsset;
         if(_loc3_ == null || _loc3_.content == null)
         {
            return;
         }
         var _loc4_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_left") as BitmapDataAsset;
         var _loc5_:BitmapData = _loc4_.content as BitmapData;
         var _loc6_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_middle") as BitmapDataAsset;
         var _loc7_:BitmapData = _loc6_.content as BitmapData;
         var _loc8_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_left_color") as BitmapDataAsset;
         var _loc9_:BitmapData = _loc8_.content as BitmapData;
         var _loc10_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_left_gen") as BitmapDataAsset;
         var _loc11_:BitmapData = _loc10_.content as BitmapData;
         var _loc12_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_right") as BitmapDataAsset;
         var _loc13_:BitmapData = _loc12_.content as BitmapData;
         var _loc14_:BitmapDataAsset = _assetLibrary.getAssetByName("chat_bubble_pointer") as BitmapDataAsset;
         var _loc15_:BitmapData = _loc14_.content as BitmapData;
         var _loc16_:Number = _loc5_.height + _loc15_.height;
         var _loc17_:int = 0;
         if(var_215 != null)
         {
            _loc17_ = Math.max(0,(0 - _loc5_.height) / 2);
            _loc16_ = Math.max(_loc16_,var_215.height);
         }
         _window = _windowManager.buildFromXML(_loc3_.content as XML,1) as IWindowContainer;
         _window.tags.push("roomchat_bubble");
         _window.x = var_91;
         _window.y = _y;
         _window.width = 0;
         _window.height = _loc16_;
         var_105 = _window as IRegionWindow;
         var_105.background = true;
         var_105.mouseTreshold = 0;
         enableTooltip();
         addEventListenerToChild(var_105);
         var _loc18_:IBitmapWrapperWindow = _window.findChildByName("left_color") as IBitmapWrapperWindow;
         var _loc19_:ITextWindow = _window.findChildByName("name") as ITextWindow;
         var _loc20_:ITextWindow = _window.findChildByName("message") as ITextWindow;
         var _loc21_:IBitmapWrapperWindow = _window.findChildByName("left") as IBitmapWrapperWindow;
         var _loc22_:IBitmapWrapperWindow = _window.findChildByName("middle") as IBitmapWrapperWindow;
         var _loc23_:IBitmapWrapperWindow = _window.findChildByName("right") as IBitmapWrapperWindow;
         var _loc24_:IBitmapWrapperWindow = _window.findChildByName("pointer") as IBitmapWrapperWindow;
         if(var_215 != null && !_loc2_)
         {
            _loc26_ = 14;
            _loc27_ = Math.max(0,(_loc5_.height - 0) / 2);
            _loc28_ = _window.findChildByName("user_image") as IBitmapWrapperWindow;
            if(_loc28_ != null)
            {
               _loc28_.width = var_215.width;
               _loc28_.height = var_215.height;
               _loc28_.bitmap = new BitmapData(var_215.width,var_215.height,true,0);
               _loc28_.bitmap.copyPixels(var_215,var_215.rect,new Point(0,0));
               _loc28_.x = _loc26_;
               _loc28_.y = _loc27_;
               var_456 = Math.max(0,(0 - _loc5_.height) / 2);
               _width += var_215.width;
            }
         }
         if(_loc18_ != null)
         {
            _loc29_ = new Matrix();
            _loc30_ = 232;
            _loc31_ = 177;
            _loc32_ = 55;
            if(var_1153 != 0)
            {
               _loc30_ = uint(var_1153 >> 16 & 255);
               _loc31_ = uint(var_1153 >> 8 & 255);
               _loc32_ = uint(var_1153 >> 0 & 255);
            }
            _loc33_ = _loc30_ / 255 * 1;
            _loc34_ = _loc31_ / 255 * 1;
            _loc35_ = _loc32_ / 255 * 1;
            _loc36_ = new ColorTransform(_loc33_,_loc34_,_loc35_);
            if(_loc2_)
            {
               _loc18_.bitmap = _loc11_.clone();
            }
            else
            {
               _loc18_.bitmap = new BitmapData(_loc9_.width,_loc9_.height,true,0);
               _loc18_.bitmap.draw(_loc9_,null,_loc36_,BlendMode.DARKEN);
            }
            _loc18_.y += var_456;
         }
         if(_loc21_ != null)
         {
            _width = _loc21_.width;
            _loc21_.bitmap = _loc5_;
            _loc21_.disposesBitmap = false;
            _loc21_.y += var_456;
         }
         if(_loc19_ != null)
         {
            if(_loc2_)
            {
               _width += _loc19_.textWidth + const_364;
            }
            else
            {
               _loc19_.text = var_791 + ":";
               _loc19_.y += var_456;
               _loc19_.width = _loc19_.textWidth + const_364;
               _width += _loc19_.textWidth + const_364;
            }
         }
         if(_loc20_ != null)
         {
            if(var_1406 == RoomWidgetChatUpdateEvent.const_275)
            {
               _loc20_.text = _localizations.registerParameter("widgets.chatbubble.respect","username",var_791);
            }
            else if(var_1406 == RoomWidgetChatUpdateEvent.const_270)
            {
               _loc20_.text = _localizations.registerParameter("widget.chatbubble.petrespect","petname",var_791);
            }
            else
            {
               _loc20_.text = _message;
            }
            _loc20_.x = _width;
            _loc20_.y += var_456;
            _loc20_.width = _loc20_.textWidth + const_519;
            _width += _loc20_.textWidth + const_519;
         }
         if(_loc22_ != null)
         {
            _loc22_.width = _loc19_.textWidth + const_364 + _loc20_.textWidth + const_519;
            _loc37_ = new Matrix();
            _loc37_.scale(_loc22_.width / _loc7_.width,1);
            _loc38_ = new BitmapData(_loc22_.width,_loc22_.height,true);
            _loc38_.draw(_loc7_,_loc37_);
            _loc22_.bitmap = new BitmapData(_loc22_.width,_loc7_.height,false);
            _loc22_.bitmap.copyPixels(_loc38_,_loc38_.rect,new Point(0,0));
            _loc38_.dispose();
            _loc22_.y += var_456;
         }
         if(_loc23_ != null)
         {
            _loc23_.bitmap = _loc13_;
            _loc23_.disposesBitmap = false;
            _loc23_.x = _width;
            _loc23_.y += var_456;
            _width += _loc23_.width;
         }
         if(_loc24_ != null)
         {
            _loc24_.bitmap = _loc15_;
            _loc24_.disposesBitmap = false;
            _loc24_.x = _width / 2;
            _loc24_.y += var_456;
         }
         _window.width = _width;
         _window.height = _loc16_;
         _window.y = 0 - var_456;
         var _loc25_:IWindow = _window.getChildByName("bubblecont");
         if(_loc25_ != null)
         {
            _loc25_.width = _width;
            _loc25_.height = _loc16_;
         }
      }
      
      private function onBubbleMouseDown(param1:WindowMouseEvent) : void
      {
         _widget.onItemMouseDown(var_1155,var_1154,_roomId,_roomCategory,param1);
      }
      
      public function set aboveLevels(param1:int) : void
      {
         var_2207 = param1;
      }
      
      private function onBubbleMouseOver(param1:WindowMouseEvent) : void
      {
         _widget.onItemMouseOver(var_1155,var_1154,_roomId,_roomCategory,param1);
      }
      
      public function get aboveLevels() : int
      {
         return var_2207;
      }
      
      private function onBubbleMouseUp(param1:WindowMouseEvent) : void
      {
         _widget.mouseUp();
      }
      
      public function setPointerOffset(param1:Number) : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("pointer") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("middle") as IBitmapWrapperWindow;
         if(_loc3_ == null || _loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         param1 += 0;
         param1 = Math.min(param1,_loc3_.rectangle.right - _loc2_.width);
         param1 = Math.max(param1,_loc3_.rectangle.left);
         _loc2_.x = param1;
      }
      
      public function set screenLevel(param1:int) : void
      {
         var_2208 = param1;
      }
      
      public function set x(param1:Number) : void
      {
         var_91 = param1;
         if(_window != null)
         {
            _window.x = param1;
         }
      }
      
      public function get screenLevel() : int
      {
         return var_2208;
      }
   }
}
