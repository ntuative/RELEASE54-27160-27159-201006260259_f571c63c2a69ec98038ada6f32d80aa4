package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_137:String = "RWPUE_VOTE_RESULT";
      
      public static const const_126:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1368:int;
      
      private var var_1044:String;
      
      private var var_794:Array;
      
      private var var_1076:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1044 = param2;
         var_1076 = param3;
         var_794 = param4;
         if(var_794 == null)
         {
            var_794 = [];
         }
         var_1368 = param5;
      }
      
      public function get votes() : Array
      {
         return var_794.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1368;
      }
      
      public function get question() : String
      {
         return var_1044;
      }
      
      public function get choices() : Array
      {
         return var_1076.slice();
      }
   }
}
