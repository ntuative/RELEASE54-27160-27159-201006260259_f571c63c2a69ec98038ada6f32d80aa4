package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1311:String = "F";
      
      public static const const_959:String = "M";
       
      
      private var var_91:Number = 0;
      
      private var var_421:String = "";
      
      private var var_2117:int = 0;
      
      private var var_1778:String = "";
      
      private var var_1777:int = 0;
      
      private var var_1779:int = 0;
      
      private var var_1780:String = "";
      
      private var var_617:String = "";
      
      private var _id:int = 0;
      
      private var var_213:Boolean = false;
      
      private var var_252:int = 0;
      
      private var var_2118:String = "";
      
      private var _name:String = "";
      
      private var var_1776:int = 0;
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_252;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_213)
         {
            var_252 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_213)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2117;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_213)
         {
            var_1777 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2118;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_213)
         {
            var_1780 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_213)
         {
            var_2118 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_213)
         {
            var_1779 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_213)
         {
            var_421 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_213)
         {
            var_2117 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_213)
         {
            var_617 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1777;
      }
      
      public function get groupID() : String
      {
         return var_1780;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_213)
         {
            var_1776 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_213)
         {
            var_1778 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_213 = true;
      }
      
      public function get sex() : String
      {
         return var_617;
      }
      
      public function get figure() : String
      {
         return var_421;
      }
      
      public function get webID() : int
      {
         return var_1776;
      }
      
      public function get custom() : String
      {
         return var_1778;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_213)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_213)
         {
            var_92 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_213)
         {
            var_91 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1779;
      }
   }
}
