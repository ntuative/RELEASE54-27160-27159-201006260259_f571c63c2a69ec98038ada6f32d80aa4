package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_2184:int = 0;
      
      private var var_1647:int = 0;
      
      private var var_1810:Boolean = false;
      
      private var var_2151:int = 0;
      
      private var var_1812:int = 0;
      
      private var var_1646:int = 0;
      
      private var var_1814:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubDays() : int
      {
         return var_1647;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1647 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1810 = param1;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         var_1814 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1647 > 0 || var_1646 > 0;
      }
      
      public function get credits() : int
      {
         return var_2151;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         var_1812 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1646;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1810;
      }
      
      public function get pastClubDays() : int
      {
         return var_1814;
      }
      
      public function get pastVipDays() : int
      {
         return var_1812;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2184 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2184;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1646 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2151 = param1;
      }
   }
}
