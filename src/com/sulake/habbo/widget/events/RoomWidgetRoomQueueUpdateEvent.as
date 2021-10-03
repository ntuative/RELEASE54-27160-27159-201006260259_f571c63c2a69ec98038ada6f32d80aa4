package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_456:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_325:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_945:int;
      
      private var var_284:Boolean;
      
      private var var_2210:Boolean;
      
      private var var_1501:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_945 = param2;
         var_2210 = param3;
         var_284 = param4;
         var_1501 = param5;
      }
      
      public function get position() : int
      {
         return var_945;
      }
      
      public function get isActive() : Boolean
      {
         return var_284;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1501;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2210;
      }
   }
}
