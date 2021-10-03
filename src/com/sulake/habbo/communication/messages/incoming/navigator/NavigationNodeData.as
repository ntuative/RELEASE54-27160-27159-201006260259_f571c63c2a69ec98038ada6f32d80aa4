package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1349:int;
      
      private var var_1545:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1349 = param1;
         var_1545 = param2;
         Logger.log("READ NODE: " + var_1349 + ", " + var_1545);
      }
      
      public function get nodeName() : String
      {
         return var_1545;
      }
      
      public function get nodeId() : int
      {
         return var_1349;
      }
   }
}
