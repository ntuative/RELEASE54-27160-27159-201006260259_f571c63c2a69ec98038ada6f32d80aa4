package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_2150:int;
      
      private var var_1469:int;
      
      private var var_778:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1469 = param1.readInteger();
         var_2150 = param1.readInteger();
         var_778 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_778.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_2150;
      }
      
      public function get prizes() : Array
      {
         return var_778;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1469;
      }
   }
}
