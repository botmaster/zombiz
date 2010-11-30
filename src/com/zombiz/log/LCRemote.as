package  {
	
	// _________________________________________________________________ //
	// <=__________________________ IMPORTS __________________________=> //
	
	
	import fl.controls.TextArea;
	import fl.controls.UIScrollBar;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.ContextMenuEvent;
	import flash.events.Event;
	import flash.net.LocalConnection;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;	

	public class LCRemote extends Sprite {

		
		// _________________________________________________________________ //
		// <=_________________________ VARIABLES _________________________=> //

		
		protected var _lc : LocalConnection;
		protected var _connectionName : String = "_defaultConnectionName";
		protected var _textField : TextField;
		protected var _textFormat : TextFormat;

		protected var _scroll:UIScrollBar;
		
		private const WELCOME_MSG:String = "                     _     _     \n  _______  _ __ ___ | |__ (_)____\n |_  / _ \\| '_ ` _ \\| '_ \\| |_  /\n  / / (_) | | | | | | |_) | |/ / \n /___\\___/|_| |_| |_|_.__/|_/___|\n\n Logger v0.1\n\n";
		
		
		// _________________________________________________________________ //
		// <=________________________ CONSTRUCTOR ________________________=> //

		
		public function LCRemote() {
			
			if ( stage )
				_init() ;
			else
				addEventListener(Event.ADDED_TO_STAGE, _init) ;
		}

		
		// _________________________________________________________________ //
		// <=_______________________ PUBLIC METHODS ______________________=> //

		
		public function print(pMessage : String, pColor : uint) : void {
			/*
			 * Le TextField ayant le défaut de scroller tout seul à chaque ajout de texte,
			 * je sauvegarde le scroll actuel pour le restituer après ajout de texte,
			 * pour les cas où l'utilisateur serait en train de lire du texte plus en amont.
			 * Mais s'il était déjà scrollé au maximum on le laisse.
			 */
			var maxScrolled : Boolean = ( _textField.scrollV == _textField.maxScrollV ) ;
			var lastScroll : int = _textField.scrollV;
			// Ajout du texte.
			_textField.appendText(pMessage + "\n") ;
			// On repositionne le scroll.
			// Note : assigner un scrollV > maxScrollV fait parfois planter le FP9.
			if ( maxScrolled || lastScroll >= _textField.maxScrollV )
				_textField.scrollV = _textField.maxScrollV;
			else _textField.scrollV = lastScroll;
			
			// On applique la couleur au texte nouvellement ajouté.
			_textFormat.color = pColor;
			_textField.setTextFormat(_textFormat, _textField.length - pMessage.length - 1, _textField.length) ;
				
			
			// MAJ de la scrollBar.
			_scroll.update ( ) ;
		}

		
		// _________________________________________________________________ //
		// <=______________________ INTERNAL METHODS _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PROTECTED METHODS _____________________=> //

		
		protected function _init( ) : void {
			removeEventListener(Event.ADDED_TO_STAGE, _init) ;
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			
			_textField = _createTextField() ;
			
			_textFormat = new TextFormat() ;
			_textFormat.font = "ProFontWindows_9pt_st";
			_textField.textColor = 0xF4F4F4;
			_textFormat.size = 9;
			_textField.defaultTextFormat = _textFormat ;
			
			_scroll = new UIScrollBar ( ) ;
			_scroll.scrollTarget = _textField;

			addChild(_textField) ;
			addChild ( _scroll ) ;

			_lc = new LocalConnection() ;
			// Sécurité, pour qu'on puisse recevoir des messages d'un swf sur un autre domaine.
			// Le nom de la connection doit aussi commencer par un underscore (et oui)...^
			_lc.allowDomain("*") ;
			_lc.allowInsecureDomain("*") ;
			_lc.client = this;
			try {
				_lc.connect(_connectionName) ;
			}
			catch ( err : Error ) {
				// Note : ce serait bien d'avoir comme des canaux qu'on pourrait utiliser en même temps
				// sans interférence.
				print("LocalConnection error : connection is already used.", 0xcccccc) ;
			}
			
			
			// Les texte de bienvenue.
			print(WELCOME_MSG, 0xCCCCCC);
			
			stage.addEventListener(Event.RESIZE, _stageResizeHandler) ;
			
			_stageResizeHandler() ;
		}

		protected function _menuClearHandler(e : ContextMenuEvent) : void {
			_textField.text = "";
			_scroll.update ( ) ;
		}

		protected function _menuSeparatorEndHandler(e : ContextMenuEvent) : void {
			print("###", 0xcccccc) ;
		}

		protected function _stageResizeHandler(e : Event = null) : void {
			_textField.width = _scroll.x = stage.stageWidth - _scroll.width;
			_textField.height = _scroll.height = stage.stageHeight;
			_scroll.update ( ) ;
			
		}

		protected function _createTextField() : TextField {
			var tf : TextField = new TextField() ;
			tf.wordWrap = true;
			tf.multiline = true;
			tf.embedFonts = true;
			
			var menu : ContextMenu = new ContextMenu() ;
			var itemClear : ContextMenuItem = new ContextMenuItem("Clear") ;
			var itemSeparatorEnd : ContextMenuItem = new ContextMenuItem("Add separator at end") ;
			itemClear.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, _menuClearHandler) ;
			itemSeparatorEnd.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, _menuSeparatorEndHandler) ;
			menu.customItems = [itemSeparatorEnd, itemClear];
			tf.contextMenu = menu;
			
			return tf;
		}
		
		
		// _________________________________________________________________ //
		// <=______________________ PRIVATE METHODS ______________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=_____________________ PUBLIC PROPERTIES _____________________=> //
		
		
		
		
		
		// _________________________________________________________________ //
		// <=____________________ INTERNAL PROPERTIES ____________________=> //
	}
}