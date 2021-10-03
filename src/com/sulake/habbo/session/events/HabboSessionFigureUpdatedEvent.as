package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class HabboSessionFigureUpdatedEvent extends Event
   {
      
      public static const const_549:String = "HABBO_SESSION_FIGURE_UPDATE";
       
      
      private var var_620:String;
      
      private var var_421:String;
      
      private var _userId:int;
      
      public function HabboSessionFigureUpdatedEvent(param1:int, param2:String, param3:String, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_549,param4,param5);
         _userId = param1;
         var_421 = param2;
         var_620 = param3;
      }
      
      public function get gender() : String
      {
         return var_620;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
