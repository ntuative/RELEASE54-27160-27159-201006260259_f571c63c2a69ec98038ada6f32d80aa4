package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_421:String;
      
      private var var_1879:int;
      
      private var var_2100:String;
      
      private var var_1093:int;
      
      private var var_1271:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1271;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1271 = param1.readInteger();
         var_2100 = param1.readString();
         var_1879 = param1.readInteger();
         var_421 = param1.readString();
         var_1093 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2100;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function get petType() : int
      {
         return var_1093;
      }
      
      public function get level() : int
      {
         return var_1879;
      }
   }
}
