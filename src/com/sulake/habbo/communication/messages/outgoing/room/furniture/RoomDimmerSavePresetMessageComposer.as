package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_2260:int;
      
      private var var_2259:int;
      
      private var var_2382:Boolean;
      
      private var var_2384:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2383:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_2259 = param1;
         var_2260 = param2;
         var_2384 = param3;
         var_2383 = param4;
         var_2382 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2259,var_2260,var_2384,var_2383,int(var_2382)];
      }
      
      public function dispose() : void
      {
      }
   }
}
