package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_421:String;
      
      private var var_2494:String;
      
      private var var_2492:int;
      
      private var var_2491:int;
      
      private var var_617:String;
      
      private var var_1382:String;
      
      private var _name:String;
      
      private var var_562:int;
      
      private var var_964:int;
      
      private var var_2490:int;
      
      private var _respectTotal:int;
      
      private var var_2493:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2491;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1382;
      }
      
      public function get customData() : String
      {
         return this.var_2494;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_562;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2492;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2493;
      }
      
      public function get figure() : String
      {
         return this.var_421;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_617;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_421 = param1.readString();
         this.var_617 = param1.readString();
         this.var_2494 = param1.readString();
         this.var_1382 = param1.readString();
         this.var_2490 = param1.readInteger();
         this.var_2493 = param1.readString();
         this.var_2492 = param1.readInteger();
         this.var_2491 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_964 = param1.readInteger();
         this.var_562 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2490;
      }
      
      public function get respectLeft() : int
      {
         return this.var_964;
      }
   }
}
