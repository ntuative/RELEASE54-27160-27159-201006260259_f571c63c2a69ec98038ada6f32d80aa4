package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_840:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_840 = new Array();
         var_840.push(param1.length);
         var_840 = var_840.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_840;
      }
   }
}
