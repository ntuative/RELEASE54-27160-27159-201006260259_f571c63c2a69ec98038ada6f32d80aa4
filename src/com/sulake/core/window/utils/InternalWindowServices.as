package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_125:DisplayObject;
      
      private var var_2456:uint;
      
      private var var_876:IWindowToolTipAgentService;
      
      private var var_873:IWindowMouseScalingService;
      
      private var var_248:IWindowContext;
      
      private var var_874:IWindowFocusManagerService;
      
      private var var_872:IWindowMouseListenerService;
      
      private var var_875:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2456 = 0;
         var_125 = param2;
         var_248 = param1;
         var_875 = new WindowMouseDragger(param2);
         var_873 = new WindowMouseScaler(param2);
         var_872 = new WindowMouseListener(param2);
         var_874 = new FocusManager(param2);
         var_876 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_873;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_874;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_876;
      }
      
      public function dispose() : void
      {
         if(var_875 != null)
         {
            var_875.dispose();
            var_875 = null;
         }
         if(var_873 != null)
         {
            var_873.dispose();
            var_873 = null;
         }
         if(var_872 != null)
         {
            var_872.dispose();
            var_872 = null;
         }
         if(var_874 != null)
         {
            var_874.dispose();
            var_874 = null;
         }
         if(var_876 != null)
         {
            var_876.dispose();
            var_876 = null;
         }
         var_248 = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_872;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_875;
      }
   }
}
