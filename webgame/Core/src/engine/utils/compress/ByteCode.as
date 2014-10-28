﻿package engine.utils.compress {
	import flash.utils.*;

	public class  ByteCode {
		private static  var BIT_CHARS_ARRAY : Array = (['A','B','C','D','E','F','G','H',   
                'I','J','K','L','M','N','O','P',   
                'Q','R','S','T','U','V','W','X',   
                'Y','Z','a','b','c','d','e','f',   
                'g','h','i','j','k','l','m','n',   
                'o','p','q','r','s','t','u','v',   
                'w','x','y','z','0','1','2','3',   
                '4','5','6','7','8','9','+','/']);
		private static  var BIT_DECODE_CHARS_ARRAY : Array = ( [64, 64, 64, 64, 64, 64, 64, 64,   
                64, 64, 64, 64, 64, 64, 64, 64,   
                64, 64, 64, 64, 64, 64, 64, 64,   
                64, 64, 64, 64, 64, 64, 64, 64,   
                64, 64, 64, 64, 64, 64, 64, 64,   
                64, 64, 64, 62, 64, 64, 64, 63,   
                52, 53, 54, 55, 56, 57, 58, 59,   
                60, 61, 64, 64, 64, 64, 64, 64,   
                64,  0,  1,  2,  3,  4,  5,  6,   
                 7,  8,  9, 10, 11, 12, 13, 14,   
                15, 16, 17, 18, 19, 20, 21, 22,   
                23, 24, 25, 64, 64, 64, 64, 64,   
                64, 26, 27, 28, 29, 30, 31, 32,   
                33, 34, 35, 36, 37, 38, 39, 40,   
                41, 42, 43, 44, 45, 46, 47, 48,   
                49, 50, 51, 64, 64, 64, 64, 64]);

		public static function ByteArrayToString(data : ByteArray) : String {
			var output : String = "";
			data.position = 0;
			var data_bytesAvailable : int = data.bytesAvailable ;
			var cycle : int = data_bytesAvailable / 3;
			var dataPos : int ;
			while (cycle) {
				cycle--;
				var c : int = data[dataPos++] << 16 | data[dataPos++] << 8 | data[dataPos++];
				output += BIT_CHARS_ARRAY[ c >> 18 & 0x3f ] + BIT_CHARS_ARRAY[ c >> 12 & 0x3f ] + BIT_CHARS_ARRAY[ c >> 6 & 0x3f ] + BIT_CHARS_ARRAY[ c & 0x3f ] ;
			}
			if (data_bytesAvailable % 3 == 1) {
				output += BIT_CHARS_ARRAY[ (data[dataPos] & 0xfc) >> 2 ] + BIT_CHARS_ARRAY[ ((data[dataPos] & 0x03) << 4) ] + "==";		
			}
			else if (data_bytesAvailable % 3 == 2) {
				output += BIT_CHARS_ARRAY[ (data[dataPos] & 0xfc) >> 2 ] + BIT_CHARS_ARRAY[ ((data[dataPos++] & 0x03) << 4) | ((data[dataPos]) >> 4) ] + BIT_CHARS_ARRAY[ ((data[dataPos] & 0x0f) << 2) ] + "=";
			}
			return output;
		}

		public static function	StringToByteArray(data : String) : ByteArray {
			var output : ByteArray = new ByteArray();
			var dataBuffer_1 : int;
			var dataBuffer_2 : int;
			var dataBuffer_3 : int;
			var stringLength : int = data.length;
			output.length = (stringLength * 3 ) >> 2;
			var outputPt : int ;
			for (var i : int = 0;i < stringLength; i += 4) {
				dataBuffer_1 = BIT_DECODE_CHARS_ARRAY[( data .charCodeAt((i + 1)))] ;
				dataBuffer_2 = BIT_DECODE_CHARS_ARRAY[( data .charCodeAt((i + 2)))] ;
				dataBuffer_3 = BIT_DECODE_CHARS_ARRAY[( data .charCodeAt((i + 3)))] ;
				output[outputPt++] = ((BIT_DECODE_CHARS_ARRAY[( data .charCodeAt((i )))] << 2) + ((dataBuffer_1 & 0x30) >> 4));
				output[outputPt++] = (((dataBuffer_1 & 0x0f) << 4) + ((dataBuffer_2 & 0x3c) >> 2));
				output[outputPt++] = (((dataBuffer_2 & 0x03) << 6) + dataBuffer_3);
			}
			if (dataBuffer_2 == 64) {
				output.length -= 2;
			}else if (dataBuffer_3 == 64) {	
				output.length--;	
			}
			output.position = 0;	
			return output;
		}

		public static function dispose() : void {
			ByteCode.BIT_CHARS_ARRAY = null; 
			ByteCode.BIT_DECODE_CHARS_ARRAY = null;
		}  
	}
}
