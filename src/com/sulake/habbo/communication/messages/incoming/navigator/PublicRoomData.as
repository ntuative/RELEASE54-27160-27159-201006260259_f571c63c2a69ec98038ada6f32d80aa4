package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1891:int;
      
      private var var_2341:String;
      
      private var var_1836:int;
      
      private var _disposed:Boolean;
      
      private var var_2342:int;
      
      private var var_2343:String;
      
      private var var_1349:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_2343 = param1.readString();
         var_1891 = param1.readInteger();
         var_1836 = param1.readInteger();
         var_2341 = param1.readString();
         var_2342 = param1.readInteger();
         var_1349 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2342;
      }
      
      public function get worldId() : int
      {
         return var_1836;
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
      }
      
      public function get unitPropertySet() : String
      {
         return var_2343;
      }
      
      public function get unitPort() : int
      {
         return var_1891;
      }
      
      public function get castLibs() : String
      {
         return var_2341;
      }
      
      public function get nodeId() : int
      {
         return var_1349;
      }
   }
}
