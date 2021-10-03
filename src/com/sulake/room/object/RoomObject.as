package com.sulake.room.object
{
   import com.sulake.room.object.logic.IRoomObjectEventHandler;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectVisualization;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomObject implements IRoomObjectController
   {
      
      private static var var_1242:int = 0;
       
      
      private var var_76:Vector3d;
      
      private var _updateID:int;
      
      private var _type:String = "";
      
      private var _visualization:IRoomObjectVisualization;
      
      private var _model:RoomObjectModel;
      
      private var var_449:IRoomObjectEventHandler;
      
      private var var_1626:Vector3d;
      
      private var _instanceId:int = 0;
      
      private var _id:int;
      
      private var var_1625:Vector3d;
      
      private var var_252:Vector3d;
      
      private var var_553:Array;
      
      public function RoomObject(param1:int, param2:int)
      {
         super();
         _id = param1;
         var_76 = new Vector3d();
         var_252 = new Vector3d();
         var_1626 = new Vector3d();
         var_1625 = new Vector3d();
         var_553 = new Array(param2);
         var _loc3_:Number = param2 - 1;
         while(_loc3_ >= 0)
         {
            var_553[_loc3_] = 0;
            _loc3_--;
         }
         _model = new RoomObjectModel();
         _visualization = null;
         var_449 = null;
         _updateID = 0;
         _instanceId = var_1242++;
      }
      
      public function getInstanceId() : int
      {
         return _instanceId;
      }
      
      public function getId() : int
      {
         return _id;
      }
      
      public function getUpdateID() : int
      {
         return _updateID;
      }
      
      public function dispose() : void
      {
         var_76 = null;
         var_252 = null;
         if(_model != null)
         {
            _model.dispose();
            _model = null;
         }
         var_553 = null;
         setVisualization(null);
         setEventHandler(null);
      }
      
      public function getType() : String
      {
         return _type;
      }
      
      public function getLocation() : IVector3d
      {
         var_1626.assign(var_76);
         return var_1626;
      }
      
      public function setLocation(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_76.x != param1.x || var_76.y != param1.y || var_76.z != param1.z)
         {
            var_76.x = param1.x;
            var_76.y = param1.y;
            var_76.z = param1.z;
            ++_updateID;
         }
      }
      
      public function setDirection(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(var_252.x != param1.x || var_252.y != param1.y || var_252.z != param1.z)
         {
            var_252.x = (param1.x % 360 + 360) % 360;
            var_252.y = (param1.y % 360 + 360) % 360;
            var_252.z = (param1.z % 360 + 360) % 360;
            ++_updateID;
         }
      }
      
      public function setType(param1:String) : void
      {
         _type = param1;
      }
      
      public function getEventHandler() : IRoomObjectEventHandler
      {
         return var_449;
      }
      
      public function getDirection() : IVector3d
      {
         var_1625.assign(var_252);
         return var_1625;
      }
      
      public function setState(param1:int, param2:int) : Boolean
      {
         if(param2 >= 0 && param2 < var_553.length)
         {
            if(var_553[param2] != param1)
            {
               var_553[param2] = param1;
               ++_updateID;
            }
            return true;
         }
         return false;
      }
      
      public function setEventHandler(param1:IRoomObjectEventHandler) : void
      {
         if(param1 == var_449)
         {
            return;
         }
         var _loc2_:IRoomObjectEventHandler = var_449;
         if(_loc2_ != null)
         {
            var_449 = null;
            _loc2_.object = null;
         }
         var_449 = param1;
         if(var_449 != null)
         {
            var_449.object = this;
         }
      }
      
      public function getState(param1:int) : int
      {
         if(param1 >= 0 && param1 < var_553.length)
         {
            return var_553[param1];
         }
         return -1;
      }
      
      public function setVisualization(param1:IRoomObjectVisualization) : void
      {
         if(param1 != _visualization)
         {
            if(_visualization != null)
            {
               _visualization.dispose();
            }
            _visualization = param1;
            if(_visualization != null)
            {
               _visualization.object = this;
            }
         }
      }
      
      public function getVisualization() : IRoomObjectVisualization
      {
         return _visualization;
      }
      
      public function getModel() : IRoomObjectModel
      {
         return _model;
      }
      
      public function getModelController() : IRoomObjectModelController
      {
         return _model;
      }
      
      public function getMouseHandler() : IRoomObjectMouseHandler
      {
         return getEventHandler();
      }
   }
}
