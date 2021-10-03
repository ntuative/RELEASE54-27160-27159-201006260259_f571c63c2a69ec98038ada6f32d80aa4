package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_620:String;
      
      private var _id:int;
      
      private var var_2379:String = "";
      
      private var var_2378:int;
      
      private var var_2380:String;
      
      private var var_1843:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2378 = parseInt(param1.@pattern);
         var_620 = String(param1.@gender);
         var_1843 = Boolean(parseInt(param1.@colorable));
         var_2379 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2379;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1843;
      }
      
      public function get gender() : String
      {
         return var_620;
      }
      
      public function get patternId() : int
      {
         return var_2378;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2380;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2380 = param1;
      }
   }
}
