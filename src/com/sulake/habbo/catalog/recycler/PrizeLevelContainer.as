package com.sulake.habbo.catalog.recycler
{
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.messages.incoming.recycler.PrizeLevelMessageData;
   import com.sulake.habbo.communication.messages.incoming.recycler.PrizeMessageData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   
   public class PrizeLevelContainer
   {
       
      
      private var var_778:Array;
      
      private var var_1469:int;
      
      public function PrizeLevelContainer(param1:PrizeLevelMessageData, param2:IHabboCatalog)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         super();
         var_1469 = param1.prizeLevelId;
         param2.localization.registerParameter("recycler.prizes.odds." + var_1469,"odds","1:" + param1.probabilityDenominator);
         var_778 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < param1.prizes.length)
         {
            _loc4_ = param1.prizes[_loc3_];
            _loc5_ = param2.getFurnitureData(_loc4_.productItemTypeId,_loc4_.productItemType);
            _loc6_ = new PrizeContainer(_loc4_.productItemType,_loc4_.productItemTypeId,_loc5_,var_1469);
            var_778.push(_loc6_);
            _loc3_++;
         }
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
