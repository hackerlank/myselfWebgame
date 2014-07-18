package boomiui.editor
{
	import boomiui.utils.GUI;
	
	import feathers.controls.TextInput;
	import feathers.core.FeathersControl;
	import feathers.events.FeathersEventType;
	
	import mx.collections.ArrayList;
	
	public class TextInputEditor extends Editor
	{
		private var m_textInput : TextInput;
		
		private var m_label : String;
		private var m_skin : String;
		private var m_width : int;
		private var m_height : int;
		private var m_enabled : Boolean;
		
		public function TextInputEditor()
		{
			m_type = "TextInput";
			
			m_textInput = new TextInput;
			m_textInput.addEventListener(FeathersEventType.CREATION_COMPLETE , onCreateComponent);
			addChild(m_textInput)
		}
		
		override public function create():void
		{
			id = GUI.getInstanteIdNew();
			label = "TextInput";
			skin = "default_button1";
			width = 100;
			height = 50;
			enabled = true;
			alpha = 1;
		}

		override public function setStyleName(name:String, value:*):void{m_textInput[name] = value;	}
		override public function getComponent() : FeathersControl{return m_textInput;}
		
		public function get label():String{return m_label;}
		public function set label(value:String):void
		{
			m_label = value;
			m_textInput.text = value;
		}

		public function get skin():String{return m_skin;}
		public function set skin(value:String):void
		{
			m_skin = value;
//			m_button.skinInfo = SkinManager.GetButtonSkin(value);
		}

		override public function get width():Number{return m_width;}
		override public function set width(value:Number):void
		{
			m_width = value;
			m_textInput.width = m_width;
		}

		override public function get height():Number{return m_height;}
		override public function set height(value:Number):void
		{
			m_height = value;
			m_textInput.height = m_height;
		}

		public function get enabled():Boolean{return m_enabled;}
		public function set enabled(value:Boolean):void
		{
			m_enabled = value;
			m_textInput.isEnabled = value;
		}

		override public function toCopy():Editor
		{
			var _button : ButtonEditor = new ButtonEditor();
			_button.xmlToComponent(new XML(toXMLString()));
			_button.id = GUI.getInstanteIdNew();
			return _button;
		}
		
		override public function toArrayList():Array
		{
			var list : Array = new Array;
			list[0] = {"Name" : "id" , "Value" : id};
			list[1] = {"Name" : "label" , "Value" : label};
			list[2] = {"Name" : "skin" , "Value" : skin};
			list[3] = {"Name" : "x" , "Value" : x};
			list[4] = {"Name" : "y" , "Value" : y};
			list[5] = {"Name" : "width" , "Value" : width};
			list[6] = {"Name" : "height" , "Value" : height};
			list[7] = {"Name" : "enabled" , "Value" : enabled};
			list[8] = {"Name" : "alpha" , "Value" : alpha};
			
			return list;
		}
		
		override public function toXMLString():String
		{
			var xml : String = '<TextInput id="'+id+'" label="'+label+'" skin="'+skin+'" x="'+x+'" y="'+y+'" width="'+width+'" height="'+height+'" enabled="'+enabled+'" alpha="'+alpha + '"';
			var leng : int = childList.length;
			
			if(leng > 0)
			{
				xml += ">";
			}
			else
			{
				return xml += "/>";
			}
			
			var editor : Editor;
			for(var i:int=0;i<leng;i++)
			{
				editor = childList[i];
				xml += editor.toXMLString();
			}

			return xml += '</TextInput>';
		}
		
		override public function xmlToComponent(value:XML):Editor
		{
			id = GUI.getInstanteId(value.@id.toString());
			label = value.@label.toString();
			skin = value.@skin.toString();
			width = int(value.@width);
			height = int(value.@height);
			enabled = (value.@enabled.toString() == "true" ? true : false);
			alpha = Number(value.@alpha);
			x = int(value.@x);
			y = int(value.@y);
			
			return this;
		}
	}
}