package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1865:int;
      
      private var var_1864:int = 0;
      
      private var var_1862:String;
      
      private var var_1863:int;
      
      private var var_1861:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1865 = param1;
         var_1863 = param2;
         var_1861 = param3;
         var_1862 = param4;
      }
      
      public function get length() : int
      {
         return var_1863;
      }
      
      public function get name() : String
      {
         return var_1861;
      }
      
      public function get creator() : String
      {
         return var_1862;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1864;
      }
      
      public function get id() : int
      {
         return var_1865;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1864 = param1;
      }
   }
}
