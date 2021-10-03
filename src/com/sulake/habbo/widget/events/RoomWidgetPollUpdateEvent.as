package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_123:String = "RWPUW_CONTENT";
      
      public static const const_116:String = "RWPUW_OFFER";
      
      public static const const_59:String = "RWPUW_ERROR";
       
      
      private var var_1158:Array = null;
      
      private var var_1411:String = "";
      
      private var var_1481:String;
      
      private var var_1410:String = "";
      
      private var var_1157:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         _id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return var_1158;
      }
      
      public function get startMessage() : String
      {
         return var_1411;
      }
      
      public function get summary() : String
      {
         return var_1481;
      }
      
      public function set startMessage(param1:String) : void
      {
         var_1411 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         var_1157 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         var_1481 = param1;
      }
      
      public function get numQuestions() : int
      {
         return var_1157;
      }
      
      public function set endMessage(param1:String) : void
      {
         var_1410 = param1;
      }
      
      public function get endMessage() : String
      {
         return var_1410;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         var_1158 = param1;
      }
   }
}
