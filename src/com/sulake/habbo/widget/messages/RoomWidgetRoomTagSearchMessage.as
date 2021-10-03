package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_605:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1924:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_605);
         var_1924 = param1;
      }
      
      public function get tag() : String
      {
         return var_1924;
      }
   }
}
