package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1334:BigInteger;
      
      private var var_686:BigInteger;
      
      private var var_1591:BigInteger;
      
      private var var_1590:BigInteger;
      
      private var var_2019:BigInteger;
      
      private var var_1772:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1334 = param1;
         var_1591 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_2019.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1590 = new BigInteger();
         var_1590.fromRadix(param1,param2);
         var_2019 = var_1590.modPow(var_686,var_1334);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1772.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + var_1334.toString() + ",generator: " + var_1591.toString() + ",secret: " + param1);
         var_686 = new BigInteger();
         var_686.fromRadix(param1,param2);
         var_1772 = var_1591.modPow(var_686,var_1334);
         return true;
      }
   }
}
