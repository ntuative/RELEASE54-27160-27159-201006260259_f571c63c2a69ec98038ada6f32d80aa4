package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_486:int = 0;
      
      public static const const_114:int = 2;
      
      public static const const_163:int = 1;
      
      public static const const_544:Array = ["open","closed","password"];
       
      
      private var _name:String;
      
      private var var_2273:Boolean;
      
      private var var_2275:Boolean;
      
      private var var_2272:int;
      
      private var var_2274:Array;
      
      private var var_2271:int;
      
      private var var_2163:Boolean;
      
      private var var_1234:String;
      
      private var var_2276:int;
      
      private var var_2277:Boolean;
      
      private var var_1873:int;
      
      private var var_1235:int;
      
      private var _roomId:int;
      
      private var var_694:Array;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_2276;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2276 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         var_2277 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_694;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2163;
      }
      
      public function set controllerCount(param1:int) : void
      {
         var_2271 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2274 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_694 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2273;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2275;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return var_2272;
      }
      
      public function get categoryId() : int
      {
         return var_1235;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2163 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return var_2277;
      }
      
      public function get controllerCount() : int
      {
         return var_2271;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2274;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1873 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2273 = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2275 = param1;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         var_2272 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1873;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1235 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1234 = param1;
      }
      
      public function get description() : String
      {
         return var_1234;
      }
   }
}
