package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_961:String = "inventory_badges";
      
      public static const const_1417:String = "inventory_clothes";
      
      public static const const_1350:String = "inventory_furniture";
      
      public static const const_534:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1040:String = "inventory_effects";
       
      
      private var var_1898:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_534);
         var_1898 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1898;
      }
   }
}
