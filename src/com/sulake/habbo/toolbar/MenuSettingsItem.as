package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1731:Array;
      
      private var var_1730:String;
      
      private var var_1728:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1730 = param1;
         var_1731 = param2;
         var_1728 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1730;
      }
      
      public function get yieldList() : Array
      {
         return var_1731;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1728;
      }
   }
}
