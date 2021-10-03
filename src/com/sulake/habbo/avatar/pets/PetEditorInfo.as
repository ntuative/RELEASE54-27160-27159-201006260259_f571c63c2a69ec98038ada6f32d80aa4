package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1828:Boolean;
      
      private var var_1822:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1828 = Boolean(parseInt(param1.@club));
         var_1822 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1828;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1822;
      }
   }
}
