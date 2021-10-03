package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1879:int;
      
      private var var_1915:int;
      
      private var var_1909:int;
      
      private var _type:int;
      
      private var var_1271:int = -1;
      
      private var var_1910:int;
      
      private var _nutrition:int;
      
      private var var_1914:int;
      
      private var _energy:int;
      
      private var var_1775:int;
      
      private var var_1911:int;
      
      private var var_2014:int;
      
      private var var_1912:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2015:Boolean;
      
      private var _name:String = "";
      
      private var var_1913:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2015;
      }
      
      public function get level() : int
      {
         return var_1879;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1914;
      }
      
      public function get id() : int
      {
         return var_1271;
      }
      
      public function get nutritionMax() : int
      {
         return var_1909;
      }
      
      public function get ownerId() : int
      {
         return var_1913;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1271 = param1.id;
         _type = param1.petType;
         var_1775 = param1.petRace;
         _image = param1.image;
         var_2015 = param1.isOwnPet;
         var_1913 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1879 = param1.level;
         var_1910 = param1.levelMax;
         var_1915 = param1.experience;
         var_1914 = param1.experienceMax;
         _energy = param1.energy;
         var_1911 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1909 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_2014 = param1.roomIndex;
         var_1912 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_2014;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1911;
      }
      
      public function get levelMax() : int
      {
         return var_1910;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1775;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1915;
      }
      
      public function get age() : int
      {
         return var_1912;
      }
   }
}
