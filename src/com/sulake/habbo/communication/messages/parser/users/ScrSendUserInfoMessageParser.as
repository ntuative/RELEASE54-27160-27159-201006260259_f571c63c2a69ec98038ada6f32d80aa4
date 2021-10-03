package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1406:int = 2;
      
      public static const const_1678:int = 1;
       
      
      private var var_1811:int;
      
      private var var_1813:int;
      
      private var var_1810:Boolean;
      
      private var var_1817:int;
      
      private var var_1332:String;
      
      private var var_1816:Boolean;
      
      private var var_1812:int;
      
      private var var_1815:int;
      
      private var var_1814:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1813;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1810;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1815;
      }
      
      public function get memberPeriods() : int
      {
         return var_1817;
      }
      
      public function get productName() : String
      {
         return var_1332;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1816;
      }
      
      public function get responseType() : int
      {
         return var_1811;
      }
      
      public function get pastClubDays() : int
      {
         return var_1814;
      }
      
      public function get pastVipDays() : int
      {
         return var_1812;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1332 = param1.readString();
         var_1813 = param1.readInteger();
         var_1817 = param1.readInteger();
         var_1815 = param1.readInteger();
         var_1811 = param1.readInteger();
         var_1816 = param1.readBoolean();
         var_1810 = param1.readBoolean();
         var_1814 = param1.readInteger();
         var_1812 = param1.readInteger();
         return true;
      }
   }
}
