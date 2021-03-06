package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.avatar.pets.IPetDataManager;
   import com.sulake.habbo.avatar.structure.IFigureData;
   
   public interface IAvatarRenderManager extends IUnknown
   {
       
      
      function createFigureContainer(param1:String) : AvatarFigureContainer;
      
      function get assets() : IAssetLibrary;
      
      function getFigureData(param1:String) : IFigureData;
      
      function getMandatoryAvatarPartSetIds(param1:String, param2:int) : Array;
      
      function createPetImageFromFigure(param1:String, param2:String, param3:IPetImageListener = null) : IAvatarImage;
      
      function get mode() : String;
      
      function get petDataManager() : IPetDataManager;
      
      function downloadFigure(param1:AvatarFigureContainer, param2:IAvatarImageListener) : void;
      
      function createAvatarImage(param1:String, param2:String, param3:String = null, param4:IAvatarImageListener = null) : IAvatarImage;
      
      function set mode(param1:String) : void;
      
      function isFigureReady(param1:AvatarFigureContainer) : Boolean;
      
      function createPetImage(param1:int, param2:int, param3:uint, param4:String, param5:IPetImageListener = null) : IAvatarImage;
      
      function getAssetByName(param1:String) : IAsset;
      
      function injectFigureData(param1:String, param2:XML) : void;
   }
}
