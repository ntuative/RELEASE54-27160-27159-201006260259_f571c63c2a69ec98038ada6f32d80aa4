package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1088:int;
      
      private var var_1310:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1088 = param1;
         var_1310 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1088;
      }
      
      public function get itemName() : String
      {
         return var_1310;
      }
   }
}
