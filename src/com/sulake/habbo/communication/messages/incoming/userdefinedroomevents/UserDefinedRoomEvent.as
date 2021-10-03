package com.sulake.habbo.communication.messages.incoming.userdefinedroomevents
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class UserDefinedRoomEvent implements IDisposable
   {
       
      
      private var var_1195:Array;
      
      private var _disposed:Boolean;
      
      private var var_2400:int;
      
      private var _id:int;
      
      private var var_242:Array;
      
      public function UserDefinedRoomEvent(param1:IMessageDataWrapper)
      {
         var_242 = new Array();
         var_1195 = new Array();
         super();
         _id = param1.readInteger();
         var_2400 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1195.push(new TriggerDefinition(param1));
            _loc3_++;
         }
         _loc2_ = param1.readInteger();
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            var_242.push(new ActionDefinition(param1));
            _loc3_++;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get triggers() : Array
      {
         return var_1195;
      }
      
      public function get propagation() : int
      {
         return var_2400;
      }
      
      public function get actions() : Array
      {
         return var_242;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         var_242 = null;
         var_1195 = null;
      }
   }
}
