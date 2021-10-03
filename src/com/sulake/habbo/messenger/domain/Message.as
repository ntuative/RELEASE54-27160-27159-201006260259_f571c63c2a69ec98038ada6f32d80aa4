package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_653:int = 2;
      
      public static const const_856:int = 6;
      
      public static const const_625:int = 1;
      
      public static const const_671:int = 3;
      
      public static const const_1048:int = 4;
      
      public static const const_621:int = 5;
       
      
      private var var_2308:String;
      
      private var var_1155:int;
      
      private var var_1960:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1155 = param2;
         var_1960 = param3;
         var_2308 = param4;
      }
      
      public function get time() : String
      {
         return var_2308;
      }
      
      public function get senderId() : int
      {
         return var_1155;
      }
      
      public function get messageText() : String
      {
         return var_1960;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
