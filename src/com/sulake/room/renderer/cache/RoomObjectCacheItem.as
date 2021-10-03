package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_674:RoomObjectLocationCacheItem = null;
      
      private var var_177:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_674 = new RoomObjectLocationCacheItem(param1);
         var_177 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_674;
      }
      
      public function dispose() : void
      {
         if(var_674 != null)
         {
            var_674.dispose();
            var_674 = null;
         }
         if(var_177 != null)
         {
            var_177.dispose();
            var_177 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_177;
      }
   }
}
