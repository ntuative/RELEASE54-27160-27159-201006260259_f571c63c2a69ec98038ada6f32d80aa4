package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1295:Array;
      
      private var var_2091:String;
      
      private var var_2090:String;
      
      private var var_2089:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1295 = param1;
         var_2091 = param2;
         var_2090 = param3;
         var_2089 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1295;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_2091;
      }
      
      public function get colourAssetName() : String
      {
         return var_2090;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_2089;
      }
   }
}
