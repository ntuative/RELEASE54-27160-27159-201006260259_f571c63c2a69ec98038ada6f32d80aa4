package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_228:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2149:Boolean = false;
      
      private var var_2147:int = 0;
      
      private var var_2146:int = 0;
      
      private var var_1821:int;
      
      private var var_2148:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_228,param6,param7);
         var_2148 = param1;
         var_2146 = param2;
         var_2147 = param3;
         var_2149 = param4;
         var_1821 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1821;
      }
      
      public function get pastPeriods() : int
      {
         return var_2147;
      }
      
      public function get periodsLeft() : int
      {
         return var_2146;
      }
      
      public function get daysLeft() : int
      {
         return var_2148;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2149;
      }
   }
}
