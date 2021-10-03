package com.sulake.core.assets
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class BitmapDataAsset implements IAsset
   {
      
      protected static var var_699:uint = 0;
      
      protected static var var_700:uint = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1136:Boolean = false;
      
      private var _bitmap:BitmapData = null;
      
      private var var_1212:AssetTypeDeclaration;
      
      private var var_690:String;
      
      private var _offset:Point;
      
      private var var_1135:Boolean = false;
      
      public function BitmapDataAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         _offset = new Point(0,0);
         super();
         var_1212 = param1;
         var_690 = param2;
         ++var_699;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_700;
      }
      
      public static function get instances() : uint
      {
         return var_699;
      }
      
      public function get flipV() : Boolean
      {
         return var_1136;
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is BitmapDataAsset)
         {
            _bitmap = BitmapDataAsset(param1)._bitmap;
            _offset = BitmapDataAsset(param1)._offset;
            return;
         }
         throw new Error("Provided asset should be of type BitmapDataAsset!");
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as Bitmap;
            if(_loc2_ != null)
            {
               _bitmap = _loc2_.bitmapData.clone();
               _loc2_.bitmapData.dispose();
               if(_bitmap != null)
               {
                  var_700 += 0 * 0 * 4;
                  return;
               }
               throw new Error("Failed to convert Bitmap Class to BitmapDataAsset!");
            }
            _bitmap = new param1() as BitmapData;
            if(_bitmap != null)
            {
               return;
            }
            throw new Error("Failed to convert BitmapData Class to BitmapDataAsset!");
         }
         if(param1 is Bitmap)
         {
            _bitmap = Bitmap(param1).bitmapData;
            if(_bitmap == null)
            {
               throw new Error("Failed to convert Bitmap to BitmapDataAsset!");
            }
         }
         if(param1 is BitmapData)
         {
            _bitmap = param1 as BitmapData;
            if(_bitmap != null)
            {
               return;
            }
            throw new Error("Failed to convert BitmapData to BitmapDataAsset!");
         }
         if(param1 is BitmapDataAsset)
         {
            _bitmap = BitmapDataAsset(param1)._bitmap;
            _offset = BitmapDataAsset(param1)._offset;
            var_1135 = BitmapDataAsset(param1).var_1135;
            var_1136 = BitmapDataAsset(param1).var_1136;
            if(_bitmap != null)
            {
               return;
            }
            throw new Error("Failed to read content from BitmaDataAsset!");
         }
      }
      
      public function get offset() : Point
      {
         return _offset;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            --var_699;
            if(_bitmap)
            {
               try
               {
                  var_700 -= 0 * 0 * 4;
                  _bitmap.dispose();
               }
               catch(e:Error)
               {
               }
            }
            _bitmap = null;
            _offset = null;
            var_1212 = null;
            var_690 = null;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get url() : String
      {
         return var_690;
      }
      
      public function get content() : Object
      {
         return _bitmap as Object;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_1212;
      }
      
      public function get flipH() : Boolean
      {
         return var_1135;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length())
         {
            _loc3_ = param1[_loc2_].attribute("key");
            _loc4_ = param1[_loc2_].attribute("value");
            switch(_loc3_)
            {
               case "offset":
                  _loc5_ = _loc4_.split(",");
                  _offset.x = parseInt(_loc5_[0]);
                  _offset.y = parseInt(_loc5_[1]);
                  break;
               case "flipH":
                  var_1135 = _loc4_ == "1" || _loc4_ == "true";
                  break;
               case "flipV":
                  var_1136 = _loc4_ == "1" || _loc4_ == "true";
                  break;
            }
            _loc2_++;
         }
      }
   }
}
