package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_804:IAssetLoader;
      
      private var var_1297:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1297 = param1;
         var_804 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_804;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_804 != null)
            {
               if(true)
               {
                  var_804.dispose();
                  var_804 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1297;
      }
   }
}
