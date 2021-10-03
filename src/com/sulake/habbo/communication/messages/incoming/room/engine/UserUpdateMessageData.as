package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_92:Number = 0;
      
      private var var_252:int = 0;
      
      private var var_2172:int = 0;
      
      private var var_2168:Number = 0;
      
      private var var_2173:Number = 0;
      
      private var var_2169:Number = 0;
      
      private var var_2170:Number = 0;
      
      private var var_2171:Boolean = false;
      
      private var var_91:Number = 0;
      
      private var _id:int = 0;
      
      private var var_242:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_242 = [];
         super();
         _id = param1;
         var_91 = param2;
         _y = param3;
         var_92 = param4;
         var_2170 = param5;
         var_252 = param6;
         var_2172 = param7;
         var_2168 = param8;
         var_2173 = param9;
         var_2169 = param10;
         var_2171 = param11;
         var_242 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_92;
      }
      
      public function get dir() : int
      {
         return var_252;
      }
      
      public function get localZ() : Number
      {
         return var_2170;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2171;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_2172;
      }
      
      public function get targetX() : Number
      {
         return var_2168;
      }
      
      public function get targetY() : Number
      {
         return var_2173;
      }
      
      public function get targetZ() : Number
      {
         return var_2169;
      }
      
      public function get x() : Number
      {
         return var_91;
      }
      
      public function get actions() : Array
      {
         return var_242.slice();
      }
   }
}
