package com.sulake.room.renderer
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.renderer.cache.BitmapDataCache;
   import com.sulake.room.renderer.cache.RoomObjectCache;
   import com.sulake.room.renderer.cache.RoomObjectCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectLocationCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectSortableSpriteCacheItem;
   import com.sulake.room.renderer.utils.ExtendedBitmap;
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   import com.sulake.room.renderer.utils.ExtendedSprite;
   import com.sulake.room.renderer.utils.ObjectMouseData;
   import com.sulake.room.renderer.utils.SortableSprite;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class RoomSpriteCanvas implements IRoomRenderingCanvas
   {
      
      private static const const_1457:int = 50;
       
      
      private var _master:Sprite;
      
      private var _container:IRoomSpriteCanvasContainer;
      
      private var var_53:Sprite;
      
      private var var_1902:int;
      
      private var var_1065:Point;
      
      private var var_754:int = 0;
      
      private var var_511:Array;
      
      private var var_312:Map = null;
      
      private var var_509:Map;
      
      private var var_725:int;
      
      private var var_869:int = 0;
      
      private var var_2452:Array;
      
      private var var_418:Array;
      
      private var var_1905:int = -1;
      
      private var var_1903:int;
      
      private var _id:String = "";
      
      private var var_234:BitmapDataCache;
      
      private var _geometry:RoomGeometry;
      
      private var var_1534:Boolean = false;
      
      private var var_1904:Number = -1.0E7;
      
      private var var_1906:Number = -1.0E7;
      
      private var var_2503:int = 0;
      
      private var var_510:RoomObjectCache;
      
      private var var_726:int;
      
      private var var_267:Sprite;
      
      private var var_1064:IRoomRenderingCanvasMouseListener = null;
      
      public function RoomSpriteCanvas(param1:IRoomSpriteCanvasContainer, param2:String, param3:int, param4:int, param5:int)
      {
         var_509 = new Map();
         var_1065 = new Point();
         var_418 = [];
         var_511 = [];
         var_2452 = [];
         super();
         _container = param1;
         _id = param2;
         _master = new Sprite();
         _master.mouseEnabled = false;
         var_53 = new Sprite();
         var_53.name = "canvas";
         var_53.mouseEnabled = false;
         _master.addChild(var_53);
         var_53.mouseEnabled = true;
         var_53.doubleClickEnabled = true;
         var_53.addEventListener(MouseEvent.CLICK,clickHandler);
         var_53.addEventListener(MouseEvent.DOUBLE_CLICK,clickHandler);
         _geometry = new RoomGeometry(param5,new Vector3d(-135,30,0),new Vector3d(11,11,5),new Vector3d(-135,0.5,0));
         var_234 = new BitmapDataCache(1024 * 1024 * 16);
         var _loc6_:* = null;
         if(_container != null)
         {
            _loc6_ = "null";
         }
         var_312 = new Map();
         var_510 = new RoomObjectCache(_loc6_);
         initialize(param3,param4);
      }
      
      private function getFlippedBitmapData(param1:BitmapData, param2:String, param3:Boolean = false) : ExtendedBitmapData
      {
         var _loc6_:* = null;
         var _loc4_:* = param2 + " FH";
         var _loc5_:* = null;
         if(param2.length > 0)
         {
            _loc5_ = var_234.getBitmapData(_loc4_);
            if(!param3)
            {
               return _loc5_;
            }
         }
         if(_loc5_ == null)
         {
            _loc5_ = new ExtendedBitmapData(param1.width,param1.height,true,16777215);
            _loc6_ = new Matrix();
            _loc6_.scale(-1,1);
            _loc6_.translate(param1.width,0);
            _loc5_.draw(param1,_loc6_);
            if(param2.length > 0)
            {
               var_234.addBitmapData(_loc4_,_loc5_);
            }
         }
         return _loc5_;
      }
      
      public function roomObjectRemoved(param1:String) : void
      {
         var_510.removeObjectCache(param1);
      }
      
      public function update() : void
      {
         if(var_869 == 0)
         {
            checkMouseHits(var_1065.x,var_1065.y,MouseEvent.MOUSE_MOVE);
         }
         var_869 = 0;
         ++var_754;
      }
      
      public function initialize(param1:int, param2:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(var_267 != null)
         {
            var_267.graphics.clear();
         }
         else
         {
            var_267 = new Sprite();
            var_267.name = "mask";
            _master.addChild(var_267);
         }
         var_267.graphics.beginFill(0);
         var_267.graphics.drawRect(0,0,param1,param2);
         var_726 = param1;
         var_725 = param2;
         var_53.graphics.clear();
         var_53.graphics.beginFill(var_2503);
         var_53.graphics.drawRect(0,0,param1,param2);
         var_53.mask = var_267;
      }
      
      private function createMouseEvent(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean) : RoomSpriteMouseEvent
      {
         var _loc11_:Number = param1 - var_726 / 2;
         var _loc12_:Number = param2 - var_725 / 2;
         var _loc13_:* = null;
         return new RoomSpriteMouseEvent(param5,_id,param6,_loc11_,_loc12_,param3,param4,param8,param7,param9,param10);
      }
      
      public function render(param1:int) : void
      {
         if(_container == null || _geometry == null)
         {
            return;
         }
         if(param1 == var_1905)
         {
            return;
         }
         var_234.compress();
         var _loc3_:int = _container.getRoomObjectCount();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         var _loc7_:* = null;
         var _loc9_:Boolean = false;
         if(var_726 != var_1902 || var_725 != var_1903)
         {
            _loc9_ = true;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = _container.getRoomObjectWithIndex(_loc4_);
            if(_loc7_ != null)
            {
               _loc6_ = _container.getRoomObjectIdWithIndex(_loc4_);
               _loc5_ += renderObject(_loc7_,_loc6_,param1,_loc9_,_loc5_);
            }
            _loc4_++;
         }
         var_418.sortOn("z",0 | 0);
         if(_loc5_ < var_418.length)
         {
            var_418.splice(_loc5_);
         }
         var _loc10_:* = null;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc10_ = var_418[_loc4_] as SortableSprite;
            if(_loc10_ != null)
            {
               updateSprite(_loc4_,_loc10_);
            }
            _loc4_++;
         }
         cleanSprites(_loc5_);
         var_1905 = param1;
         var_1902 = var_726;
         var_1903 = var_725;
      }
      
      public function get displayObject() : DisplayObject
      {
         return _master;
      }
      
      public function dispose() : void
      {
         if(_geometry != null)
         {
            _geometry.dispose();
            _geometry = null;
         }
         if(var_267 != null)
         {
            var_267 = null;
         }
         if(var_234 != null)
         {
            var_234.dispose();
            var_234 = null;
         }
         if(var_510 != null)
         {
            var_510.dispose();
            var_510 = null;
         }
         _container = null;
         cleanSprites(0,true);
         if(_master != null)
         {
            while(false)
            {
               _master.removeChildAt(0);
            }
            _master = null;
         }
         var_53 = null;
         var_267 = null;
         var_418 = [];
         if(var_509 != null)
         {
            var_509.dispose();
            var_509 = null;
         }
         var _loc1_:int = 0;
         if(var_511 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < var_511.length)
            {
               cleanSprite(var_511[_loc1_] as ExtendedSprite,true);
               _loc1_++;
            }
            var_511 = [];
         }
         if(var_312 != null)
         {
            var_312.dispose();
            var_312 = null;
         }
         var_1064 = null;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = false;
         if(param1.type == MouseEvent.CLICK || param1.type == MouseEvent.DOUBLE_CLICK)
         {
            _loc2_ = param1.type == MouseEvent.DOUBLE_CLICK;
            checkMouseClickHits(param1.localX,param1.localY,_loc2_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
         }
      }
      
      private function processMouseEvents() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(_container == null || var_312 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < var_312.length)
         {
            _loc2_ = var_312.getKey(_loc1_);
            _loc3_ = var_312.getWithIndex(_loc1_);
            if(_loc2_ != null && _loc3_ != null)
            {
               _loc4_ = _container.getRoomObject(_loc2_);
               if(_loc4_ != null)
               {
                  if(var_1064 != null)
                  {
                     var_1064.processRoomCanvasMouseEvent(_loc3_,_loc4_,_id + var_754,geometry);
                  }
                  else
                  {
                     _loc5_ = _loc4_.getMouseHandler();
                     if(_loc5_ != null)
                     {
                        _loc5_.mouseEvent(_loc3_,_geometry);
                     }
                  }
               }
            }
            _loc1_++;
         }
         var_312.reset();
      }
      
      private function getColoredBitmapData(param1:BitmapData, param2:String, param3:int, param4:Boolean = false) : ExtendedBitmapData
      {
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = 0;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:* = null;
         var _loc5_:String = param2 + " " + param3;
         var _loc6_:* = null;
         if(param2.length > 0)
         {
            _loc6_ = var_234.getBitmapData(_loc5_);
            if(!param4)
            {
               return _loc6_;
            }
         }
         if(_loc6_ == null)
         {
            _loc7_ = param3 >> 16 & 255;
            _loc8_ = param3 >> 8 & 255;
            _loc9_ = param3 & 255;
            _loc10_ = _loc7_ / 255;
            _loc11_ = _loc8_ / 255;
            _loc12_ = _loc9_ / 255;
            _loc6_ = new ExtendedBitmapData(param1.width,param1.height,true,16777215);
            _loc6_.copyPixels(param1,param1.rect,new Point(0,0));
            _loc13_ = new ColorTransform(_loc10_,_loc11_,_loc12_);
            _loc6_.colorTransform(_loc6_.rect,_loc13_);
            if(param2.length > 0)
            {
               var_234.addBitmapData(_loc5_,_loc6_);
            }
         }
         return _loc6_;
      }
      
      public function get height() : int
      {
         return var_725;
      }
      
      private function getObjectId(param1:ExtendedSprite) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            return param1.identifier;
         }
         return "";
      }
      
      public function set mouseListener(param1:IRoomRenderingCanvasMouseListener) : void
      {
         var_1064 = param1;
      }
      
      private function getSprite(param1:int) : ExtendedSprite
      {
         if(param1 < 0 || param1 >= var_53.numChildren)
         {
            return null;
         }
         return var_53.getChildAt(param1) as ExtendedSprite;
      }
      
      public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         var_1065.x = param1;
         var_1065.y = param2;
         if(var_869 > 0 && param3 == MouseEvent.MOUSE_MOVE)
         {
            return var_1534;
         }
         var_1534 = checkMouseHits(param1,param2,param3,param4,param5,param6,param7);
         ++var_869;
         return var_1534;
      }
      
      private function cleanSprites(param1:int, param2:Boolean = false) : void
      {
         var _loc6_:* = null;
         if(var_53 == null)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = -1;
         while(_loc5_ >= param1)
         {
            _loc3_ = var_53.getChildAt(_loc5_);
            _loc6_ = null;
            _loc4_ = _loc3_ as ExtendedSprite;
            cleanSprite(_loc4_,param2);
            _loc5_--;
         }
      }
      
      public function get width() : int
      {
         return var_726;
      }
      
      private function getSortableSprite(param1:int) : SortableSprite
      {
         if(param1 < 0 || param1 >= var_418.length)
         {
            return null;
         }
         return var_418[param1] as SortableSprite;
      }
      
      private function bufferMouseEvent(param1:RoomSpriteMouseEvent, param2:String) : void
      {
         if(var_312 != null && param1 != null)
         {
            var_312.add(param2,param1);
         }
      }
      
      private function checkMouseHits(param1:Number, param2:Number, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = [];
         var _loc13_:* = null;
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_53.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null && _loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
            {
               if(param3 != MouseEvent.CLICK && param3 != MouseEvent.DOUBLE_CLICK || !_loc10_.clickHandling)
               {
                  _loc9_ = getObjectId(_loc10_);
                  if(_loc12_.indexOf(_loc9_) < 0)
                  {
                     _loc16_ = _loc10_.tag;
                     _loc13_ = var_509.getValue(_loc9_) as ObjectMouseData;
                     if(_loc13_ != null)
                     {
                        if(_loc13_.spriteTag != _loc16_)
                        {
                           _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                           bufferMouseEvent(_loc11_,_loc9_);
                        }
                     }
                     if(param3 == MouseEvent.MOUSE_MOVE && (_loc13_ == null || _loc13_.spriteTag != _loc16_))
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.x,param2 - _loc10_.y,MouseEvent.ROLL_OVER,_loc16_,param4,param5,param6,param7);
                     }
                     else
                     {
                        _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,param3,_loc16_,param4,param5,param6,param7);
                     }
                     if(_loc13_ == null)
                     {
                        _loc13_ = new ObjectMouseData();
                        _loc13_.objectId = _loc9_;
                        var_509.add(_loc9_,_loc13_);
                     }
                     _loc13_.spriteTag = _loc16_;
                     if(param3 != MouseEvent.MOUSE_MOVE || param1 != var_1904 || param2 != var_1906)
                     {
                        bufferMouseEvent(_loc11_,_loc9_);
                     }
                     _loc12_.push(_loc9_);
                  }
                  _loc8_ = true;
               }
            }
            _loc14_--;
         }
         var _loc15_:Array = var_509.getKeys();
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc17_ = _loc15_[_loc14_] as String;
            _loc18_ = _loc12_.indexOf(_loc17_);
            if(_loc18_ >= 0)
            {
               _loc15_[_loc14_] = null;
            }
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc9_ = _loc15_[_loc14_] as String;
            if(_loc9_ != null)
            {
               _loc13_ = var_509.remove(_loc9_) as ObjectMouseData;
               if(_loc13_ != null)
               {
                  _loc11_ = createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                  bufferMouseEvent(_loc11_,_loc9_);
               }
            }
            _loc14_++;
         }
         processMouseEvents();
         var_1904 = param1;
         var_1906 = param2;
         return _loc8_;
      }
      
      private function createSprite(param1:SortableSprite, param2:int = -1) : void
      {
         if(param1.sprite == null)
         {
            return;
         }
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:IRoomObjectSprite = param1.sprite;
         if(false)
         {
            _loc3_ = var_511.pop() as ExtendedSprite;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new ExtendedSprite();
         }
         if(_loc3_.numChildren > 0)
         {
            _loc4_ = _loc3_.getChildAt(0) as ExtendedBitmap;
         }
         if(_loc4_ == null)
         {
            _loc4_ = new ExtendedBitmap();
            _loc4_.pixelSnapping = PixelSnapping.ALWAYS;
            _loc3_.addChildAt(_loc4_,0);
         }
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.identifier = param1.name;
         _loc3_.alpha = _loc5_.alpha / 255;
         _loc3_.tag = _loc5_.tag;
         _loc3_.blendMode = _loc5_.blendMode;
         _loc3_.varyingDepth = _loc5_.varyingDepth;
         _loc3_.clickHandling = _loc5_.clickHandling;
         _loc4_.bitmapData = getBitmapData(_loc5_.asset,_loc5_.assetName,_loc5_.flipH,_loc5_.color);
         _loc3_.addChildAt(_loc4_,0);
         if(_loc5_.capturesMouse)
         {
            _loc3_.alphaTolerance = 128;
         }
         else
         {
            _loc3_.alphaTolerance = 256;
         }
         if(param2 < 0 || param2 >= var_53.numChildren)
         {
            var_53.addChild(_loc3_);
         }
         else
         {
            var_53.addChildAt(_loc3_,param2);
         }
         _loc3_.mouseEnabled = false;
      }
      
      private function checkMouseClickHits(param1:Number, param2:Number, param3:Boolean, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc15_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = "null";
         if(param3)
         {
            _loc12_ = "null";
         }
         var _loc13_:* = [];
         var _loc14_:int = 0;
         _loc14_ = -1;
         while(_loc14_ >= 0)
         {
            _loc10_ = var_53.getChildAt(_loc14_) as ExtendedSprite;
            if(_loc10_ != null && _loc10_.clickHandling)
            {
               if(_loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
               {
                  _loc9_ = getObjectId(_loc10_);
                  if(_loc13_.indexOf(_loc9_) < 0)
                  {
                     _loc15_ = _loc10_.tag;
                     _loc11_ = createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,_loc12_,_loc15_,param4,param5,param6,param7);
                     bufferMouseEvent(_loc11_,_loc9_);
                     _loc13_.push(_loc9_);
                  }
               }
               _loc8_ = true;
               break;
            }
            _loc14_--;
         }
         processMouseEvents();
         return _loc8_;
      }
      
      private function updateSprite(param1:int, param2:SortableSprite) : Boolean
      {
         var _loc5_:* = null;
         var _loc6_:Number = NaN;
         var _loc7_:* = null;
         if(param2.sprite == null)
         {
            return false;
         }
         if(param1 >= var_53.numChildren)
         {
            createSprite(param2);
            return true;
         }
         var _loc3_:IRoomObjectSprite = param2.sprite;
         var _loc4_:ExtendedSprite = var_53.getChildAt(param1) as ExtendedSprite;
         if(_loc4_ != null)
         {
            if(_loc4_.varyingDepth != _loc3_.varyingDepth)
            {
               if(_loc4_.varyingDepth && !_loc3_.varyingDepth)
               {
                  var_53.removeChildAt(param1);
                  var_511.push(_loc4_);
                  return updateSprite(param1,param2);
               }
               createSprite(param2,param1);
               return true;
            }
            if(_loc4_.x != param2.x)
            {
               _loc4_.x = param2.x;
            }
            if(_loc4_.y != param2.y)
            {
               _loc4_.y = param2.y;
            }
            if(_loc4_.needsUpdate(_loc3_.instanceId,_loc3_.updateId))
            {
               if(_loc3_.capturesMouse)
               {
                  _loc4_.alphaTolerance = 128;
               }
               else
               {
                  _loc4_.alphaTolerance = 256;
               }
               _loc5_ = null;
               if(_loc4_.numChildren > 0)
               {
                  _loc5_ = _loc4_.getChildAt(0) as ExtendedBitmap;
               }
               if(_loc5_ == null)
               {
                  _loc5_ = new ExtendedBitmap();
                  _loc4_.addChildAt(_loc5_,0);
               }
               _loc6_ = _loc3_.alpha / 255;
               if(_loc4_.alpha != _loc6_)
               {
                  _loc4_.alpha = _loc6_;
               }
               _loc4_.identifier = param2.name;
               _loc4_.tag = _loc3_.tag;
               _loc4_.varyingDepth = _loc3_.varyingDepth;
               _loc4_.blendMode = _loc3_.blendMode;
               _loc4_.clickHandling = _loc3_.clickHandling;
               _loc7_ = getBitmapData(_loc3_.asset,_loc3_.assetName,_loc3_.flipH,_loc3_.color);
               if(_loc5_.bitmapData != _loc7_)
               {
                  _loc5_.bitmapData = _loc7_;
               }
            }
            return true;
         }
         return false;
      }
      
      private function getBitmapData(param1:BitmapData, param2:String, param3:Boolean, param4:int) : BitmapData
      {
         param4 &= 16777215;
         if(!param3 && param4 == 16777215)
         {
            return param1;
         }
         var _loc5_:* = null;
         var _loc6_:* = "";
         if(param3 && param4 != 16777215)
         {
            _loc6_ = param2 + " " + param4 + " FH";
            if(param2.length > 0)
            {
               _loc5_ = var_234.getBitmapData(_loc6_);
            }
            if(_loc5_ == null)
            {
               _loc5_ = getColoredBitmapData(param1,param2,param4);
               if(_loc5_ != null)
               {
                  _loc5_ = getFlippedBitmapData(_loc5_,"",true);
                  if(param2.length > 0)
                  {
                     var_234.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = getFlippedBitmapData(_loc5_,param2);
               if(_loc5_ != null)
               {
                  _loc5_ = getColoredBitmapData(_loc5_,"",param4,true);
                  if(param2.length > 0)
                  {
                     var_234.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = getColoredBitmapData(param1,param2,param4,true);
               _loc5_ = getFlippedBitmapData(_loc5_,"",true);
               if(param2.length > 0)
               {
                  var_234.addBitmapData(_loc6_,_loc5_);
               }
            }
         }
         else if(param3)
         {
            _loc5_ = getFlippedBitmapData(param1,param2,true);
         }
         else
         {
            if(param4 == 16777215)
            {
               return param1;
            }
            _loc5_ = getColoredBitmapData(param1,param2,param4,true);
         }
         return _loc5_;
      }
      
      private function renderObject(param1:IRoomObject, param2:String, param3:int, param4:Boolean, param5:int) : int
      {
         var _loc23_:* = null;
         var _loc6_:IRoomObjectSpriteVisualization = param1.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc6_ == null)
         {
            var_510.removeObjectCache(param2);
            return 0;
         }
         var _loc7_:RoomObjectCacheItem = var_510.getObjectCache(param2);
         var _loc8_:RoomObjectLocationCacheItem = _loc7_.location;
         var _loc9_:RoomObjectSortableSpriteCacheItem = _loc7_.sprites;
         var _loc10_:Boolean = _loc8_.needsUpdate(_geometry.updateId,param1.getUpdateID());
         if(_loc10_)
         {
            param4 = true;
         }
         var _loc11_:IVector3d = _loc8_.getScreenLocation(param1,_geometry,_loc10_);
         if(_loc11_ == null)
         {
            var_510.removeObjectCache(param2);
            return 0;
         }
         _loc6_.update(_geometry,param3);
         if(!_loc9_.needsUpdate(_loc6_.getInstanceId(),_loc6_.getUpdateID()) && !param4)
         {
            return _loc9_.spriteCount;
         }
         var _loc12_:int = _loc6_.spriteCount;
         var _loc13_:int = _loc11_.x;
         var _loc14_:int = _loc11_.y;
         var _loc15_:Number = _loc11_.z;
         if(_loc13_ > 0)
         {
            _loc15_ += _loc13_ * 1.2e-7;
         }
         else
         {
            _loc15_ += -_loc13_ * 1.2e-7;
         }
         _loc13_ += int(var_726 / 2);
         _loc14_ += int(var_725 / 2);
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc22_:int = 0;
         while(_loc22_ < _loc12_)
         {
            _loc18_ = _loc6_.getSprite(_loc22_);
            if(_loc18_ != null && _loc18_.visible)
            {
               _loc23_ = _loc18_.asset;
               if(_loc23_ != null)
               {
                  _loc19_ = _loc13_ + _loc18_.offsetX;
                  _loc20_ = _loc14_ + _loc18_.offsetY;
                  if(_loc19_ + _loc23_.width >= 0 && _loc19_ < var_726 && (_loc20_ + _loc23_.height >= 0 && _loc20_ < var_725))
                  {
                     _loc17_ = _loc9_.getSprite(_loc16_);
                     if(_loc17_ == null)
                     {
                        _loc17_ = new SortableSprite();
                        _loc9_.addSprite(_loc17_);
                        var_418.push(_loc17_);
                     }
                     _loc17_.sprite = _loc18_;
                     _loc17_.name = param2;
                     _loc17_.x = _loc19_;
                     _loc17_.y = _loc20_;
                     _loc17_.z = _loc15_ + _loc18_.relativeDepth + 3.7e-11 * param5;
                     _loc16_++;
                     param5++;
                  }
               }
            }
            _loc22_++;
         }
         _loc9_.setSpriteCount(_loc16_);
         return _loc16_;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return _geometry;
      }
      
      private function cleanSprite(param1:ExtendedSprite, param2:Boolean) : void
      {
         var _loc3_:* = null;
         if(param1 != null)
         {
            if(!param2)
            {
               _loc3_ = param1.removeChildAt(0) as Bitmap;
               if(_loc3_ != null)
               {
                  _loc3_.bitmapData = null;
               }
            }
            else
            {
               param1.dispose();
            }
         }
      }
   }
}
