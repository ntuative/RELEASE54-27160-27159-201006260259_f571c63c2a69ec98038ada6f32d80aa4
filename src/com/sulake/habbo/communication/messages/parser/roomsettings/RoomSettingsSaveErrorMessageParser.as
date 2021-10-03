package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1616:int = 9;
      
      public static const const_1674:int = 4;
      
      public static const const_1525:int = 1;
      
      public static const const_1208:int = 10;
      
      public static const const_1575:int = 2;
      
      public static const const_1371:int = 7;
      
      public static const const_1209:int = 11;
      
      public static const const_1555:int = 3;
      
      public static const const_1287:int = 8;
      
      public static const const_1305:int = 5;
      
      public static const const_1573:int = 6;
      
      public static const const_1385:int = 12;
       
      
      private var var_2267:String;
      
      private var _roomId:int;
      
      private var var_1246:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2267;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1246 = param1.readInteger();
         var_2267 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1246;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
