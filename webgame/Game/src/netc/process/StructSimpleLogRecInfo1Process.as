package netc.process
{
	import flash.utils.getQualifiedClassName;
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	import netc.packets2.StructSimpleLogRecInfo12;

	public class StructSimpleLogRecInfo1Process extends PacketBaseProcess
	{
		public function StructSimpleLogRecInfo1Process()
		{
			super();
		}

		override public function process(pack:IPacket):IPacket
		{
			var p:StructSimpleLogRecInfo12=pack as StructSimpleLogRecInfo12;
			if (null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			return p;
		}
	}
}