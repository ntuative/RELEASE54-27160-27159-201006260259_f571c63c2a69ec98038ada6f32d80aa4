package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2036:Boolean = false;
      
      private var var_2034:int = 0;
      
      private var var_1647:int = 0;
      
      private var var_2035:int = 0;
      
      private var var_1810:Boolean = false;
      
      private var var_1623:int = 0;
      
      private var var_1646:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1623 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2034;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2036;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2036 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1810;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2034 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1647 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1623;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1810 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2035 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1647;
      }
      
      public function get pixelBalance() : int
      {
         return var_2035;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1646 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1646;
      }
   }
}
