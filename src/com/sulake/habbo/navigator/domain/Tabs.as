package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_630:int = 6;
      
      public static const const_219:int = 5;
      
      public static const const_697:int = 2;
      
      public static const const_320:int = 9;
      
      public static const const_299:int = 4;
      
      public static const const_273:int = 2;
      
      public static const const_533:int = 4;
      
      public static const const_208:int = 8;
      
      public static const const_618:int = 7;
      
      public static const const_292:int = 3;
      
      public static const const_355:int = 1;
      
      public static const const_224:int = 5;
      
      public static const const_450:int = 12;
      
      public static const const_309:int = 1;
      
      public static const const_723:int = 11;
      
      public static const const_642:int = 3;
      
      public static const const_1659:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_435:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_435 = new Array();
         var_435.push(new Tab(_navigator,const_355,const_450,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_435.push(new Tab(_navigator,const_273,const_309,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_435.push(new Tab(_navigator,const_299,const_723,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_986));
         var_435.push(new Tab(_navigator,const_292,const_219,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_414));
         var_435.push(new Tab(_navigator,const_224,const_208,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_604));
         setSelectedTab(const_355);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_435)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_435)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_435)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_299;
      }
      
      public function get tabs() : Array
      {
         return var_435;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
