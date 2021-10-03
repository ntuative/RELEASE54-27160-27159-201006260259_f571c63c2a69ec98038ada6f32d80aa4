package com.sulake.habbo.session.events
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionQueueEvent extends RoomSessionEvent
   {
      
      public static const const_498:String = "RSQE_QUEUE_STATUS";
      
      public static const const_944:int = 2;
      
      public static const const_1039:String = "c";
      
      public static const const_1240:String = "d";
      
      public static const const_874:int = 1;
       
      
      private var var_1232:Map;
      
      private var _name:String;
      
      private var var_2520:String;
      
      private var var_284:Boolean;
      
      private var _target:int;
      
      public function RoomSessionQueueEvent(param1:IRoomSession, param2:String, param3:int, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_498,param1,param5,param6);
         _name = param2;
         _target = param3;
         var_1232 = new Map();
         var_284 = param4;
      }
      
      public function getQueueSize(param1:String) : int
      {
         return var_1232.getValue(param1);
      }
      
      public function get queueTypes() : Array
      {
         return var_1232.getKeys();
      }
      
      public function get queueSetTarget() : int
      {
         return _target;
      }
      
      public function get isActive() : Boolean
      {
         return var_284;
      }
      
      public function get queueSetName() : String
      {
         return _name;
      }
      
      public function addQueue(param1:String, param2:int) : void
      {
         var_1232.add(param1,param2);
      }
   }
}
