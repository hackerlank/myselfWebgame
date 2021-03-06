package netc.process
{
	import flash.utils.getQualifiedClassName;
	import engine.net.process.PacketBaseProcess;
	import engine.support.IPacket;
	import netc.packets2.StructNpcFunc2;

	public class StructNpcFuncProcess extends PacketBaseProcess
	{
		public function StructNpcFuncProcess()
		{
			super();
		}

		override public function process(pack:IPacket):IPacket
		{
			var p:StructNpcFunc2=pack as StructNpcFunc2;
			if (null == p)
			{
				throw new Error("can not canver pack for " + getQualifiedClassName(pack));
			}
			return p;
		}
	}
}