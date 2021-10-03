package com.sulake.habbo.room.utils
{
   public class RoomInstanceData
   {
       
      
      private var var_905:LegacyWallGeometry = null;
      
      private var var_631:SelectedRoomObjectData = null;
      
      private var _roomCategory:int = 0;
      
      private var var_632:TileHeightMap = null;
      
      private var var_1970:String = null;
      
      private var _roomId:int = 0;
      
      private var var_630:SelectedRoomObjectData = null;
      
      private var var_906:RoomCamera = null;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         super();
         _roomId = param1;
         _roomCategory = param2;
         var_905 = new LegacyWallGeometry();
         var_906 = new RoomCamera();
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_631 != null)
         {
            var_631.dispose();
         }
         var_631 = param1;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(var_632 != null)
         {
            var_632.dispose();
         }
         var_632 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function set worldType(param1:String) : void
      {
         var_1970 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return var_905;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return var_630;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return var_906;
      }
      
      public function dispose() : void
      {
         if(var_632 != null)
         {
            var_632.dispose();
            var_632 = null;
         }
         if(var_905 != null)
         {
            var_905.dispose();
            var_905 = null;
         }
         if(var_906 != null)
         {
            var_906.dispose();
            var_906 = null;
         }
         if(var_631 != null)
         {
            var_631.dispose();
            var_631 = null;
         }
         if(var_630 != null)
         {
            var_630.dispose();
            var_630 = null;
         }
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return var_632;
      }
      
      public function get worldType() : String
      {
         return var_1970;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(var_630 != null)
         {
            var_630.dispose();
         }
         var_630 = param1;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return var_631;
      }
   }
}
