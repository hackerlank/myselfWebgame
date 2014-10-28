﻿package engine.utils.compress {
	internal class ZipTag {
		internal static const LOCSIG:uint = 0x04034b50;	
		internal static const LOCHDR:uint = 30;	
		internal static const LOCVER:uint = 4;	
		internal static const LOCNAM:uint = 26;
		internal static const EXTSIG:uint = 0x08074b50;	
		internal static const EXTHDR:uint = 16;	
		internal static const CENSIG:uint = 0x02014b50;	
		internal static const CENHDR:uint = 46;	
		internal static const CENVER:uint = 6; 
		internal static const CENNAM:uint = 28; 
		internal static const CENOFF:uint = 42; 
		internal static const ENDSIG:uint = 0x06054b50;	
		internal static const ENDHDR:uint = 22;
		internal static const ENDTOT:uint = 10;	
		internal static const ENDOFF:uint = 16;
		internal static const STORED:uint = 0;
		internal static const DEFLATED:uint = 8;
	}
}
