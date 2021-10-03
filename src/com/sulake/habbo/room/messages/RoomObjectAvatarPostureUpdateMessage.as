package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2000:String;
      
      private var var_893:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2000 = param1;
         var_893 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2000;
      }
      
      public function get parameter() : String
      {
         return var_893;
      }
   }
}
