package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomThumbnailObjectData
   {
       
      
      private var var_1691:int;
      
      private var var_1690:int;
      
      public function RoomThumbnailObjectData()
      {
         super();
      }
      
      public function get pos() : int
      {
         return var_1691;
      }
      
      public function set pos(param1:int) : void
      {
         this.var_1691 = param1;
      }
      
      public function getCopy() : RoomThumbnailObjectData
      {
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.var_1691 = this.var_1691;
         _loc1_.var_1690 = this.var_1690;
         return _loc1_;
      }
      
      public function set imgId(param1:int) : void
      {
         this.var_1690 = param1;
      }
      
      public function get imgId() : int
      {
         return var_1690;
      }
   }
}
