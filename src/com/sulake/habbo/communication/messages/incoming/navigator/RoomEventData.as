package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1798:String;
      
      private var var_453:int;
      
      private var var_1799:String;
      
      private var var_1803:String;
      
      private var var_1802:int;
      
      private var var_1800:String;
      
      private var var_1801:int;
      
      private var var_694:Array;
      
      private var var_1184:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_694 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1184 = false;
            return;
         }
         this.var_1184 = true;
         var_1802 = int(_loc2_);
         var_1799 = param1.readString();
         var_453 = int(param1.readString());
         var_1801 = param1.readInteger();
         var_1798 = param1.readString();
         var_1803 = param1.readString();
         var_1800 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_694.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1801;
      }
      
      public function get eventName() : String
      {
         return var_1798;
      }
      
      public function get eventDescription() : String
      {
         return var_1803;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1799;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get creationTime() : String
      {
         return var_1800;
      }
      
      public function get exists() : Boolean
      {
         return var_1184;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1802;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_694 = null;
      }
      
      public function get flatId() : int
      {
         return var_453;
      }
   }
}
