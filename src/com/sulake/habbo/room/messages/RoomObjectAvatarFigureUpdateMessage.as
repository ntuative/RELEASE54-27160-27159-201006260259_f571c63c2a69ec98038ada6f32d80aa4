package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1775:String;
      
      private var var_421:String;
      
      private var var_620:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_421 = param1;
         var_620 = param2;
         var_1775 = param3;
      }
      
      public function get race() : String
      {
         return var_1775;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function get gender() : String
      {
         return var_620;
      }
   }
}
