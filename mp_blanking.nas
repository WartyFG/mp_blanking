# needs to be an either / or of one of the following:

# blank these . . .	
	var typesToIgnore = ['[OpenRadar]', 'OpenRadar', '[ATC-pie]', 'ATC-pie'];	
	var listMP = props.globals.getNode("ai/models/").getChildren("multiplayer");
	foreach (m; listMP) {
		var thisType = m.getValue("model-short");
		foreach(typeToIgnore; typesToIgnore){
			if(thisType == typeToIgnore){
				var currentlyInvisible = m.getValue("controls/invisible");
				if(!currentlyInvisible){		
					var thisCallsign = m.getValue("callsign");
					multiplayer.dialog.toggle_ignore(thisCallsign);
				}
			} 
		}
	}
# only see these . . .	
	var typesToSee = ['SU-27', 'SU-37', 'Typhoon', 'Tornado-IDS'];	
	var listMP = props.globals.getNode("ai/models/").getChildren("multiplayer");
	foreach (m; listMP) {
		var thisType = m.getValue("model-short");
		var wantToSee = 0 ;
		foreach(typeToSee; typesToSee){ 
			if(thisType == typeToSee){ wantToSee = 1;} # make sure it will be visible
		} # end of foreach typeToSee
		if ( !wantToSee ){
			var currentlyInvisible = m.getValue("controls/invisible");
			if(!currentlyInvisible){		
				var thisCallsign = m.getValue("callsign");
				multiplayer.dialog.toggle_ignore(thisCallsign);
			}		
		}		
	} # end of foreach MP 