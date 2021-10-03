package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_373:Boolean;
      
      private var var_206:String;
      
      private var var_1274:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_206 = param1;
         var_1274 = param2;
         var_373 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1274;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_373 = param1;
      }
      
      public function get text() : String
      {
         return var_206;
      }
      
      public function get visible() : Boolean
      {
         return var_373;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1274 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_206 = param1;
      }
   }
}
