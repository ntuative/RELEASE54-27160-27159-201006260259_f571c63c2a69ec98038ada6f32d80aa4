package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_76:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_252:Vector3d = null;
      
      private var var_1766:int = 0;
      
      private var var_1767:String = null;
      
      private var _category:int = 0;
      
      private var var_1768:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_1768 = param3;
         var_76 = new Vector3d();
         var_76.assign(param4);
         var_252 = new Vector3d();
         var_252.assign(param5);
         var_1766 = param6;
         var_1767 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_76;
      }
      
      public function get typeId() : int
      {
         return var_1766;
      }
      
      public function get dir() : Vector3d
      {
         return var_252;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_1767;
      }
      
      public function get operation() : String
      {
         return var_1768;
      }
      
      public function dispose() : void
      {
         var_76 = null;
         var_252 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
