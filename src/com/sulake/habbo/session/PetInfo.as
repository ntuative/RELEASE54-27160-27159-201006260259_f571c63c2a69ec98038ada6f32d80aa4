package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1879:int;
      
      private var var_1916:int;
      
      private var var_1915:int;
      
      private var var_1909:int;
      
      private var _nutrition:int;
      
      private var var_1271:int;
      
      private var var_1910:int;
      
      private var var_1914:int;
      
      private var _energy:int;
      
      private var var_1912:int;
      
      private var var_1911:int;
      
      private var _ownerName:String;
      
      private var var_1913:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1879;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1916 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1879 = param1;
      }
      
      public function get petId() : int
      {
         return var_1271;
      }
      
      public function get experienceMax() : int
      {
         return var_1914;
      }
      
      public function get nutritionMax() : int
      {
         return var_1909;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1910 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1913;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1271 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1911;
      }
      
      public function get respect() : int
      {
         return var_1916;
      }
      
      public function get levelMax() : int
      {
         return var_1910;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1914 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1915 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1909 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1913 = param1;
      }
      
      public function get experience() : int
      {
         return var_1915;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1911 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1912 = param1;
      }
      
      public function get age() : int
      {
         return var_1912;
      }
   }
}
