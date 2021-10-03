package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_137:String = "RSPE_VOTE_RESULT";
      
      public static const const_126:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1368:int = 0;
      
      private var var_1044:String = "";
      
      private var var_794:Array;
      
      private var var_1076:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_1076 = [];
         var_794 = [];
         super(param1,param2,param7,param8);
         var_1044 = param3;
         var_1076 = param4;
         var_794 = param5;
         if(var_794 == null)
         {
            var_794 = [];
         }
         var_1368 = param6;
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
