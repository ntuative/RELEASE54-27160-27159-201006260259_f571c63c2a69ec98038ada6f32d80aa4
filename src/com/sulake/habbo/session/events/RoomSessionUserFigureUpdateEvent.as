package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_148:String = "RSUBE_FIGURE";
       
      
      private var var_620:String = "";
      
      private var var_421:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_148,param1,param5,param6);
         _userId = param2;
         var_421 = param3;
         var_620 = param4;
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
