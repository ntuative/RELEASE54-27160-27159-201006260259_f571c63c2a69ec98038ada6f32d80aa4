package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomPlaneVisibilityUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_904:String = "RORPVUM_FLOOR_VISIBILITY";
      
      public static const const_1013:String = "RORPVUM_WALL_VISIBILITY";
       
      
      private var var_373:Boolean = false;
      
      private var _type:String = "";
      
      public function RoomObjectRoomPlaneVisibilityUpdateMessage(param1:String, param2:Boolean)
      {
         super(null,null);
         _type = param1;
         var_373 = param2;
      }
      
      public function get visible() : Boolean
      {
         return var_373;
      }
      
      public function get type() : String
      {
         return _type;
      }
   }
}
