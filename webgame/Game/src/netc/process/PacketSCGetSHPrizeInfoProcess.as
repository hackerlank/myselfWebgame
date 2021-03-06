package netc.process
{
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	
	import flash.utils.getQualifiedClassName;
	
	import netc.packets2.PacketSCGetSHPrizeInfo2;
	
	public class PacketSCGetSHPrizeInfoProcess extends PacketBaseProcess
	{
		public function PacketSCGetSHPrizeInfoProcess()
		{
			super();
		}
		
		override public function process(pack:IPacket):IPacket
		{
			var p:PacketSCGetSHPrizeInfo2=pack as PacketSCGetSHPrizeInfo2;
			if (null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			return p;
		}
	}
}