package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1932:int;
      
      private var var_452:Boolean;
      
      private var var_1933:Boolean;
      
      private var var_889:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1933 = param1.readBoolean();
         if(var_1933)
         {
            var_1932 = param1.readInteger();
            var_452 = param1.readBoolean();
         }
         else
         {
            var_889 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_889 != null)
         {
            var_889.dispose();
            var_889 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1932;
      }
      
      public function get owner() : Boolean
      {
         return var_452;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1933;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_889;
      }
   }
}
