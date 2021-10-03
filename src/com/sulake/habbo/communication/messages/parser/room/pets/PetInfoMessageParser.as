package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1912:int;
      
      private var var_421:String;
      
      private var var_1879:int;
      
      private var var_1916:int;
      
      private var var_1915:int;
      
      private var var_1954:int;
      
      private var _nutrition:int;
      
      private var var_1271:int;
      
      private var var_1957:int;
      
      private var var_1956:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1913:int;
      
      private var var_1955:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1954;
      }
      
      public function flush() : Boolean
      {
         var_1271 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1957;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1956;
      }
      
      public function get maxNutrition() : int
      {
         return var_1955;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1916;
      }
      
      public function get petId() : int
      {
         return var_1271;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1271 = param1.readInteger();
         _name = param1.readString();
         var_1879 = param1.readInteger();
         var_1957 = param1.readInteger();
         var_1915 = param1.readInteger();
         var_1956 = param1.readInteger();
         _energy = param1.readInteger();
         var_1954 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1955 = param1.readInteger();
         var_421 = param1.readString();
         var_1916 = param1.readInteger();
         var_1913 = param1.readInteger();
         var_1912 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1915;
      }
      
      public function get ownerId() : int
      {
         return var_1913;
      }
      
      public function get age() : int
      {
         return var_1912;
      }
   }
}
